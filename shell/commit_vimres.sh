#!/bin/bash
#用于git提交的脚本
commit(){
    cd ~/myvimres
    git status
    git diff
    git add .
    git commit -m "$1"
    git push
}
if [ -z $1 ]
then
    echo "请在$0后输入commit message,谢谢！"
else
#    echo "输入的参数是${*}"
commit $1
fi
