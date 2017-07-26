# 安装Python3：
![Python logo](https://www.python.org/static/img/python-logo@2x.png)
1. 下载完python3源码：Python-3.6.2.tar
2. 解压：xz -d Python-3.6.2.tar;tar Python-3.6.2.tar
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
`Collecting Django==1.11.3
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



