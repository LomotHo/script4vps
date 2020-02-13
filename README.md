# script4vps
please replace the file ```config/authorized_keys``` & ```config/vps.gitconfig``` frist !!!


---

### openvz
```bash
git clone https://github.com/LomotHo/script4vps.git
cd script4vps
./openvz.sh
```

### kvm
```bash
git clone https://github.com/LomotHo/script4vps.git
cd script4vps
./kvm.sh
```

### ubuntu or debian
```bash
git clone https://github.com/LomotHo/script4vps.git
cd script4vps
./start.sh
# ./start.sh -cn
```

### reinstall from lomot_dotfile
```bash
git clone https://github.com/LomotHo/script4vps.git ~/.script4vps
rm -rf ~/.lomot_dotfile
rm ~/.tmux.conf
rm ~/.zshrc
ln -s ~/.script4vps/config/vps.tmux.conf ~/.tmux.conf
ln -s ~/.script4vps/config/vps.zshrc ~/.zshrc
```