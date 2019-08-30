
if [ -f ~/.profile ] ; then
    . ~/.profile
fi

# alias
alias qp="git add . && git commit -am 'quick commit' && git push"
alias dim="docker image"
alias dco="docker container"

alias dimg="docker image"
alias dcon="docker container"
alias datt="docker attach"
alias drun="docker run"
# alias dcmp="docker-compose"
alias dls="docker image ls && docker container ls -a"
alias dcu="docker-compose up"
alias dcd="docker-compose down"

# locale
export LANG="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"
