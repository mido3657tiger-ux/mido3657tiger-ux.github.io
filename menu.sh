#!/bin/bash
# TIGER-X NEON MASTERPIECE v10.0
USER="mido3657tiger-ux"

while true; do
    clear
    echo -e "\e[1;32m"
    echo "          _                 _ "
    echo "         /_\_______________/_\"
    echo "        |  _     TIGER     _  |"
    echo "        | | \____  -  ____/ | |"
    echo "        | |  /          \  | |"
    echo "        | | /  O      O  \ | |"
    echo "        | | \     ^      / | |"
    echo "        | |  \__________/  | |"
    echo "        | |________________| |"
    echo "         \_               _/"
    echo "           \_____________/"
    echo -e "\e[0m"

    echo -e "\e[1;35m ━━━━━━━༻ \e[1;37mTHE GODFATHER CONSOLE\e[1;35m ༺━━━━━━━ \e[0m"
    echo -e "\e[1;36m  ID: \e[1;37m \e[1;36m | OP: \e[1;32mONLINE \e[1;36m | MODE: \e[1;33mMASTER \e[0m"
    echo -e "\e[1;30m ------------------------------------------------------------ \e[0m"

    echo -e "\e[1;32m 📂 ACTIVE DIRECTORY FILES: \e[0m"
    echo -e "\e[1;37m"
    ls -p | grep -v / | column -c 80
    echo -e "\e[0m"
    echo -e "\e[1;30m ------------------------------------------------------------ \e[0m"

    echo -e "\e[1;37m [1] 📝 \e[1;32mEDIT CODE\e[0m       \e[1;30m» لتعديل أي ملف حالي بالنانو\e[0m"
    echo -e "\e[1;37m [2] ✨ \e[1;36mNEW PROJECT\e[0m     \e[1;30m» لإنشاء ملف أو مشروع جديد\e[0m"
    echo -e "\e[1;37m [3] 🗑️  \e[1;31mWIPE DATA\e[0m       \e[1;30m» لحذف ملف نهائياً من الجهاز\e[0m"
    echo -e "\e[1;37m [4] 🔍 \e[1;34mDEEP SCAN\e[0m       \e[1;30m» للبحث عن كلمة داخل الأكواد\e[0m"
    echo -e "\e[1;37m [5] 🌍 \e[1;35mCLOUD VIEW\e[0m      \e[1;30m» لعرض مشاريعك على جيت هاب\e[0m"
    echo -e "\e[1;37m [6] 🛰️  \e[1;33mORBIT CLONE\e[0m     \e[1;30m» لسحب مشروع من السحابة\e[0m"
    echo -e "\e[1;30m ------------------------------------------------------------ \e[0m"
    echo -e "\e[1;32m [U] 🚀 PUSH TO GITHUB     \e[1;33m [R] 🛠️  FIX SYSTEM ERROR \e[0m"
    echo -e "\e[1;31m [Q] 💀 KILL TERMINAL      \e[1;34m [S] 📑 VIEW HISTORY LOGS \e[0m"
    echo -e "\e[1;30m ------------------------------------------------------------ \e[0m"

    echo -n -e "\e[1;32m 🔱 [TIGER-X@SYSTEM]:~$ \e[0m"
    read opt

    case $opt in
        1) echo -n "Enter file name: "; read f; nano $f ;;
        2) echo -n "New project name: "; read nf; touch $nf; nano $nf ;;
        3) echo -n "File to delete: "; read df; rm -rf $df; echo "Target Deleted."; sleep 1 ;;
        4) echo -n "Search for: "; read txt; grep -rnw '.' -e "$txt"; echo "Press Enter..."; read ;;
        5) echo -e "\e[1;36m >> FETCHING REPOS...\e[0m"; curl -s https://api.github.com/users/$USER/repos | grep -o '\"name\": \"[^\"]*' | cut -d'\"' -f4 | column -c 60; echo "Press Enter..."; read ;;
        6) echo -n "Repo name: "; read repo; git clone "https://github.com/$USER/$repo.git"; sleep 2 ;;
        u|U) echo -e "\e[1;32m >> DEPLOYING...\e[0m"; ./up.sh ;;
        r|R) git config --global credential.helper store; git remote set-url origin "https://github.com/$USER/$USER.github.io.git"; chmod +x *.sh; echo "Repaired."; sleep 1 ;;
        s|S) git log --oneline -n 10; echo "Press Enter..."; read ;;
        q|Q) clear; exit ;;
        *) echo -e "\e[1;31m [!] INVALID \e[0m"; sleep 1 ;;
    esac
done
