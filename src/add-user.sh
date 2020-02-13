# add user
echo 'Add new user $USER_NAME';
adduser $USER_NAME
usermod -aG sudo $USER_NAME