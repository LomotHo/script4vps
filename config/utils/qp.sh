#!/bin/bash
echo -e "\033[32m[quick push] \033[0m"

commit_line=localhost
if [ "$1" != '' ]; then
   commit_line=$1
else
   commit_line="quick commit"
fi

git add .
git commit -am "$commit_line"
git push
