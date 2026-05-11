#!/bin/bash
# TIGER-X IMPERIAL CONSOLE - THE BEAST MODE
USER="mido3657tiger-ux"

while true; do
    clear
    echo -e "\e[1;31m"
    echo "          _      _ "
    echo "         /\\____/\\ "
    echo "        /  O  O  \\       ████████╗██╗ ██████╗ ███████╗██████╗ "
    echo "       /   V  V   \\      ╚══██╔══╝██║██╔════╝ ██╔════╝██╔══██╗"
    echo "      /      _     \\        ██║   ██║██║  ███╗█████╗  ██████╔╝"
    echo "      \     / \    /         ██║   ██║██║   ██║██╔══╝  ██╔══██╗"
    echo "       \___/   \__/          ██║   ██║╚██████╔╝███████╗██║  ██║"
    echo "                             ╚═╝   ╚═╝ ╚═════╝ ╚══════╝╚═╝  ╚═╝"
    echo -e "\e[0m"
    echo -e "\e[1;33m ━━━━━━━━━━━━━━━━━━━[ IMPERIAL_TIGER_ACTIVE ]━━━━━━━━━━━━━━━━━━━ \e[0m"
    echo -e "\e[1;37m [ OP: TIGER-X | LVL: SUPREME | AUTH: BYPASSED | SRV: STABLE ] \e[0m"
    echo -e "\e[1;30m ------------------------------------------------------------ \e[0m"
    
    echo -e "\e[1;31m >> LIVE DIRECTORY SCAN: \e[0m"
    echo -e "\e[1;37m"
    ls -p | grep -v / | column -c 80
    echo -e "\e[0m"
    echo -e "\e[1;30m ------------------------------------------------------------ \e[0m"
    
    echo -e "\e[1;31m [1] 🔪 SLICE FILE (Edit)    \e[1;33m [2] 🧬 GENESIS (New)    \e[1;37m [3] 💀 ERASE (Delete) \e[0m"
    echo -e "\e[1;31m [4] 📡 RADAR (Search)       \e[1;33m [5] 🌪️  CLOUD LIST     \e[1;37m [6] 🛰️  ORBIT CLONE \e[0m"
    echo -e "\e[1;30m ------------------------------------------------------------ \e[0m"
    echo -e "\e[1;31m [U] 🔥 TOTAL DEPLOY (PUSH)             [R] 🛠️  SYSTEM RECON \e[0m"
    echo -e "\e[1;33m [S] 📑 DATA LOGS                       [Q] 🚪 EXIT REALITY \e[0m"
    echo -e "\e[1;30m ------------------------------------------------------------ \e[0m"
    
    echo -n -e "\e[1;31m [TIGER-X@IMPERIAL]:~$ \e[0m"
    read opt
    
    case $opt in
        1) echo -n "Target File: "; read f; nano $f ;;
        2) echo -n "New Genesis Name: "; read nf; touch $nf; nano $nf ;;
        3) echo -n "Target to ERASE: "; read df; rm -rf $df; echo "Target Neutralized."; sleep 1 ;;
        4) echo -n "Scan for Pattern: "; read txt; grep -rnw '.' -e "$txt"; echo "Press Enter..."; read ;;
        5) echo -e "\e[1;33m >> CONNECTING TO GITHUB INFRASTRUCTURE...\e[0m"
           curl -s https://api.github.com/users/$USER/repos | grep -o '\"name\": \"[^\"]*' | cut -d'\"' -f4 | column -c 60
           echo "-----------------------------------"; echo "Press Enter..."; read ;;
        6) echo -n "Repo to Orbit: "; read repo; git clone "https://github.com/$USER/$repo.git"; sleep 2 ;;
        u|U) echo -e "\e[1;31m >> INITIATING FIRE DEPLOY...\e[0m"; ./up.sh ;;
        r|R) 
            git config --global credential.helper store
            git remote set-url origin "https://github.com/$USER/$USER.github.io.git"
            chmod +x *.sh
            echo "Imperial Core Repaired."; sleep 1 ;;
        s|S) git log --oneline -n 15; echo "Press Enter..."; read ;;
        q|Q) clear; echo "The Tiger remains in the shadows."; exit ;;
        *) echo -e "\e[1;31m [!] ACCESS DENIED: INVALID INPUT \e[0m"; sleep 1 ;;
    esac
done
