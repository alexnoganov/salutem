# Generated by Django 4.0.2 on 2022-03-22 20:08

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('user', '0008_remove_specialists_timetable'),
    ]

    operations = [
        migrations.AlterField(
            model_name='specialists',
            name='email',
            field=models.EmailField(max_length=254, verbose_name='Адрес электронной почты'),
        ),
        migrations.AlterField(
            model_name='specialists',
            name='first_name',
            field=models.CharField(max_length=150, verbose_name='Имя'),
        ),
        migrations.AlterField(
            model_name='specialists',
            name='last_name',
            field=models.CharField(max_length=150, verbose_name='Фамилия'),
        ),
        migrations.AlterField(
            model_name='specialists',
            name='patronymic',
            field=models.CharField(max_length=100, verbose_name='Отчество'),
        ),
    ]
