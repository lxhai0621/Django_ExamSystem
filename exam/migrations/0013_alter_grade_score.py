# Generated by Django 4.1.1 on 2022-10-06 11:55

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('exam', '0012_alter_choice_id_alter_fill_id_alter_judge_id'),
    ]

    operations = [
        migrations.AlterField(
            model_name='grade',
            name='score',
            field=models.PositiveSmallIntegerField(default=None, verbose_name='分数'),
        ),
    ]
