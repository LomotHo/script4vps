# script4vps
please replace the file ```config/authorized_keys``` & ```config/vps.gitconfig``` frist !!!


---

## ubuntu or debian
```bash
git clone https://github.com/LomotHo/script4vps.git
cd script4vps
USER_NAME=lomot bash install.sh
# USER_NAME=lomot bash install.sh -cn
# ./start.sh -cn
```

## for root
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

### reinstall from lomot_dotfile
```bash
git clone https://github.com/LomotHo/script4vps.git ~/.script4vps
cd .script4vps/old
./reinstall-from-lomot_dotfile.sh
```