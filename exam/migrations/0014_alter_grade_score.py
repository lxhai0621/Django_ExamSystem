# Generated by Django 4.1.1 on 2022-10-06 11:56

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('exam', '0013_alter_grade_score'),
    ]

    operations = [
        migrations.AlterField(
            model_name='grade',
            name='score',
            field=models.PositiveSmallIntegerField(default=0, verbose_name='分数'),
        ),
    ]
