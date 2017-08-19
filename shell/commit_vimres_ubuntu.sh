#!/bin/bash
#用于git提交的脚本
commit(){
    cd ~/mygithub/MyVimRes
    git status
    git diff
    git add .
    git commit -m "$1"
    git push
}
if [ -z $1 ]
then
    commit -m "auto commit by shell `date`"
    echo "commit default message:auto commit by shell `date`"
else
#    echo "输入的参数是${*}"
commit $1
fi
