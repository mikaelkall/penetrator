#!/bin/bash

# Settings
WIFI_INTERFACE="wlan1mon"

COLORDEFAULT="\e[29m"
BLACK="\e[30m"
RED="\e[31m"
GREEN="\e[32m"
YELLOW="\e[33m"
BLUE="\e[34m"
MAGENTA="\e[35m"
CYAN="\e[36m"
LIGHTGRAY="\e[37m"
DARKGRAY="\e[90m"
LIGHTRED="\e[91m"
LIGHTGREEN="\e[92m"
LIGHTYELLOW="\e[93m"
LIGHTBLUE="\e[94m"
LIGHTMAGENTA="\e[95m"
LIGHTCYAN="\e[96m"
LIGHTWHITE="\e[97m"

# Special codes
#BOLD=$(tput bold)
#UNDERLINE=$(tput sgr 0 1)
#RESET=$(tput sgr0)
BOLD=""
UNDERLINE=""
RESET=""


function color.default()
{
    echo -e "\e[29m$@"
}

function color.black()
{
    echo -e "\e[30m$@"
}

function color.red()
{
    echo -e "\e[31m$@"
}

function color.green()
{
    echo -e "\e[32m$@"
}

function color.yellow()
{
    echo -e "\e[33m$@"
}

function color.blue()
{
    echo -e "\e[34m$@"
}

function color.magenda()
{
    echo -e "\e[35m$@"
}

function color.cyan()
{
    echo -e "\e[36m$@"
}

function color.lightgray()
{
    echo -e "\e[37m$@"
}

function color.darkgray()
{
    echo -e "\e[90m$@"
}

function color.lightred()
{
    echo -e "\e[91m$@"
}

function color.lightgreen()
{
    echo -e "\e[92m$@"
}

function color.lightyellow()
{
    echo -e "\e[93m$@"
}

function color.lightblue()
{
    echo -e "\e[94m$@"
}

function color.lightmagenta()
{
    echo -e "\e[95m$@"
}

function color.lightcyan()
{
    echo -e "\e[96m$@"
}

function color.lightwhite()
{
    echo -e "\e[97m$@"
}

function __puts()
{
    # Output messages in fancy colors.
    if [ "${1}" == "info" ]; then
	printf "%b%b%b\n" "\033[93m" "➜ " "${2}"
    elif [ "${1}" == "warning" ]; then 
	printf "%b%b%b\n" "\033[93m" "➜ " "${2}"
    elif [ "${1}" == "error" ]; then
	printf "%b%b%b\n" "\033[91m" "✖ " "${2}"
    elif [ "${1}" == "success" ]; then
	printf "%b%b%b\n" "\033[92m" "✔ " "${2}"
    fi 
}


trim() {
    local var="$*"
    var="${var#"${var%%[![:space:]]*}"}"
    var="${var%"${var##*[![:space:]]}"}"
    echo -n "$var"
}

function list_network()
{
   airodump-ng ${WIFI_INTERFACE} --write /tmp/wifi
}

function view_network()
{
       echo "view network"
}

function deauth_network()
{
       echo "deauth network"
}



function print_banner()
{
 color.green "${BOLD}
 ██▓███  ▓█████  ███▄    █ ▓█████▄▄▄█████▓ ██▀███   ▄▄▄     ▄▄▄█████▓ ▒█████   ██▀███  
▓██░  ██▒▓█   ▀  ██ ▀█   █ ▓█   ▀▓  ██▒ ▓▒▓██ ▒ ██▒▒████▄   ▓  ██▒ ▓▒▒██▒  ██▒▓██ ▒ ██▒
▓██░ ██▓▒▒███   ▓██  ▀█ ██▒▒███  ▒ ▓██░ ▒░▓██ ░▄█ ▒▒██  ▀█▄ ▒ ▓██░ ▒░▒██░  ██▒▓██ ░▄█ ▒
▒██▄█▓▒ ▒▒▓█  ▄ ▓██▒  ▐▌██▒▒▓█  ▄░ ▓██▓ ░ ▒██▀▀█▄  ░██▄▄▄▄██░ ▓██▓ ░ ▒██   ██░▒██▀▀█▄  
▒██▒ ░  ░░▒████▒▒██░   ▓██░░▒████▒ ▒██▒ ░ ░██▓ ▒██▒ ▓█   ▓██▒ ▒██▒ ░ ░ ████▓▒░░██▓ ▒██▒
▒▓▒░ ░  ░░░ ▒░ ░░ ▒░   ▒ ▒ ░░ ▒░ ░ ▒ ░░   ░ ▒▓ ░▒▓░ ▒▒   ▓▒█░ ▒ ░░   ░ ▒░▒░▒░ ░ ▒▓ ░▒▓░
░▒ ░      ░ ░  ░░ ░░   ░ ▒░ ░ ░  ░   ░      ░▒ ░ ▒░  ▒   ▒▒ ░   ░      ░ ▒ ▒░   ░▒ ░ ▒░
░░          ░      ░   ░ ░    ░    ░        ░░   ░   ░   ▒    ░      ░ ░ ░ ▒    ░░   ░ 
            ░  ░         ░    ░  ░           ░           ░  ░            ░ ░     ░     "                                                                                      
 color.lightyellow "WIFI cracker\t\t\t\t\t\t\t ${RED}[nighter@nighter.se]${RESET}"
 color.default ""
}

function print_usage()
{
    clear
 print_banner 
 color.green "${BOLD}General Options${RESET}"
 color.default ""
 color.red "${BOLD}${LIGHTWHITE}l${RESET}ist${RESET}${CYAN}\t|\t${LIGHTWHITE}List networks"
 color.red "${BOLD}${LIGHTWHITE}v${RESET}iew${RESET}${CYAN}\t|\t${LIGHTWHITE}View specific network"
 color.red "${BOLD}${LIGHTWHITE}d${RESET}eauth${RESET}${CYAN}\t|\t${LIGHTWHITE}Deauth client"
 color.default ""
}
