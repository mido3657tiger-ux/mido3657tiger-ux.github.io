#!/bin/bash
# TIGER-X SUPREME BEAST CONSOLE v9999
USER="mido3657tiger-ux"

while true; do
    clear
    echo -e "\e[1;31m"
    echo "         A           A"
    echo "        / \\         / \\"
    echo "       /   \\       /   \\"
    echo "      /     \\_____/     \\"
    echo "     /  /\\       /\\  \\      T I G E R  -  X"
    echo "    /  /  O      O  \  \    -------------------"
    echo "   (  (      VV      )  )    THE SUPREME LEADER"
    echo "    \  \    \__/    /  /    -------------------"
    echo "     \  \          /  /"
    echo "      \  \________/  /"
    echo "       \            /"
    echo "        \__________/"
    echo -e "\e[0m"
    echo -e "\e[1;31m ━━━━━━━[ IMPERIAL BEAST MODE : ACTIVE ]━━━━━━━ \e[0m"
    echo -e "\e[1;37m [ OP: TIGER-X | LVL: OVERLORD | CLOUD: LINKED ] \e[0m"
    echo -e "\e[1;30m ------------------------------------------------------------ \e[0m"
    
    echo -e "\e[1;31m >> SYSTEM DIRECTORY: \e[0m"
    echo -e "\e[1;37m"
    ls -p | grep -v / | column -c 80
    echo -e "\e[0m"
    echo -e "\e[1;30m ------------------------------------------------------------ \e[0m"
    
    echo -e "\e[1;31m [1] 🗡️  EDIT CODE         \e[1;31m [2] 🧬 CREATE UNIT    \e[1;37m [3] 💥 DESTROY \e[0m"
    echo -e "\e[1;31m [4] 📡 DEEP SCAN         \e[1;31m [5] 🌪️  CLOUD REPOS    \e[1;37m [6] 🛰️  CLONE HUB \e[0m"
    echo -e "\e[1;30m ------------------------------------------------------------ \e[0m"
    echo -e "\e[1;31m [U] 🔥 TOTAL DEPLOY (PUSH)              [R] 🛠️  SYSTEM REPAIR \e[0m"
    echo -e "\e[1;37m [S] 📑 CORE LOGS                        [Q] 💀 KILL SESSION \e[0m"
    echo -e "\e[1;30m ------------------------------------------------------------ \e[0m"
    
    echo -n -e "\e[1;31m [TIGER-X@OVERLORD]:~$ \e[0m"
    read opt
    
    case $opt in
        1) echo -n "Target: "; read f; nano $f ;;
        2) echo -n "Name: "; read nf; touch $nf; nano $nf ;;
        3) echo -n "Kill: "; read df; rm -rf $df; echo "Eliminated."; sleep 1 ;;
        4) echo -n "Pattern: "; read txt; grep -rnw '.' -e "$txt"; echo "Press Enter..."; read ;;
        5) echo -e "\e[1;31m >> ACCESSING CLOUD DATA...\e[0m"
           curl -s https://api.github.com/users/$USER/repos | grep -o '\"name\": \"[^\"]*' | cut -d'\"' -f4 | column -c 60
           echo "Press Enter..."; read ;;
        6) echo -n "Repo: "; read repo; git clone "https://github.com/$USER/$repo.git"; sleep 2 ;;
        u|U) echo -e "\e[1;31m >> FIRE AT WILL! DEPLOYING...\e[0m"; ./up.sh ;;
        r|R) 
            git config --global credential.helper store
            git remote set-url origin "https://github.com/$USER/$USER.github.io.git"
            chmod +x *.sh
            echo "Core Restored."; sleep 1 ;;
        s|S) git log --oneline -n 15; echo "Press Enter..."; read ;;
        q|Q) clear; exit ;;
        *) echo -e "\e[1;31m [!] ACCESS DENIED \e[0m"; sleep 1 ;;
    esac
done
