#!/bin/bash
# TIGER-X ADVANCED CONSOLE v9.0
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
  echo -e "\e[1;34m  > OS: TIGER-UX   |   STATUS: ENCRYPTED   |   UPLINK: STABLE \e[0m"
  echo -e "\e[1;30m ------------------------------------------------------------ \e[0m"
  echo -e "\e[1;37m [01] \e[1;36mEDIT MAIN INTERFACE     \e[1;30m(index.html)\e[0m"
  echo -e "\e[1;37m [02] \e[1;36mEDIT PROJECT ALPHA      \e[1;30m(project1.html)\e[0m"
  echo -e "\e[1;37m [03] \e[1;36mEDIT CORE DASHBOARD     \e[1;30m(dashboard.html)\e[0m"
  echo -e "\e[1;37m [04] \e[1;36mEDIT SYSTEM REPORTS     \e[1;30m(report.html)\e[0m"
  echo -e "\e[1;32m [05] \e[1;32mDEPLOY ALL CHANGES      \e[1;30m(Push to Server)\e[0m"
  echo -e "\e[1;31m [06] \e[1;31mTERMINATE SESSION       \e[1;30m(Exit)\e[0m"
  echo -e "\e[1;30m ------------------------------------------------------------ \e[0m"
  echo -n -e "\e[1;37m [TIGER-X@ROOT]:~$ \e[0m"
  read opt
  case $opt in
    1) nano index.html ;;
    2) nano project1.html ;;
    3) nano dashboard.html ;;
    4) nano report.html ;;
    5) echo -e "\e[1;33m >> Uploading data... Please wait.\e[0m"; ./up.sh ;;
    6) clear; echo -e "\e[1;31m SESSION TERMINATED. \e[0m"; exit ;;
    *) echo -e "\e[1;31m [!] INVALID COMMAND \e[0m"; sleep 1 ;;
  esac
done
