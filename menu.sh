#!/bin/bash
# TIGER-X GLOBAL SUPREME CONTROL
USER="mido3657tiger-ux"

while true; do
    clear
    # Giant Ultra-Wide Header
    echo -e "\e[1;36m"
    echo "  ████████╗██╗ ██████╗ ███████╗██████╗     ██╗  ██╗"
    echo "  ╚══██╔══╝██║██╔════╝ ██╔════╝██╔══██╗    ╚██╗██╔╝"
    echo "     ██║   ██║██║  ███╗█████╗  ██████╔╝     ╚███╔╝ "
    echo "     ██║   ██║██║   ██║██╔══╝  ██╔══██╗     ██╔██╗ "
    echo "     ██║   ██║╚██████╔╝███████╗██║  ██║    ██╔╝ ██╗"
    echo "     ╚═╝   ╚═╝ ╚═════╝ ╚══════╝╚═╝  ╚═╝    ╚═╝  ╚═╝"
    echo -e "\e[0m"

    echo -e "\e[1;34m ━━━━━━━━━━━━━━━━━━━━༻ \e[1;37mGOD-MODE CONSOLE\e[1;34m ༺━━━━━━━━━━━━━━━━━━━━ \e[0m"
    echo -e "\e[1;37m  SERVER: \e[1;32mONLINE \e[1;37m | REPO: \e[1;36m \e[1;37m | SECURE: \e[1;32mYES \e[0m"
    echo -e "\e[1;34m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ \e[0m"

    echo -e "\e[1;33m >> ACTIVE PROJECTS & FILES: \e[0m"
    echo -e "\e[1;37m"
    ls -p | grep -v / | column -c 100
    echo -e "\e[0m"
    echo -e "\e[1;34m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ \e[0m"

    echo -e "\e[1;36m [1] 📝 EDIT CODE       \e[1;30m- Open & Modify any file\e[0m"
    echo -e "\e[1;36m [2] ✨ CREATE PROJECT  \e[1;30m- Add a new HTML/CSS project\e[0m"
    echo -e "\e[1;31m [3] 🗑️  WIPE TARGET    \e[1;30m- Permanent file deletion\e[0m"
    echo -e "\e[1;34m [4] 🔍 DEEP SCAN      \e[1;30m- Search code inside files\e[0m"
    echo -e "\e[1;32m [5] 🌍 REPO MANAGER   \e[1;30m- View all GitHub projects\e[0m"
    echo -e "\e[1;35m [6] 🛰️  CLOUD CLONE    \e[1;30m- Pull from GitHub to local\e[0m"
    echo -e "\e[1;34m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ \e[0m"
    echo -e "\e[1;32m [U] 🚀 GLOBAL DEPLOY (PUSH)    \e[1;33m [R] 🛠️  CORE REPAIR \e[0m"
    echo -e "\e[1;31m [Q] 💀 TERMINATE SESSION       \e[1;34m [S] 📑 SYSTEM LOGS \e[0m"
    echo -e "\e[1;34m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━ \e[0m"

    echo -n -e "\e[1;36m [TIGER-X@SUPREME]:~$ \e[0m"
    read opt

    case $opt in
        1) echo -n "Filename: "; read f; nano $f ;;
        2) echo -n "New Project Name: "; read nf; touch "$nf.html"; echo "<html><body><h1>$nf</h1></body></html>" > "$nf.html"; nano "$nf.html" ;;
        3) echo -n "Target to delete: "; read df; rm -rf $df; echo "Destroyed."; sleep 1 ;;
        4) echo -n "Search pattern: "; read txt; grep -rnw '.' -e "$txt"; echo "Press Enter..."; read ;;
        5) echo -e "\e[1;36m >> FETCHING CLOUD DATA...\e[0m"; curl -s https://api.github.com/users/$USER/repos | grep -o '\"name\": \"[^\"]*' | cut -d'\"' -f4 | column -c 80; echo "Press Enter..."; read ;;
        6) echo -n "Repo to clone: "; read repo; git clone "https://github.com/$USER/$repo.git"; sleep 2 ;;
        u|U) echo -e "\e[1;32m >> DEPLOYING TO GITHUB...\e[0m"; ./up.sh ;;
        r|R) git config --global credential.helper store; git remote set-url origin "https://github.com/$USER/$USER.github.io.git"; chmod +x *.sh; echo "Core Repaired."; sleep 1 ;;
        s|S) git log --oneline -n 15; echo "Press Enter..."; read ;;
        q|Q) clear; exit ;;
        *) echo -e "\e[1;31m [!] INVALID COMMAND \e[0m"; sleep 1 ;;
    esac
done
