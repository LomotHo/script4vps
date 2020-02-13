#!/bin/bash

# echo -e "\033[30m black \033[0m"
# echo -e "\033[1;30m dark_gray \033[0m"
# echo -e "\033[0;34m blue \033[0m"
# echo -e "\033[1;34m light_blue \033[0m"
# echo -e "\033[0;32m green \033[0m"
# echo -e "\033[1;32m light_green \033[0m"
# echo -e "\033[0;36m cyan \033[0m"
# echo -e "\033[1;36m light_cyan \033[0m"

# echo -e "\033[0;31m red \033[0m"
# echo -e "\033[1;31m light_red \033[0m"
# echo -e "\033[0;35m purple \033[0m"
# echo -e "\033[1;35m light_purple \033[0m"
# echo -e "\033[0;33m brown \033[0m"
# echo -e "\033[1;33m yellow \033[0m"
# echo -e "\033[0;37m light_gray \033[0m"
# echo -e "\033[1;37m white \033[0m"
log="this is a log string"
# import lib
source ../lib/color-log.sh
source ../lib/util.sh

# log-info "${1}"
# log-info "${2}"
run-script "./output-test.sh" "test"
# # check OS
# OS=$(source /etc/os-release; echo $ID)
# case $OS in
# ubuntu)
#     log-info "OS is ubuntu"
#     ;;
# debian)
#     log-info "OS is debian"
#     ;;
# *)
#     log-error "$OS OS not support"
#     exit 1
#     ;;
# esac