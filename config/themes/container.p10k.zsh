# Powerlevel10k config for production containers.
# Pure ASCII — no Nerd Font, no special unicode, no powerline glyphs.
# Designed for minimal terminals (TERM=xterm, basic SSH, kubectl exec).

'builtin' 'local' '-a' 'p10k_config_opts'
[[ ! -o 'aliases'         ]] || p10k_config_opts+=('aliases')
[[ ! -o 'sh_glob'         ]] || p10k_config_opts+=('sh_glob')
[[ ! -o 'no_brace_expand' ]] || p10k_config_opts+=('no_brace_expand')
'builtin' 'setopt' 'no_aliases' 'no_sh_glob' 'brace_expand'

() {
  emulate -L zsh

  unset -m 'POWERLEVEL9K_*'

  autoload -Uz is-at-least && is-at-least 5.1 || return

  local grey='242'
  local red='1'
  local yellow='3'
  local blue='4'
  local cyan='6'
  local green='2'

  typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
    context                 # user@host
    kubecontext             # k8s context
    dir                     # current directory
    vcs                     # git status
    prompt_char             # prompt symbol
  )

  typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
    status                  # exit code
    command_execution_time  # previous command duration
  )

  # Transparent background, no icons, no powerline separators
  typeset -g POWERLEVEL9K_BACKGROUND=
  typeset -g POWERLEVEL9K_{LEFT,RIGHT}_{LEFT,RIGHT}_WHITESPACE=
  typeset -g POWERLEVEL9K_{LEFT,RIGHT}_SUBSEGMENT_SEPARATOR=' '
  typeset -g POWERLEVEL9K_{LEFT,RIGHT}_SEGMENT_SEPARATOR=
  typeset -g POWERLEVEL9K_VISUAL_IDENTIFIER_EXPANSION=
  typeset -g POWERLEVEL9K_MODE=ascii

  typeset -g POWERLEVEL9K_PROMPT_ADD_NEWLINE=false

  # Prompt char: ASCII only
  typeset -g POWERLEVEL9K_PROMPT_CHAR_OK_{VIINS,VICMD,VIVIS}_FOREGROUND=$green
  typeset -g POWERLEVEL9K_PROMPT_CHAR_ERROR_{VIINS,VICMD,VIVIS}_FOREGROUND=$red
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIINS_CONTENT_EXPANSION='>'
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VICMD_CONTENT_EXPANSION='<'
  typeset -g POWERLEVEL9K_PROMPT_CHAR_{OK,ERROR}_VIVIS_CONTENT_EXPANSION='V'
  typeset -g POWERLEVEL9K_PROMPT_CHAR_OVERWRITE_STATE=false

  # Context: always show user@host (important for containers)
  typeset -g POWERLEVEL9K_CONTEXT_FOREGROUND=$yellow
  typeset -g POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND=$red
  typeset -g POWERLEVEL9K_CONTEXT_TEMPLATE='%n@%m'
  typeset -g POWERLEVEL9K_CONTEXT_ROOT_TEMPLATE='%n@%m'

  # Kubecontext: prod in red, test in yellow, rest in cyan
  typeset -g POWERLEVEL9K_KUBECONTEXT_CLASSES=(
      '*prod*'  PROD
      '*test*'  TEST
      '*'       DEFAULT)
  typeset -g POWERLEVEL9K_KUBECONTEXT_DEFAULT_FOREGROUND=$cyan
  typeset -g POWERLEVEL9K_KUBECONTEXT_TEST_FOREGROUND=$yellow
  typeset -g POWERLEVEL9K_KUBECONTEXT_PROD_FOREGROUND=$red
  typeset -g POWERLEVEL9K_KUBECONTEXT_DEFAULT_CONTENT_EXPANSION=
  POWERLEVEL9K_KUBECONTEXT_DEFAULT_CONTENT_EXPANSION+='[k8s:${P9K_KUBECONTEXT_CLOUD_CLUSTER:-${P9K_KUBECONTEXT_NAME}}'
  POWERLEVEL9K_KUBECONTEXT_DEFAULT_CONTENT_EXPANSION+='${${:-/${P9K_KUBECONTEXT_NAMESPACE}}:#/default}]'
  typeset -g POWERLEVEL9K_KUBECONTEXT_PREFIX=''

  # Dir
  typeset -g POWERLEVEL9K_DIR_FOREGROUND=$blue

  # VCS / Git — ASCII indicators
  typeset -g POWERLEVEL9K_VCS_FOREGROUND=$cyan
  typeset -g POWERLEVEL9K_VCS_LOADING_TEXT=
  typeset -g POWERLEVEL9K_VCS_MAX_SYNC_LATENCY_SECONDS=0
  typeset -g POWERLEVEL9K_VCS_BRANCH_ICON=
  typeset -g POWERLEVEL9K_VCS_COMMIT_ICON='@'
  typeset -g POWERLEVEL9K_VCS_{STAGED,UNSTAGED,UNTRACKED}_ICON=
  typeset -g POWERLEVEL9K_VCS_DIRTY_ICON='*'
  typeset -g POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON=':v'
  typeset -g POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON=':^'
  typeset -g POWERLEVEL9K_VCS_{COMMITS_AHEAD,COMMITS_BEHIND}_MAX_NUM=1
  typeset -g POWERLEVEL9K_VCS_CONTENT_EXPANSION='${${${P9K_CONTENT/v* :^/v^}// }//:/ }'
  typeset -g POWERLEVEL9K_VCS_GIT_HOOKS=(vcs-detect-changes git-untracked git-aheadbehind)

  # Status
  typeset -g POWERLEVEL9K_STATUS_OK=false
  typeset -g POWERLEVEL9K_STATUS_ERROR=true
  typeset -g POWERLEVEL9K_STATUS_ERROR_FOREGROUND=$red

  # Command execution time
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_THRESHOLD=5
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_PRECISION=0
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FORMAT='d h m s'
  typeset -g POWERLEVEL9K_COMMAND_EXECUTION_TIME_FOREGROUND=$yellow

  # Virtualenv
  typeset -g POWERLEVEL9K_VIRTUALENV_FOREGROUND=$grey
  typeset -g POWERLEVEL9K_VIRTUALENV_SHOW_PYTHON_VERSION=false
  typeset -g POWERLEVEL9K_VIRTUALENV_{LEFT,RIGHT}_DELIMITER=

  typeset -g POWERLEVEL9K_TRANSIENT_PROMPT=off
  typeset -g POWERLEVEL9K_INSTANT_PROMPT=off
  typeset -g POWERLEVEL9K_DISABLE_HOT_RELOAD=true

  (( ! $+functions[p10k] )) || p10k reload
}

(( ${#p10k_config_opts} )) && setopt ${p10k_config_opts[@]}
'builtin' 'unset' 'p10k_config_opts'
