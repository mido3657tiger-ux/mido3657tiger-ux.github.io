#!/bin/bash
# TIGER-X DIAMOND PREIMIUM CONSOLE v1000.0
USER="mido3657tiger-ux"

while true; do
    clear
    echo -e "\e[1;33m  ████████╗██╗ ██████╗ ███████╗██████╗     ██╗  ██╗ \e[0m"
    echo -e "\e[1;33m  ╚══██╔══╝██║██╔════╝ ██╔════╝██╔══██╗    ╚██╗██╔╝ \e[0m"
    echo -e "\e[1;36m     ██║   ██║██║  ███╗█████╗  ██████╔╝     ╚███╔╝  \e[0m"
    echo -e "\e[1;36m     ██║   ██║██║   ██║██╔══╝  ██╔══██╗     ██╔██╗  \e[0m"
    echo -e "\e[1;37m     ██║   ██║╚██████╔╝███████╗██║  ██║    ██╔╝ ██╗ \e[0m"
    echo -e "\e[1;37m     ╚═╝   ╚═╝ ╚═════╝ ╚══════╝╚═╝  ╚═╝    ╚═╝  ╚═╝ \e[0m"
    
    echo -e "\e[1;33m ━━━━━━━[ DIAMOND_SYSTEM_ACTIVE ]━━━━━━━ \e[0m"
    echo -e "\e[1;34m [ OP: TIGER-X | SEC: BYPASSED | CLOUD: SYNCED ] \e[0m"
    echo -e "\e[1;30m ------------------------------------------------------------ \e[0m"
    
    echo -e "\e[1;37m >> LIVE DIRECTORY: \e[0m"
    echo -e "\e[1;32m"
    ls -p | grep -v / | column -c 80
    echo -e "\e[0m"
    echo -e "\e[1;30m ------------------------------------------------------------ \e[0m"
    
    echo -e "\e[1;33m [1] ⚡ QUICK EDIT     \e[1;36m [2] ✨ NEW PROJECT    \e[1;31m [3] 🗑️  WIPE FILE \e[0m"
    echo -e "\e[1;33m [4] 🔍 DEEP SEARCH    \e[1;36m [5] 📂 REPO MANAGER   \e[1;31m [6] 🛰️  CLONE HUB \e[0m"
    echo -e "\e[1;30m ------------------------------------------------------------ \e[0m"
    echo -e "\e[1;32m [U] 🚀 GLOBAL DEPLOY (PUSH)     [R] 🛠️  CORE SYSTEM REPAIR \e[0m"
    echo -e "\e[1;35m [S] 📊 SERVER LOGS              [Q] 💀 KILL SESSION \e[0m"
    echo -e "\e[1;30m ------------------------------------------------------------ \e[0m"
    
    echo -n -e "\e[1;33m [TIGER-X@DIAMOND_CORE]:~$ \e[0m"
    read opt
    
    case $opt in
        1) echo -n "File: "; read f; nano $f ;;
        2) echo -n "Project Name: "; read nf; touch $nf; nano $nf ;;
        3) echo -n "Target to KILL: "; read df; rm -rf $df; echo "Target Destroyed."; sleep 1 ;;
        4) echo -n "Text to find: "; read txt; grep -rnw '.' -e "$txt"; echo "Press Enter..."; read ;;
        5) echo -e "\e[1;36m >> LISTING ALL PROJECTS ON GITHUB...\e[0m"
           curl -s https://api.github.com/users/$USER/repos | grep -o '\"name\": \"[^\"]*' | cut -d'\"' -f4 | column -c 60
           echo "-----------------------------------"; echo "Press Enter..."; read ;;
        6) echo -n "Repo to Clone: "; read repo; git clone "https://github.com/$USER/$repo.git"; sleep 2 ;;
        u|U) echo -e "\e[1;33m >> LAUNCHING TO CLOUD...\e[0m"; ./up.sh ;;
        r|R) 
            git config --global credential.helper store
            git remote set-url origin "https://github.com/$USER/$USER.github.io.git"
            chmod +x *.sh
            echo "Diamond Core Repaired."; sleep 1 ;;
        s|S) git log --oneline -n 15 | sed 's/^/\e[1;32m>> \e[0m/'; echo "Press Enter..."; read ;;
        q|Q) clear; echo "Good Bye, Tiger."; exit ;;
        *) echo -e "\e[1;31m [!] ERROR: UNAUTHORIZED SELECTION \e[0m"; sleep 1 ;;
    esac
done
