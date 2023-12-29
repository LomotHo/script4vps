#if [ -f ~/.profile ]; then
#    . ~/.profile
#fi

SCRIPT4VPS_HOME=${SCRIPT4VPS_HOME:-${HOME}/.script4vps}
precmd () { print -Pn "\e]0;${USER}@${HOST}\a" }

# alias
alias qp="source ${SCRIPT4VPS_HOME}/config/utils/qp.sh"
alias setproxy="source ${SCRIPT4VPS_HOME}/config/utils/setproxy.sh"
alias ttr="tcptraceroute"

alias dim="docker image"
alias dco="docker container"

alias dimg="docker image"
alias dcon="docker container"
alias datt="docker attach"
alias drun="docker run"
# alias dcmp="docker-compose"

#   echo -e "ID\t\tIMAGE\t\t\tNAME\t\tSTATUS"; \

alias dls='docker image ls; \
    echo "===================================================="; \
    docker ps -a --format "table {{.Image}}\t{{.Status}}\t{{.Ports}}\t{{.Names}}"'

alias dcu="docker-compose up"
alias dcd="docker-compose down"

alias k="kubectl"
alias kg="kubectl get"
alias kga="kubectl get all"
alias kd="kubectl describe"
alias ka="kubectl apply"
alias kaf="kubectl apply -f"
alias kc="kubectl create"
alias kcf="kubectl create -f"
alias krm="kubectl delete"
alias kdf="kubectl delete -f"
alias kx="kubectx"
alias ken="kubens"

### locale
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

### JAVA
JAVA_HOME=/opt/jdk
JRE_HOME=/opt/jdk/jre
CLASS_PATH=.:$JAVA_HOME/lib/dt.jar:$JAVA_HOME/lib/tools.jar:$JRE_HOME/lib
PATH=$PATH:$JAVA_HOME/bin:$JRE_HOME/bin
export JAVA_HOME JRE_HOME CLASS_PATH

### nodejs
NODE_HOME=/opt/nodejs
PATH=$PATH:$NODE_HOME/bin

### golang
export GOPROXY=https://goproxy.cn,direct
export GO111MODULE=on
export GOROOT=/opt/go
GOPATH=$HOME/go
PATH=$GOROOT/bin:$GOPATH/bin:$PATH
# export PATH=$PATH:$GOROOT/bin

# ls color
# export LS_COLORS='rs=0:di=01;34:ln=01;36:mh=00:pi=40;33:so=01;35:do=01;35:bd=40;33;01:cd=40;33;01:or=40;31;01:mi=00:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.Z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;35:*.jpeg=01;35:*.mjpg=01;35:*.mjpeg=01;35:*.gif=01;35:*.bmp=01;35:*.pbm=01;35:*.pgm=01;35:*.ppm=01;35:*.tga=01;35:*.xbm=01;35:*.xpm=01;35:*.tif=01;35:*.tiff=01;35:*.png=01;35:*.svg=01;35:*.svgz=01;35:*.mng=01;35:*.pcx=01;35:*.mov=01;35:*.mpg=01;35:*.mpeg=01;35:*.m2v=01;35:*.mkv=01;35:*.webm=01;35:*.ogm=01;35:*.mp4=01;35:*.m4v=01;35:*.mp4v=01;35:*.vob=01;35:*.qt=01;35:*.nuv=01;35:*.wmv=01;35:*.asf=01;35:*.rm=01;35:*.rmvb=01;35:*.flc=01;35:*.avi=01;35:*.fli=01;35:*.flv=01;35:*.gl=01;35:*.dl=01;35:*.xcf=01;35:*.xwd=01;35:*.yuv=01;35:*.cgm=01;35:*.emf=01;35:*.ogv=01;35:*.ogx=01;35:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:'
PATH=$PATH:~/.local/bin

export PATH
