from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('user', '0004_alter_specialists_place_of_residence_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='specialists',
            name='photo',
            field=models.ImageField(blank=True, default='photos/unnamed.jpg', max_length=210, upload_to='photos/specialists/'),
        ),
    ]
