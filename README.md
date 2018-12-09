# script4vps

### openvz
```bash
git clone https://github.com/LomotHo/script4vps.git
cd script4vps
./openvz.sh

mv ~/.zshrc ~/.zshrc.old && ln -s ~/.lomot_dotfile/zsh/ohmyzsh/server.zshrc ~/.zshrc
```

### kvm
```bash
git clone https://github.com/LomotHo/script4vps.git
cd script4vps
./kvm.sh

mv ~/.zshrc ~/.zshrc.old && ln -s ~/.lomot_dotfile/zsh/ohmyzsh/server.zshrc ~/.zshrc
./bbr.sh
./shadowsocks-all.sh
```
