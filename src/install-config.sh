# install tmux, zsh config
git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git "$ZSH_HOME"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-$ZSH_HOME/custom}/plugins/zsh-syntax-highlighting
# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-$ZSH_HOME/custom}/plugins/zsh-autosuggestions
ln -s $VPS_CONFIG_HOME/vps.zshrc $USER_HOME/.zshrc
ln -s $VPS_CONFIG_HOME/vps.tmux.conf $USER_HOME/.tmux.conf
ln -s $VPS_CONFIG_HOME/vps.vimrc $USER_HOME/.vimrc
ln -s $VPS_CONFIG_HOME/vps.gitconfig $USER_HOME/.gitconfig
