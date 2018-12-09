#!/bin/sh	


# 检查是否存在 ~/.ssh
if [ ! -d "$HOME/.ssh" ]; then
  echo "no $HOME/.ssh, mkdir ~/.ssh, chmod it to 700"
  mkdir ~/.ssh
  chmod 700 ~/.ssh
else 
  echo "$HOME/.ssh existed, chmod it to 700"
  chmod 700 ~/.ssh
fi


# 检查是否存在 ~/.ssh/authorized_keys
if [ -f "$HOME/.ssh/authorized_keys" ]; then
  echo "$HOME/.ssh/authorized_keys existed, move it to authorized_keys.orign"
  mv ~/.ssh/authorized_keys ~/.ssh/authorized_keys.orign
fi

# 复制~/.ssh/authorized_keys
echo "copy new authorized_keys"
cp ./config/authorized_keys ~/.ssh
chmod 600 ~/.ssh/authorized_keys
