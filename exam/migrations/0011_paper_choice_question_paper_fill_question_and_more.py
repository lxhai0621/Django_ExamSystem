# Generated by Django 4.1.1 on 2022-09-29 13:21

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('exam', '0010_alter_teacher_password'),
    ]

    operations = [
        migrations.AddField(
            model_name='paper',
            name='choice_question',
            field=models.ManyToManyField(to='exam.choice'),
        ),
        migrations.AddField(
            model_name='paper',
            name='fill_question',
            field=models.ManyToManyField(to='exam.fill'),
        ),
        migrations.AddField(
            model_name='paper',
            name='judge_question',
            field=models.ManyToManyField(to='exam.judge'),
        ),
    ]
