#!/bin/bash
# TIGER-X ULTIMATE CONTROL CENTER
while true; do
  clear
  echo -e "\e[1;36m"
  echo "  ████████╗██╗ ██████╗ ███████╗██████╗     ██╗  ██╗"
  echo "  ╚══██╔══╝██║██╔════╝ ██╔════╝██╔══██╗    ╚██╗██╔╝"
  echo "     ██║   ██║██║  ███╗█████╗  ██████╔╝     ╚███╔╝ "
  echo "     ██║   ██║██║   ██║██╔══╝  ██╔══██╗     ██╔██╗ "
  echo "     ██║   ██║╚██████╔╝███████╗██║  ██║    ██╔╝ ██╗"
  echo "     ╚═╝   ╚═╝ ╚═════╝ ╚══════╝╚═╝  ╚═╝    ╚═╝  ╚═╝"
  echo -e "\e[0m"
  echo -e "\e[1;34m [ SYSTEM: ALL PROJECTS | OPERATOR: TIGER-X | SECURE: YES ] \e[0m"
  echo -e "\e[1;30m ------------------------------------------------------------ \e[0m"
  echo -e "\e[1;37m [1] EDIT INDEX       [2] EDIT DASHBOARD   [3] EDIT ALPHA \e[0m"
  echo -e "\e[1;37m [4] EDIT REPORTS     [5] EDIT ARCHIVE     [6] EDIT 404 PAGE \e[0m"
  echo -e "\e[1;30m ------------------------------------------------------------ \e[0m"
  echo -e "\e[1;32m [U] DEPLOY (PUSH) TO GITHUB             [Q] EXIT CONSOLE \e[0m"
  echo -e "\e[1;30m ------------------------------------------------------------ \e[0m"
  echo -n -e "\e[1;37m [COMMAND]:~$ \e[0m"
  read opt
  case $opt in
    1) nano index.html ;;
    2) nano dashboard.html ;;
    3) nano project1.html ;;
    4) nano report.html ;;
    5) nano projects.html ;;
    6) nano 404.html ;;
    u|U) echo -e "\e[1;33m >> DEPLOYING TO CLOUD...\e[0m"; ./up.sh ;;
    q|Q) clear; exit ;;
    *) echo -e "\e[1;31m [!] INVALID \e[0m"; sleep 1 ;;
  esac
done
