#!/bin/bash
# TIGER-X ULTIMATE OVERLORD EDITION
USER="mido3657tiger-ux"

while true; do
    clear
    echo -e "\e[1;36m"
    echo "         .---.             .---.          "
    echo "        /     \           /     \         "
    echo "       / /     \  _____  /     \ \        "
    echo "      / /       \/     \/       \ \       "
    echo "     / /    /\   |  O  O |   /\    \ \     "
    echo "    | |    /  \   \  ^  /   /  \    | |    "
    echo "    | |    \   \   `---'   /   /    | |    "
    echo "    | |     \   \         /   /     | |    "
    echo "    \ \      \   \       /   /      / /    "
    echo "     \ \      \   '-----'   /      / /     "
    echo "      \ \      '           '      / /      "
    echo "       \ \       T I G E R       / /       "
    echo "        \ \    - X  C O R E -   / /        "
    echo "         '---------------------'           "
    echo -e "\e[0m"

    echo -e "\e[1;35m ━━━━━━━━━━━━━━━༻ DIAMOND SYSTEM ༺━━━━━━━━━━━━━━━ \e[0m"
    echo -e "\e[1;37m  STATUS: \e[1;32mONLINE \e[1;37m | AUTH: \e[1;34mBYPASSED \e[1;37m | LEVEL: \e[1;36mGOD-MODE \e[0m"
    echo -e "\e[1;30m ------------------------------------------------------------ \e[0m"

    echo -e "\e[1;36m ⚡ CURRENT OPERATIONAL FILES: \e[0m"
    echo -e "\e[1;37m"
    ls -p | grep -v / | column -c 80
    echo -e "\e[0m"
    echo -e "\e[1;30m ------------------------------------------------------------ \e[0m"

    echo -e "\e[1;35m [1] 📝 EDIT CODE        \e[1;30m- Edit existing files\e[0m"
    echo -e "\e[1;36m [2] ✨ NEW PROJECT      \e[1;30m- Create fresh source\e[0m"
    echo -e "\e[1;31m [3] 🗑️  WIPE DATA        \e[1;30m- Delete target file\e[0m"
    echo -e "\e[1;34m [4] 🔍 DEEP SCAN        \e[1;30m- Search inside code\e[0m"
    echo -e "\e[1;32m [5] 🌍 CLOUD MANAGER    \e[1;30m- View GitHub Repos\e[0m"
    echo -e "\e[1;33m [6] 🛰️  ORBIT CLONE     \e[1;30m- Pull from Cloud\e[0m"
    echo -e "\e[1;30m ------------------------------------------------------------ \e[0m"
    echo -e "\e[1;37m [U] 🚀 TOTAL DEPLOY (PUSH)     [R] 🛠️  SYSTEM REPAIR \e[0m"
    echo -e "\e[1;31m [S] 📑 CORE LOGS               [Q] 💀 KILL SESSION \e[0m"
    echo -e "\e[1;30m ------------------------------------------------------------ \e[0m"

    echo -n -e "\e[1;35m 🔱 [TIGER-X@GOD-MODE]:~$ \e[0m"
    read opt

    case $opt in
        1) echo -n "Enter file name: "; read f; nano $f ;;
        2) echo -n "Project name: "; read nf; touch $nf; nano $nf ;;
        3) echo -n "File to wipe: "; read df; rm -rf $df; echo "Target Destroyed."; sleep 1 ;;
        4) echo -n "Search pattern: "; read txt; grep -rnw '.' -e "$txt"; echo "Press Enter..."; read ;;
        5) echo -e "\e[1;36m >> FETCHING CLOUD DATABASE...\e[0m"
           curl -s https://api.github.com/users/$USER/repos | grep -o '\"name\": \"[^\"]*' | cut -d'\"' -f4 | column -c 60
           echo "Press Enter..."; read ;;
        6) echo -n "Repo name to clone: "; read repo; git clone "https://github.com/$USER/$repo.git"; sleep 2 ;;
        u|U) echo -e "\e[1;32m >> LAUNCHING TO GITHUB...\e[0m"; ./up.sh ;;
        r|R) git config --global credential.helper store; git remote set-url origin "https://github.com/$USER/$USER.github.io.git"; chmod +x *.sh; echo "Core Repaired."; sleep 1 ;;
        s|S) git log --oneline -n 15; echo "Press Enter..."; read ;;
        q|Q) clear; exit ;;
        *) echo -e "\e[1;31m [!] INVALID COMMAND \e[0m"; sleep 1 ;;
    esac
done
