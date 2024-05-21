# Generated by Django 4.2.8 on 2024-05-21 02:11

from django.db import migrations, models


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='PopularStock',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('itemCode', models.CharField(max_length=6)),
                ('stockName', models.CharField(max_length=50)),
                ('closePrice', models.CharField(max_length=10)),
                ('compareToPreviousClosePrice', models.CharField(max_length=10)),
                ('code', models.CharField(max_length=1)),
                ('text', models.CharField(max_length=2)),
            ],
        ),
    ]
