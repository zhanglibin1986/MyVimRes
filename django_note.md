$ python -m django --version
$ django-admin startproject mysite
$ python manage.py runserver
$ python manage.py runserver 8080
python manage.py runserver 0.0.0.0:8001
$ python manage.py runserver 0:8000
$ python manage.py startapp polls
python manage.py check
python manage.py makemigrations books
python manage.py sqlmigrate books 0001
$ py manage.py migrate
django pwd：zlb198686

$ python manage.py makemigrations polls
bogon:mysite zhanglibin$ py manage.py sqlmigrate polls 0001
$ python manage.py migrate
python manage.py createsuperuser 来创建超级用户:
# python manage.py createsuperuser
Username (leave blank to use 'root'): admin
Email address: admin@w3cschool.cn
Password:
Password (again):
Superuser created successfully.
[root@solar HelloWorld]#

为了让admin界面管理某个数据模型，我们需要先注册该数据模型到admin。比如，我们之前在 TestModel 中已经创建了模型 Test 。修改 TestModel/admin.py:
from django.contrib import admin
from TestModel.models import Test

# Register your models here.
admin.site.register(Test)




