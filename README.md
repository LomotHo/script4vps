# script4vps

please replace the file `config/authorized_keys` & `config/vps.gitconfig` frist !!!

---

## ubuntu or debian

```bash
# apt-get update
# apt-get install apt-transport-https ca-certificates -y
# update-ca-certificates
git clone https://git.lomot.top/lomot/script4vps.git
cd script4vps
bash install.sh -cn
# USER_NAME=lomot bash install.sh
# ./start.sh -cn
```

## for root

### openvz

```bash
git clone https://git.lomot.top/lomot/script4vps.git
cd script4vps
./openvz.sh
```

### kvm

```bash
git clone https://git.lomot.top/lomot/script4vps.git
cd script4vps
./kvm.sh
```

### reinstall from lomot_dotfile

```bash
git clone https://git.lomot.top/lomot/script4vps.git ~/.script4vps
cd .script4vps/old
./reinstall-from-lomot_dotfile.sh
```
