#!/bin/bash
# TIGER-X SUPREME CONSOLE - CLEAN & ELITE
USER="mido3657tiger-ux"

while true; do
    clear
    echo -e "\e[1;36m"
    echo "       /\____/\"
    echo "      /  O  O  \"
    echo "     (    ==    )   T I G E R  -  X"
    echo "      \  WWWW  /   -----------------"
    echo "       \______/     SUPREME COMMAND"
    echo -e "\e[0m"

    echo -e "\e[1;34m ━━━━━━━━━━━━━━━━━━༻ \e[1;37mELITE SYSTEM\e[1;34m ༺━━━━━━━━━━━━━━━━━━ \e[0m"
    echo -e "\e[1;37m  STATUS: \e[1;32mONLINE \e[1;37m | AUTH: \e[1;36mBYPASSED \e[1;37m | RANK: \e[1;33mGOD-MODE \e[0m"
    echo -e "\e[1;30m ------------------------------------------------------------ \e[0m"

    echo -e "\e[1;32m 📂 CURRENT PROJECT FILES: \e[0m"
    echo -e "\e[1;37m"
    ls -p | grep -v / | column -c 80
    echo -e "\e[0m"
    echo -e "\e[1;30m ------------------------------------------------------------ \e[0m"

    echo -e "\e[1;36m [1] 📝 EDIT CODE      \e[1;30m» تعديل الأكواد والملفات الحالية\e[0m"
    echo -e "\e[1;36m [2] ✨ NEW SOURCE     \e[1;30m» إنشاء ملف أو مشروع جديد فوري\e[0m"
    echo -e "\e[1;31m [3] 🗑️  WIPE FILE      \e[1;30m» حذف ملف نهائياً من النظام\e[0m"
    echo -e "\e[1;34m [4] 🔍 DEEP SCAN      \e[1;30m» بحث شامل عن كلمة داخل الملفات\e[0m"
    echo -e "\e[1;32m [5] 🌍 CLOUD REPOS    \e[1;30m» عرض كل مشاريعك على GitHub\e[0m"
    echo -e "\e[1;33m [6] 🛰️  ORBIT PULL     \e[1;30m» سحب (Clone) أي مشروع من السحابة\e[0m"
    echo -e "\e[1;30m ------------------------------------------------------------ \e[0m"
    echo -e "\e[1;32m [U] 🚀 PUSH TO CLOUD     \e[1;33m [R] 🛠️  SYSTEM REPAIR \e[0m"
    echo -e "\e[1;31m [Q] 💀 KILL CONSOLE      \e[1;34m [S] 📑 ACTIVITY LOGS \e[0m"
    echo -e "\e[1;30m ------------------------------------------------------------ \e[0m"

    echo -n -e "\e[1;36m 🔱 [TIGER-X@SUPREME]:~$ \e[0m"
    read opt

    case $opt in
        1) echo -n "Enter file name: "; read f; nano $f ;;
        2) echo -n "New file name: "; read nf; touch $nf; nano $nf ;;
        3) echo -n "File to delete: "; read df; rm -rf $df; echo "Target Deleted."; sleep 1 ;;
        4) echo -n "Word to search: "; read txt; grep -rnw '.' -e "$txt"; echo "Press Enter..."; read ;;
        5) echo -e "\e[1;36m >> CONNECTING TO GITHUB...\e[0m"; curl -s https://api.github.com/users/$USER/repos | grep -o '\"name\": \"[^\"]*' | cut -d'\"' -f4 | column -c 60; echo "Press Enter..."; read ;;
        6) echo -n "Repo name: "; read repo; git clone "https://github.com/$USER/$repo.git"; sleep 2 ;;
        u|U) echo -e "\e[1;32m >> DEPLOYING PROJECTS...\e[0m"; ./up.sh ;;
        r|R) git config --global credential.helper store; git remote set-url origin "https://github.com/$USER/$USER.github.io.git"; chmod +x *.sh; echo "Core Repaired."; sleep 1 ;;
        s|S) git log --oneline -n 10; echo "Press Enter..."; read ;;
        q|Q) clear; exit ;;
        *) echo -e "\e[1;31m [!] COMMAND NOT FOUND \e[0m"; sleep 1 ;;
    esac
done
