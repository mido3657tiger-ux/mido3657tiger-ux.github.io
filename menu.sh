#!/bin/bash
# TIGER-X SUPREME CYBER CONSOLE
USER="mido3657tiger-ux"

while true; do
    clear
    echo -e "\e[1;32m"
    echo "    __  _  ____  ____  ____      _  _ "
    echo "    |  | | |  _  ||  _  ||  _  |    \ \/ / "
    echo "    |  | | | |_| || |_| || |_| |     \  /  "
    echo "    |__| | |____||____||____|     /_/\_\ "
    echo -e "\e[0m"

    echo -e "\e[1;32m ━━━━━━━━━━━━━━━༻ \e[1;37mCORE SYSTEM\e[1;32m ༺━━━━━━━━━━━━━━━ \e[0m"
    echo -e "\e[1;37m  STATUS: \e[1;32mACTIVE \e[1;37m | AUTH: \e[1;32mBYPASSED \e[1;37m | RANK: \e[1;32mGOD-MODE \e[0m"
    echo -e "\e[1;30m ------------------------------------------------------------ \e[0m"

    echo -e "\e[1;32m >> SYSTEM DIRECTORY: \e[0m"
    echo -e "\e[1;37m"
    ls -p | grep -v / | column -c 80
    echo -e "\e[0m"
    echo -e "\e[1;30m ------------------------------------------------------------ \e[0m"

    echo -e "\e[1;32m [1] 📝 EDIT CODE     \e[1;30m» Modify existing files with Nano\e[0m"
    echo -e "\e[1;32m [2] ✨ NEW SOURCE    \e[1;30m» Create a fresh file or project\e[0m"
    echo -e "\e[1;32m [3] 🗑️  WIPE FILE     \e[1;30m» Permanently delete a file\e[0m"
    echo -e "\e[1;32m [4] 🔍 SEARCH SCAN   \e[1;30m» Find specific text inside files\e[0m"
    echo -e "\e[1;32m [5] 🌍 CLOUD REPOS   \e[1;30m» List all your GitHub repositories\e[0m"
    echo -e "\e[1;32m [6] 🛰️  PULL REPO     \e[1;30m» Clone projects from GitHub cloud\e[0m"
    echo -e "\e[1;30m ------------------------------------------------------------ \e[0m"
    echo -e "\e[1;37m [U] 🚀 UPLOAD (PUSH)         [R] 🛠️  REPAIR CORE \e[0m"
    echo -e "\e[1;31m [Q] 💀 TERMINATE             [S] 📑 SYSTEM LOGS \e[0m"
    echo -e "\e[1;30m ------------------------------------------------------------ \e[0m"

    echo -n -e "\e[1;32m [TIGER-X@GOD-MODE]:~$ \e[0m"
    read opt

    case $opt in
        1) echo -n "Filename: "; read f; nano $f ;;
        2) echo -n "New Filename: "; read nf; touch $nf; nano $nf ;;
        3) echo -n "Delete target: "; read df; rm -rf $df; echo "Deleted."; sleep 1 ;;
        4) echo -n "Search for: "; read txt; grep -rnw '.' -e "$txt"; echo "Press Enter..."; read ;;
        5) echo -e "\e[1;32m >> FETCHING REPOS...\e[0m"; curl -s https://api.github.com/users/$USER/repos | grep -o '\"name\": \"[^\"]*' | cut -d'\"' -f4 | column -c 60; echo "Press Enter..."; read ;;
        6) echo -n "Repo Name: "; read repo; git clone "https://github.com/$USER/$repo.git"; sleep 2 ;;
        u|U) echo -e "\e[1;32m >> PUSHING TO CLOUD...\e[0m"; ./up.sh ;;
        r|R) git config --global credential.helper store; git remote set-url origin "https://github.com/$USER/$USER.github.io.git"; chmod +x *.sh; echo "Repaired."; sleep 1 ;;
        s|S) git log --oneline -n 10; echo "Press Enter..."; read ;;
        q|Q) clear; exit ;;
        *) echo -e "\e[1;31m [!] ERROR: INVALID \e[0m"; sleep 1 ;;
    esac
done
