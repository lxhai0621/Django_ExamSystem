from PIL import Image, ImageDraw, ImageFont
from django.utils.six import BytesIO
import random
import hashlib
from django.shortcuts import render, redirect
from django.http import HttpResponse
from .forms import RegisterForm, EmailSend, ShowGradeForm
from django.urls import reverse
from exam import models
from django.core.mail import EmailMessage
from examsystem import settings
from django.forms.models import model_to_dict
# Create your views here.
def index(request):
    if request.session.get('is_login', None):
        sno = request.session.get('sno', None)
        student = models.Student.objects.get(sno=sno)
        exam1 = models.Exam.objects.filter(clazzs=student.clazz)
        grade1 = models.Grade.objects.filter(student__sno=sno)
        return render(request, 'index.html', {'student': student, 'exam': exam1, 'Grade': grade1})
    else:
        return render(request, 'index.html')

def studentLogin(request):
    if request.session.get('is_Login', None): #老师登录状态不能学生登录
        return redirect("/index/")
    if request.method == 'POST':
        num = request.POST.get('sno')
        password = request.POST.get('password')
        vcode1 = request.POST.get('vcode')
        student = models.Student.objects.get(sno=num)
        if hash_code(password) == student.pwd:
            vcode2 = request.session['verifycode']
            if vcode1 == vcode2:
                request.session['sno'] = num
                request.session['is_login'] = True
                exam1 = models.Exam.objects.filter(clazzs=student.clazz)
                grade = models.Grade.objects.filter(student=student.sno)
                return render(request, 'index.html', {'student': student, 'exam': exam1, 'grade': grade})
            else:
                return render(request, 'login.html', {'message': '验证码不正确'})
        else:
            return render(request, 'login.html', {'message': '密码不正确'})
    elif request.method == 'GET':
        return render(request, 'login.html')
    else:
        return HttpResponse("请使用GET或POST请求数据")

def teacherlogin(request):
    if request.session.get('is_login', None): #学生登录状态不能老师登录
        return redirect("/index/")
    if request.method == 'POST':
        tno = request.POST.get('tno')
        password = request.POST.get('password')
        vcode1 = request.POST.get('vcode')
        teacher = models.Teacher.objects.get(tno=tno)
        if password == teacher.password:
            vcode2 = request.session['verifycode']
            if vcode1 == vcode2:
                request.session['tno'] = tno
                request.session['is_Login'] = True
                return render(request, 'index.html')
            else:
                return render(request, 'teacherlogin.html', {'message': '验证码不正确'})
        else:
            return render(request, 'teacherlogin.html', {'message': '密码不正确'})
    elif request.method == 'GET':
        return render(request, 'teacherlogin.html')
    else:
        return HttpResponse("请使用GET或POST请求数据")

def studentRegister(request):
    if request.session.get('is_login', None): #学生登录状态不能学生注册
        return redirect("/index/")
    if request.session.get('is_Login', None): #老师登录状态不能学生注册
        return redirect("/index/")
    if request.method == "POST":
        register_form = RegisterForm(request.POST)
        message = ""
        vcode1 = request.POST.get('vcode')
        if register_form.is_valid():
            sno = register_form.cleaned_data['sno']
            name = register_form.cleaned_data['name']
            sex = register_form.cleaned_data['sex']
            clazz = register_form.cleaned_data['clazz']
            age = register_form.cleaned_data['age']
            pwd = register_form.cleaned_data['pwd']
            pwd2 = register_form.cleaned_data['pwd2']
            email = register_form.cleaned_data['email']
            if pwd != pwd2:
                message = "两次密码不相同!"
                return render(request, 'register.html', locals())
            else:
                vcode2 = request.session['verifycode']
                if vcode1 == vcode2:
                    same_name_user = models.Student.objects.filter(sno=sno)
                    if same_name_user:
                        message = "该账号已经存在"
                        return render(request, 'register.html', locals())
                    else:
                        clazz = models.Class.objects.get(id=clazz)
                        new_user = models.Student.objects.create(sno=sno, name=name, gender=sex, clazz=clazz, age=age, pwd=hash_code(pwd2), email=email)
                        new_user.save()
                        return render(request, 'login.html')
                else:
                    message = "验证码不正确"
                    return render(request, 'register.html', locals())
        else:
            #ErrorDict = register_form.errors
            #Error_Str = json.dumps(ErrorDict)
            #Error_Dict = json.loads(Error_Str)
            return render(request, 'register.html', locals())
    else:
        register_form = RegisterForm()
        return render(request, 'register.html', locals())

def userfile(request):
    if request.session.get('is_login', None):
        sno = request.session.get('sno', None)
        student = models.Student.objects.get(sno=sno)
        Exams = models.Exam.objects.filter(clazzs=student.clazz)
        return render(request, 'userfile.html', {'student': student, 'exam': Exams})
    if request.session.get('is_Login', None):
        tno = request.session.get('tno', None)
        teacher = models.Teacher.objects.get(tno=tno)
        return render(request, 'userfile.html', {'teacher': teacher})

def stulogout(request):
    request.session.clear()
    url = reverse('index')
    return redirect(url)

def tealogout(request):
    request.session.clear()
    url = reverse('index')
    return redirect(url)

def verify_code(request):
    bgcolor = (random.randrange(20, 100), random.randrange(20, 100), 255)
    width = 100
    height = 25
    im = Image.new('RGB', (width, height), bgcolor)
    draw = ImageDraw.Draw(im)
    for i in range(0, 100):
      xy = (random.randrange(0, width), random.randrange(0, height))
      fill = (random.randrange(0, 255), 255, random.randrange(0, 255))
      draw.point(xy, fill == fill)

    str1 = 'ABCDEFGHIJKLMNOPQRSTUVXYZ0123456789'
    rand_str = ''
    for i in range(0, 4):
      rand_str += str1[random.randrange(0, len(str1))]
      font = ImageFont.truetype('ebrima.ttf', 23)
      fontcolor = (255, random.randrange(0, 255), random.randrange(0, 255))
    draw.text((5, -3), rand_str[0], font=font, fill=fontcolor)
    draw.text((25, -3), rand_str[1], font=font, fill=fontcolor)
    draw.text((50, -3), rand_str[2], font=font, fill=fontcolor)
    draw.text((75, -3), rand_str[3], font=font, fill=fontcolor)
    del draw
    request.session['verifycode'] = rand_str
    buf = BytesIO()
    im.save(buf, 'png')
    return HttpResponse(buf.getvalue(), 'image/png')

def hash_code(s, salt='mysite'):
    h = hashlib.sha256()
    s += salt
    h.update(s.encode())
    return h.hexdigest()

def start_Exam(request):
    sno = request.GET.get('sno')
    name = request.GET.get('name')
    student = models.Student.objects.get(sno=sno)
    grade =models.Grade.objects.filter(student__sno=sno)
    exam =models.Exam.objects.get(name=name)
    for item in grade:
        if item.exam.id == exam.id:
            message = "你已经考过该考试"
            return render(request, 'index.html', {"message": message})
    request.session['exam'] = exam.id
    return render(request, 'exam.html', {'student': student, 'exam': exam})

def calGrade(request):
    if request.method == 'POST':
        sno = request.POST.get("sno")
        examname = request.POST.get("examname")
        student = models.Student.objects.get(sno=sno)
        exam = models.Exam.objects.filter(name=examname).first()
        exam1 = models.Exam.objects.filter(clazzs=student.clazz)
        choiceexam = models.Exam.objects.filter(name=examname).values('paper').values('paper__choice_question').values('paper__choice_question__id', 'paper__choice_question__right_answer', 'paper__choice_question__score', 'paper__choice_question__question')
        fillexam = models.Exam.objects.filter(name=examname).values('paper').values('paper__fill_question').values('paper__fill_question__id', 'paper__fill_question__right_answer', 'paper__fill_question__score', 'paper__fill_question__question')
        judgeexam = models.Exam.objects.filter(name=examname).values('paper').values('paper__judge_question').values('paper__judge_question__id','paper__judge_question__right_answer','paper__judge_question__score', 'paper__judge_question__question')
        grade1 = 0
        for p in choiceexam:
            qqest = str(p['paper__choice_question__question'])
            stu_ans = request.POST.get(qqest)
            ok_ans = p['paper__choice_question__right_answer']
            if stu_ans == ok_ans:
                grade1 += p['paper__choice_question__score']
        for p in fillexam:
            qqest = str(p['paper__fill_question__question'])
            stu_ans = request.POST.get(qqest)
            ok_ans = p['paper__fill_question__right_answer']
            if stu_ans == ok_ans:
                grade1 += p['paper__fill_question__score']
        for p in judgeexam:
            qqest = str(p['paper__judge_question__question'])
            stu_ans = request.POST.get(qqest)
            ok_ans = p['paper__judge_question__right_answer']
            if stu_ans == ok_ans:
                grade1 += p['paper__judge_question__score']
        grade = models.Grade.objects.create(exam=exam, student=student, score=grade1)
        del request.session['exam']
        grade2 = models.Grade.objects.filter(student__sno=sno)
        return render(request, 'index.html', {'student': student, 'exam': exam1, 'grade': grade2})

def send_email(request):
    if request.method =='POST':
        SENDEMAIL = EmailSend(request.POST)
        clazz = request.POST.get('clazz')
        contents = request.POST.get('contents')
        student = models.Student.objects.filter(clazz=clazz)
        for item in student:
            msg = EmailMessage(
                subject="通知",
                body=contents,
                from_email=settings.EMAIL_HOST_USER,
                to=[item.email]
            )
            msg.send(fail_silently=True)
        return render(request, 'index.html', locals())
    else:
        SENDEMAIL = EmailSend()
        return render(request, 'sendemail.html', locals())

def StudentQuery(request):
    if request.method =='POST':
        sno = request.POST.get('sno')
        examname = request.POST.get('examname')
        student = models.Student.objects.get(sno=sno)
        grade = models.Grade.objects.filter(exam__name=examname)
        grade1 = grade.filter(student__sno=student.sno)
        return render(request, 'StudentQuery.html', locals())
    else:
        return render(request, 'StudentQuery.html')

def ShowGrade(request):
    if request.method == 'POST':
        SHOWGRADE = ShowGradeForm(request.POST)
        clazzs=request.POST.get('clazz')
        examname = request.POST.get('EXAMNAME')
        grade1 = models.Grade.objects.filter(exam__clazzs=clazzs)
        grade = grade1.filter(exam__name=examname)
        data1 = grade.filter(exam__name=examname, score__lt=60).count()
        data2 = grade.filter(exam__name=examname, score__gte=60, score__lt=70).count()
        data3 = grade.filter(exam__name=examname, score__gte=70, score__lt=80).count()
        data4 = grade.filter(exam__name=examname, score__gte=80, score__lt=90).count()
        data5 = grade.filter(exam__name=examname, score__gte=90).count()
        data = {'data1': data1, 'data2': data2, 'data3': data3, 'data4': data4, 'data5': data5}
        return render(request, 'ShowGrade.html', locals())
    else:
        SHOWGRADE = ShowGradeForm()
        return render(request, 'ShowGrade.html', locals())

def StartExercise(request):
    choicequestion = models.Choice.objects.all()
    choicequestion2 = []
    for item in choicequestion:
        choicequestion2.append(model_to_dict(item))
    fillquestion = models.Fill.objects.all()
    fillquestion2 = []
    for item in fillquestion:
        fillquestion2.append(model_to_dict(item))
    judgequestion = models.Judge.objects.all()
    judgequestion2 = []
    for item in judgequestion:
        judgequestion2.append(model_to_dict(item))
    exercisechoice = random.sample(choicequestion2, 5)
    exercisefill = random.sample(fillquestion2, 5)
    exercisejudge = random.sample(judgequestion2, 5)
    return render(request, "exercise.html", locals())

def examrecord(request):
    sno = request.session.get('sno', None)
    student = models.Student.objects.get(sno=sno)
    exam1 = models.Exam.objects.filter(clazzs=student.clazz)
    grade1 = models.Grade.objects.filter(student__sno=sno)
    return render(request, 'examrecord.html', {'student': student, 'exam': exam1, 'Grade': grade1})






