# Generated by Django 4.1.1 on 2022-09-28 10:15

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('exam', '0008_alter_class_tno'),
    ]

    operations = [
        migrations.AddField(
            model_name='teacher',
            name='password',
            field=models.CharField(default='', max_length=256, verbose_name='密码'),
        ),
    ]
