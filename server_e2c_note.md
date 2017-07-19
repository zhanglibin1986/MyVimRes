# 安装Python3：
## 1.下载完python3源码：Python-3.6.2.tar
## 2.解压：xz -d Python-3.6.2.tar;tar Python-3.6.2.tar
## 3.创建安装目录$ sudo mkdir -p /usr/local/python3.6.2
## 4.指定到安装目录$ ./configure --prefix=/usr/local/python3.6.2
## 5.编译安装$ sudo make;sudo make install
    如果出错：zipimport.ZipImportError: can’t decompress data; zlib not available make: * [install] Error 1
    执行:sudo yum -y install zlib*
6.安装成功后执行$ /usr/local/python3.6.2/bin/python3检查是否安装成功
7.备份python2的执行文件：$ sudo mv /usr/bin/python /usr/bin/python.bak
8.建立以python3的软链接：$ sudo ln -s /usr/local/python3.6.2/bin/python3 /usr/bin/python
Server常用命令
    连接server：scp -i my_aws_pwd.pem  ec2-user@ec2-13-58-97-156.us-east-2.compute.amazonaws.com:~/serverpath/filename.txt ~/sampleFile.txt
    向server scp 文件：ssh -i my_aws_pwd.pem ec2-user@ec2-13-58-97-156.us-east-2.compute.amazonaws.com


