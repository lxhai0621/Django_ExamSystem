from django import forms
from exam import models
from django.contrib import auth
from django.contrib.auth.models import User

class RegisterForm(forms.Form):
    gender = (
        ('m', '男'),
        ('f', '女'),
    )
    CLASS = models.Class.objects.values_list('id', 'clazz')
    sno = forms.CharField(max_length=20, label='学号', widget=forms.TextInput(attrs={'class': 'form-control'}), error_messages={'required': '学号不能为空'})
    name = forms.CharField(max_length=20, label='姓名', widget=forms.TextInput(attrs={'class': 'form-control'}))
    sex = forms.ChoiceField(label='性别', choices=gender)
    clazz = forms.ChoiceField(label='班级', choices=CLASS)
    age = forms.IntegerField(label='年龄')
    pwd = forms.CharField(label='密码', max_length=12, min_length=6, widget=forms.TextInput(attrs={'class': 'form-control'}), error_messages={'required': '密码不能为空', 'max_length': '密码长度小于12', 'min_length': '密码长度至少为6'})
    pwd2 = forms.CharField(label='确认密码', max_length=12, min_length=6, widget=forms.TextInput(attrs={'class': 'form-control'}), error_messages={'required': '密码不能为空', 'max_length': '密码长度小于12', 'min_length': '密码长度至少为6'})
    email = forms.EmailField(max_length=20, label="邮箱", error_messages={'required': '学号不能为空', 'invalid': "邮箱格式错误"})

class EmailSend(forms.Form):
    CLASS = models.Class.objects.values_list('id', 'clazz')
    clazz = forms.ChoiceField(label='班级', choices=CLASS)
    contents = forms.CharField(max_length=500, label='通知内容', widget=forms.TextInput(attrs={'class': 'form-control'}))

class ShowGradeForm(forms.Form):
    CLASS =models.Class.objects.values_list('id', 'clazz')
    clazz = forms.ChoiceField(label='班级', choices=CLASS)
    EXAMNAME = forms.CharField(max_length=20,label='考试科目',widget=forms.TextInput(attrs={'class': 'form-control'}))


