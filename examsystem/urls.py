"""examsystem URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path,re_path
from exam import views

urlpatterns = [
    path('admin/', admin.site.urls, name='admin'),
    path('admin', admin.site.urls),
    path('', views.index),
    path('index/', views.index, name='index'),
    path('studentLogin/', views.studentLogin, name='login'),
    path('stulogout/', views.stulogout),
    path('verify_code/', views.verify_code),
    path('studentRegister/', views.studentRegister),
    path('userfile/', views.userfile),
    path('teacherlogin/', views.teacherlogin),
    path('tealogout/', views.tealogout),
    path('startExam/', views.start_Exam),
    path('sendemail/', views.send_email),
    path('startExam/calGrade', views.calGrade, name='calGrade'),
    path('StudentQuery/', views.StudentQuery, name='StudentQuery'),
    path('ShowGrade/', views.ShowGrade),
    path('StartExercise/', views.StartExercise),
    path('examrecord/', views.examrecord),
]
