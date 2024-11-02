from django.contrib import admin
from exam.models import Class, Teacher, Student, Choice, Fill, Judge, Paper, Exam, Grade
# Register your models here.
admin.site.site_header = '题库管理'
admin.site.site_title = '题库管理'

@admin.register(Student)
class StudentAdmin(admin.ModelAdmin):
    list_display = ('sno', 'name', 'gender', 'clazz', 'age', 'pwd', 'email')
    list_display_links = ('sno', 'name')
    search_fields = ['sno', 'name', 'clazz']
    list_filter = ['sno', 'name', 'clazz']

@admin.register(Teacher)
class TeacherAdmin(admin.ModelAdmin):
    list_display = ('tno', 'name', 'gender', 'password')
    list_display_links = ('tno', 'name')

@admin.register(Class)
class ClassAdmin(admin.ModelAdmin):
    list_display = ('year', 'major', 'clazz', 'tno')
    list_display_links = ('year', 'major', 'clazz')

@admin.register(Choice)
class ChoiceAdmin(admin.ModelAdmin):
    list_display = ('question', )
    list_display_links = ('question', )

@admin.register(Fill)
class FillAdmin(admin.ModelAdmin):
    list_display = ('question', )
    list_display_links = ('question', )

#@admin.register(Judge)
#class JudgeAdmin(admin.ModelAdmin):
#    list_display = ('question', )
#    list_display_links = ('question', )

#@admin.register(Paper)
#class PaperAdmin(admin.ModelAdmin):
#    list_display = ('name', 'score', 'choice_number', 'choice_question', 'fill_number', 'fill_question', 'judge_number', 'judge_question', 'level')
#    list_display_links = ('name', 'score')

admin.site.register(Paper)
admin.site.register(Exam)
#@admin.register(Exam)
#class ExamAdmin(admin.ModelAdmin):
#    list_display = ('name', 'exam_date', 'total_time', 'paper', 'major')
#    list_display_links = ('name', 'exam_date', 'paper', 'total_time', 'major')

