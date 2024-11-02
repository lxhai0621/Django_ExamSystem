from django.db import models
from django.contrib.auth.models import AbstractUser, User
# Create your models here.

"""老师表"""
class Teacher(models.Model):
    GENDER_CHOICES = (
        ('m', '男'),
        ('f', '女')
    )
    tno = models.CharField("教工号", max_length=20, primary_key=True)
    name = models.CharField("姓名", max_length=20, default="")
    gender = models.CharField("性别", max_length=1, choices=GENDER_CHOICES, default="")
    password = models.CharField("密码", max_length=256)

    class Meta:
        ordering = ['tno']
        db_table = 'teacher'
        verbose_name = '教师'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name

    """班级"""
class Class(models.Model):
    year = models.CharField("年级", max_length=20)
    major = models.CharField("专业", max_length=20)
    clazz = models.CharField("班级", max_length=20)
    tno = models.ForeignKey(Teacher, verbose_name="老师", on_delete=models.CASCADE, default="")

    class Meta:
        ordering = ['id']
        verbose_name = "班级"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.year + self.major + self.clazz

    """学生表"""
class Student(models.Model):
    GENDER_CHOICES = (
        ('m', '男'),
        ('f', '女')
    )
    sno = models.CharField("学号", max_length=20, primary_key=True)
    name = models.CharField("姓名", max_length=20, default="")
    gender = models.CharField("性别", max_length=1, choices=GENDER_CHOICES, default="")
    clazz = models.ForeignKey(Class, verbose_name="班级", on_delete=models.CASCADE, default="1")
    age = models.IntegerField("年龄")
    pwd = models.CharField("密码", max_length=256)
    email = models.EmailField("邮箱", max_length=20, default="")

    class Meta:
        ordering = ['sno']
        db_table = 'student'
        verbose_name = '学生'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name

    """选择题表"""
class Choice(models.Model):

    LEVEL_CHOICES = (
        ('1', '入门'),
        ('2', '简单'),
        ('3', '普通'),
        ('4', '较难'),
        ('5', '困难')
    )
    ANSWER_CHOICES = (
        ('A', 'A'),
        ('B', 'B'),
        ('C', 'C'),
        ('D', 'D')
    )
    id = models.CharField("题号", max_length=20, primary_key=True)
    question = models.TextField("题目", default="")
    answer_A = models.CharField("A选项", max_length=200, default="")
    answer_B = models.CharField("B选项", max_length=200, default="")
    answer_C = models.CharField("C选项", max_length=200, default="")
    answer_D = models.CharField("D选项", max_length=200, default="")
    right_answer = models.CharField("正确选项", max_length=1, choices=ANSWER_CHOICES, default="A")
    analysis = models.TextField("题目解析", default="暂无")
    score = models.PositiveSmallIntegerField("分值", default=5)
    level = models.CharField("难度等级", max_length=1, choices=LEVEL_CHOICES, default='1')

    class Meta:
        ordering = ['id']
        verbose_name = '选择题'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.question

    """填空题表"""
class Fill(models.Model):
    LEVEL_CHOICES = (
        ('1', '入门'),
        ('2', '简单'),
        ('3', '普通'),
        ('4', '较难'),
        ('5', '困难')
    )
    id = models.CharField("题号", max_length=20, primary_key=True)
    question = models.TextField("题目", default="")
    right_answer = models.CharField("正确答案", max_length=200, default="")
    analysis = models.TextField("题目解析", default="暂无")
    score = models.PositiveSmallIntegerField("分值", default=5)
    level = models.CharField("难度等级", max_length=1, choices=LEVEL_CHOICES, default='1')

    class Meta:
        ordering = ['id']
        verbose_name = '填空题'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.question

    """判断题表"""
class Judge(models.Model):
    LEVEL_CHOICES = (
        ('1', '入门'),
        ('2', '简单'),
        ('3', '普通'),
        ('4', '较难'),
        ('5', '困难')
    )
    ANSWER_CHOICES = (
        ('T', '正确'),
        ('F', '错误')
    )
    id = models.CharField("题号", max_length=20, primary_key=True)
    question = models.TextField("题目", default="")
    right_answer = models.CharField("正确答案", max_length=1, choices=ANSWER_CHOICES, default="T")
    analysis = models.TextField("题目解析", default="暂无")
    score = models.PositiveSmallIntegerField("分值", default=5)
    level = models.CharField("难度等级", max_length=1, choices=LEVEL_CHOICES, default='1')

    class Meta:
        ordering = ['id']
        verbose_name = '判断题'
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.question

    """试卷表"""
class Paper(models.Model):
    LEVEL_CHOICES = (
        ('1', '入门'),
        ('2', '简单'),
        ('3', '普通'),
        ('4', '较难'),
        ('5', '困难')
    )
    name = models.CharField("试卷名称", max_length=20, default="")
    score = models.PositiveSmallIntegerField("总分", default=100)
    choice_number = models.PositiveSmallIntegerField("选择题数", default=5)
    choice_question = models.ManyToManyField(Choice)
    fill_number = models.PositiveSmallIntegerField("填空题数", default=5)
    fill_question = models.ManyToManyField(Fill)
    judge_number = models.PositiveSmallIntegerField("判断题数", default=10)
    judge_question = models.ManyToManyField(Judge)
    level = models.CharField("难度等级", max_length=1, choices=LEVEL_CHOICES, default="1")

    class Meta:
        ordering = ["id"]
        verbose_name = "试卷"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name

    def save(self, *args, **kwargs):
        self.score = (self.choice_number + self.fill_number + self.judge_number) * 5
        super().save(*args, **kwargs)

        """考试表"""
class Exam(models.Model):
    name = models.CharField("考试名称", max_length=20, default="")
    exam_date = models.DateField("考试日期", default="")
    total_time = models.PositiveSmallIntegerField("时长", default=120, help_text="时长按照分钟填写")
    paper = models.OneToOneField(Paper, on_delete=models.CASCADE, verbose_name="试卷", default="")
    major = models.CharField("专业", max_length=20, default="")
    clazzs = models.ManyToManyField(Class, verbose_name="参加考试的班级")

    class Meta:
        ordering = ["id"]
        db_table = 'exam_info'
        verbose_name = "考试"
        verbose_name_plural = verbose_name

    def __str__(self):
        return self.name

    """成绩表"""
class Grade(models.Model):
    exam = models.ForeignKey(Exam, verbose_name="考试", on_delete=models.CASCADE)
    student = models.ForeignKey(Student, verbose_name="学生", on_delete=models.CASCADE)
    score = models.PositiveSmallIntegerField("分数", default=0)

    class Meta:
        verbose_name = '学生成绩'
        verbose_name_plural = '学生成绩'

    def __str__(self):
        return f'{self.id}的{self.student}为{self.score}分'

