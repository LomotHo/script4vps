### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing DHARMA Initiative Plugin Manager (zdharma/zinit)…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk

USER_HOME=~
SCRIPT4VPS_HOME=$USER_HOME/.script4vps
VPS_CONFIG_HOME=$USER_HOME/.script4vps/config
SCRIPT4VPS_ZSH_SNIPPETS_HOME=~/.script4vps/config/zinit_snippets
# 快速目录跳转
# zinit ice lucid wait='1'
# zinit light skywind3000/z.lua

# 语法高亮
zinit ice lucid wait='0' atinit='zpcompinit' from"gitee.com"
zinit light lomot/fast-syntax-highlighting

# 自动建议
# zinit ice lucid wait="0" atload='_zsh_autosuggest_start'
# zinit light zsh-users/zsh-autosuggestions

# 补全
# zinit ice lucid wait='0'
# zinit light zsh-users/zsh-completions

# 加载 OMZ 框架及部分插件
zinit snippet ${SCRIPT4VPS_ZSH_SNIPPETS_HOME}/lib/history.zsh
zinit snippet ${SCRIPT4VPS_ZSH_SNIPPETS_HOME}/lib/completion.zsh
zinit snippet ${SCRIPT4VPS_ZSH_SNIPPETS_HOME}/lib/key-bindings.zsh
zinit snippet ${SCRIPT4VPS_ZSH_SNIPPETS_HOME}/lib/theme-and-appearance.zsh
zinit snippet ${SCRIPT4VPS_ZSH_SNIPPETS_HOME}/lib/grep.zsh
zinit snippet ${SCRIPT4VPS_ZSH_SNIPPETS_HOME}/plugins/colored-man-pages/colored-man-pages.plugin.zsh
zinit snippet ${SCRIPT4VPS_ZSH_SNIPPETS_HOME}/plugins/sudo/sudo.plugin.zsh
zinit snippet ${SCRIPT4VPS_ZSH_SNIPPETS_HOME}/plugins/common-aliases/common-aliases.plugin.zsh

# zinit ice svn
# zinit snippet OMZ::plugins/extract

zinit ice lucid wait='1'
zinit snippet ${SCRIPT4VPS_ZSH_SNIPPETS_HOME}/plugins/git/git.plugin.zsh

# 加载 powerlevel10k 主题
zinit ice depth=1 from"gitee.com";
zinit light lomot/powerlevel10k

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
source ${VPS_CONFIG_HOME}/vps.profile
