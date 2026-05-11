#!/bin/bash
git add .
git commit -m "SUPREME_CORE_UPDATE_$(date +%Y%m%d_%H%M%S)"
git push origin main --force
echo -e "\e[1;32m [!] CLOUD SYNC COMPLETE \e[0m"
sleep 2
