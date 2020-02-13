
# add ssh key
# check if $USER_HOME/.ssh exist
if [ ! -d "$USER_HOME/.ssh" ]; then
  log-info "no $USER_HOME/.ssh, mkdir $USER_HOME/.ssh, chmod it to 700"
  mkdir $USER_HOME/.ssh
  chmod 700 $USER_HOME/.ssh
else
  log-info "$USER_HOME/.ssh existed, chmod it to 700"
  chmod 700 $USER_HOME/.ssh
fi
log-info "******copy new authorized_keys******"
cp $VPS_CONFIG_HOME/authorized_keys $USER_HOME/.ssh
chmod 600 $USER_HOME/.ssh/authorized_keys
