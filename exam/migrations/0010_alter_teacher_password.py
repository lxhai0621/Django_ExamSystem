# Generated by Django 4.1.1 on 2022-09-28 10:15

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('exam', '0009_teacher_password'),
    ]

    operations = [
        migrations.AlterField(
            model_name='teacher',
            name='password',
            field=models.CharField(max_length=256, verbose_name='密码'),
        ),
    ]