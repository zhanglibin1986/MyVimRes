# 安装Python3：
![Python logo](https://www.python.org/static/img/python-logo@2x.png)
1. 下载完python3源码：Python-3.6.2.tar
2. 解压：xz -d Python-3.6.2.tar;tar xvf Python-3.6.2.tar
3. 创建安装目录$ sudo mkdir -p /usr/local/python3.6.2
4. 指定到安装目录$ ./configure --prefix=/usr/local/python3.6.2
5. 编译安装$ sudo make;sudo make install
     * 如果出错：zipimport.ZipImportError: can’t decompress data; zlib not available make: * [install] Error 1
     * 执行:sudo yum -y install zlib*
6. 安装成功后执行$ /usr/local/python3.6.2/bin/python3检查是否安装成功
7. 备份python2的执行文件：$ sudo mv /usr/bin/python /usr/bin/python.bak
8. 建立以python3的软链接：$ sudo ln -s /usr/local/python3.6.2/bin/python3 /usr/bin/python
# Server常用命令
* 连接server：   
` scp -i my_aws_pwd.pem  ec2-user@ec2-13-58-97-156.us-east-2.compute.amazonaws.com:~/serverpath/filename.txt ~/sampleFile.txt `  
* 向server scp 文件：  
`ssh -i my_aws_pwd.pem ec2-user@ec2-13-58-97-156.us-east-2.compute.amazonaws.com`
# 安装Django
## 遇到的问题
* $ pip3 install Django==1.11.2  
    `pip is configured with locations that require TLS/SSL, however the ssl module in Python is not available.
Collecting Django==1.11.2
  Could not fetch URL https://pypi.python.org/simple/django/: There was a problem confirming the ssl certificate: Can't connect to HTTPS URL because the SSL module is not available. - skipping
  Could not find a version that satisfies the requirement Django==1.11.2 (from versions: )
No matching distribution found for Django==1.11.2`

* 或者  
` Collecting Django==1.11.3
  Using cached Django-1.11.3-py2.py3-none-any.whl
Collecting pytz (from Django==1.11.3)
  Using cached pytz-2017.2-py2.py3-none-any.whl
Installing collected packages: pytz, Django
Exception:
Traceback (most recent call last):
  File "/usr/local/python3.6.2/lib/python3.6/site-packages/pip/basecommand.py", line 215, in main
    status = self.run(options, args)
  File "/usr/local/python3.6.2/lib/python3.6/site-packages/pip/commands/install.py", line 342, in run
    prefix=options.prefix_path,
  File "/usr/local/python3.6.2/lib/python3.6/site-packages/pip/req/req_set.py", line 784, in install
    **kwargs
  File "/usr/local/python3.6.2/lib/python3.6/site-packages/pip/req/req_install.py", line 851, in install
    self.move_wheel_files(self.source_dir, root=root, prefix=prefix)
  File "/usr/local/python3.6.2/lib/python3.6/site-packages/pip/req/req_install.py", line 1064, in move_wheel_files
    isolated=self.isolated,
  File "/usr/local/python3.6.2/lib/python3.6/site-packages/pip/wheel.py", line 345, in move_wheel_files
    clobber(source, lib_dir, True)
  File "/usr/local/python3.6.2/lib/python3.6/site-packages/pip/wheel.py", line 316, in clobber
    ensure_dir(destdir)
  File "/usr/local/python3.6.2/lib/python3.6/site-packages/pip/utils/__init__.py", line 83, in ensure_dir
    os.makedirs(path)
  File "/usr/local/python3.6.2/lib/python3.6/os.py", line 220, in makedirs
    mkdir(name, mode)
PermissionError: [Errno 13] 权限不够: '/usr/local/python3.6.2/lib/python3.6/site-packages/pytz-2017.2.dist-info'`

## 解决方案
* 第一种错误：
尝试执行命令：rpm -aq|grep openssl;  
sudo yum install openssl-devel -y;  
rpm -aq|grep openssl   
之后删除/usr/local/python3.6.3/* 重新编译python3;再安装django，遇到第二种错误。
* 第二种错误
1. sudo su
2. ln -s /usr/local/python3.6.2/bin/pip3 /usr/bin/pip3
3. pip3 install Django==1.11.3  
**成功!!**


## 新建django项目
[ec2-user@ip-172-31-8-36 workspace]$ django-admin startproject mysite  
[ec2-user@ip-172-31-8-36 mysite]$ python manage.py runserver 0:8000  
* 遇到问题  
` Unhandled exception in thread started by <function check_errors.<locals>.wrapper at 0x7fea9b6b7bf8>  
Traceback (most recent call last):  
File "/usr/local/python3.6.2/lib/python3.6/site-packages/django/db/backends/sqlite3/base.py", line 31, in <module>  
from pysqlite2 import dbapi2 as Database  
ModuleNotFoundError: No module named 'pysqlite2'  
During handling of the above exception, another exception occurred:  
Traceback (most recent call last):  
  File "/usr/local/python3.6.2/lib/python3.6/site-packages/django/db/backends/sqlite3/base.py", line 33, in <module>  
    from sqlite3 import dbapi2 as Database  
  File "/usr/local/python3.6.2/lib/python3.6/sqlite3/__init__.py", line 23, in <module>  
    from sqlite3.dbapi2 import *  
  File "/usr/local/python3.6.2/lib/python3.6/sqlite3/dbapi2.py", line 27, in <module>  
    from _sqlite3 import *  
ModuleNotFoundError: No module named '_sqlite3'  
During handling of the above exception, another exception occurred:  
  File "/usr/local/python3.6.2/lib/python3.6/site-packages/django/contrib/auth/models.py", line 4, in <module>
    from django.contrib.auth.base_user import AbstractBaseUser, BaseUserManager
  File "/usr/local/python3.6.2/lib/python3.6/site-packages/django/contrib/auth/base_user.py", line 52, in <module>
    class AbstractBaseUser(models.Model):
  File "/usr/local/python3.6.2/lib/python3.6/site-packages/django/db/models/base.py", line 124, in __new__
    new_class.add_to_class('_meta', Options(meta, app_label))
  File "/usr/local/python3.6.2/lib/python3.6/site-packages/django/db/models/base.py", line 331, in add_to_class
    value.contribute_to_class(cls, name)
  File "/usr/local/python3.6.2/lib/python3.6/site-packages/django/db/models/options.py", line 214, in contribute_to_class
    self.db_table = truncate_name(self.db_table, connection.ops.max_name_length())
  File "/usr/local/python3.6.2/lib/python3.6/site-packages/django/db/__init__.py", line 33, in __getattr__
    return getattr(connections[DEFAULT_DB_ALIAS], item)
  File "/usr/local/python3.6.2/lib/python3.6/site-packages/django/db/utils.py", line 211, in __getitem__
    backend = load_backend(db['ENGINE'])
  File "/usr/local/python3.6.2/lib/python3.6/site-packages/django/db/utils.py", line 115, in load_backend
    return import_module('%s.base' % backend_name)
  File "/usr/local/python3.6.2/lib/python3.6/importlib/__init__.py", line 126, in import_module
    return _bootstrap._gcd_import(name[level:], package, level)
  File "/usr/local/python3.6.2/lib/python3.6/site-packages/django/db/backends/sqlite3/base.py", line 35, in <module>
    raise ImproperlyConfigured("Error loading either pysqlite2 or sqlite3 modules (tried in that order): %s" % exc)
django.core.exceptions.ImproperlyConfigured: Error loading either pysqlite2 or sqlite3 modules (tried in that order): No module named '_sqlite3'`
* 解决问题：
    * yum install sqlite-devel
    * 重新安装python3....
        * 注意重新安装时在./configure --prefix=/usr/local/python3.6.2之后要执行一句?:   
        `./configure --enable-loadable-sqlite-extensions`
        * 重装python3后需要重新安装django:  
            ` pip3 install Django==1.11.3`

## 安装常用命令工具
### httpie
`sudo pip3 install httpie`
* 安装Git:  
`sudo yum install git-core`

### supervisor
1. 安装supervisor。  
   `pip install supervisor`  
2. 创建配置文件
Once the Supervisor installation has completed, run echo_supervisord_conf. This will print a “sample” Supervisor configuration file to your terminal’s stdout.  

Once you see the file echoed to your terminal, reinvoke the command as echo_supervisord_conf > /etc/supervisord.conf. This won’t work if you do not have root access.  
安装好奥supervisor之后执行echo_supervisord_conf命令，屏幕上会显示一个配置文件的例子，再执行echo_supervisord_conf > /etc/supervisord.conf即可创建出配置文件。
由于权限问题，你可能会创建失败，所以可以创建到当前目录下。echo_supervisord_conf > supervisord.conf

3. 执行pip uninstall supervisor之后，再安装出现异常    

`copying supervisor/tests/fixtures/unkillable_spew.py -> build/lib/supervisor/tests/fixtures
    running install_lib
    copying supervisor/states.py -> /usr/local/lib/python2.7/site-packages/supervisor
    error: [Errno 13] Permission denied: '/usr/local/lib/python2.7/site-packages/supervisor'

    ----------------------------------------
Command "/usr/bin/python2.7 -u -c "import setuptools, tokenize;__file__='/tmp/pip-build-AxBA1n/supervisor/setup.py';f=getattr(tokenize, 'open', open)(__file__);code=f.read().replace('\r\n', '\n');f.close();exec(compile(code, __file__, 'exec'))" install --record /tmp/pip-5rlJEn-record/install-record.txt --single-version-externally-managed --compile" failed with error code 1 in /tmp/pip-build-AxBA1n/supervisor/`

4. 于是就是aws上又新建了一个免费的实例~~


