# Generated by Django 4.0.2 on 2022-02-22 23:03

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('user', '0001_initial'),
    ]

    operations = [
        migrations.AlterModelOptions(
            name='specialistgroup',
            options={'verbose_name': 'Группа', 'verbose_name_plural': 'Группы'},
        ),
        migrations.AlterModelOptions(
            name='specialists',
            options={'permissions': (('edit_analyzes', 'Может редактировать анализы'),), 'verbose_name': 'Специалист', 'verbose_name_plural': 'Специалисты'},
        ),
    ]
