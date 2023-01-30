#!/bin/bash

function install () {
shell_f=$(echo -n "$SHELL" | awk -F / '{print $3}')
shell_f="${HOME}/.${shell_f}rc"

if grep "alias clean++='bash ~/cleaner.sh'" <"$shell_f" &>/dev/null && ls "$HOME"/cleaner.sh &>/dev/null; then
    sleep 0.5
    echo "\033[33m\n -- clean++ Already installed --\n\033[0m"
fi
if ! grep "alias clean++='bash ~/cleaner.sh'" <"$shell_f" &>/dev/null; then
    echo "\nalias clean++='bash ~/cleaner.sh'" >>"$shell_f"
fi

if grep "alias clean++='bash ~/cleaner.sh'" <"$shell_f" &>/dev/null && ls "$HOME"/cleaner.sh &>/dev/null; then
    sleep 0.5
    mv cleaner.sh ~/
    cd
    rm -rf clean++
    echo "\033[32m -- clean++ command has been successfully installed ! Enjoy :) --\n\033[0m"
    sleep 0.5
    echo "\033[36m -- Please, run this command now : [\033[33m source $shell_f\033[0m\033[36m ] Then run [\033[33m clean++ \033[0m\033[36m]--\n\033[0m"
    sleep 0.5
    else
    sleep 0.5
    echo -e "\033[31m\n -- clean++ command has NOT been installed ! :( --\n\033[0m"
    exit 1
fi
exit 0
}

function cleaner () {
 
echo "\033[0;31m     _______   _______   _  __  __    __"
echo "\033[0;31m    / ___/ /  / __/ _ | / |/ /_/ /___/ /_"
echo "\033[0;31m   / /__/ /__/ _// __ |/    /_  __/_  __/"
echo "\033[0;31m   \___/____/___/_/ |_/_/|_/ /_/   /_/\033[0m"
echo "\n\n"
echo "\033[0;31m   Improved by : humartin\n\033[0m"
    
Storage=$(df -h "$HOME" | grep "$HOME" | awk '{print($4)}' | tr 'i' 'B')
if [ "$Storage" == "0BB" ];
then
    Storage="0B"
fi
echo "\033[32m\n -- Available Storage Before Cleaning : || $Storage || --\033[0m"

echo "\n\n"
echo "\033[33m ._____________________________.\033[0m"
echo "\033[33m |     Lancement de CCLEAN     |\033[0m"
echo "\033[33m ._____________________________.\033[0m"
sleep 0.2
echo "\033[31m\n -- Cleaning ...\n\033[0m "
sleep 0.5
#42 Caches
/bin/rm -rf "$HOME"/Library/*.42* &>/dev/null
/bin/rm -rf "$HOME"/*.42* &>/dev/null
/bin/rm -rf "$HOME"/.zcompdump* &>/dev/null
/bin/rm -rf "$HOME"/.cocoapods.42_cache_bak* &>/dev/null

#Trash
/bin/rm -rf "$HOME"/.Trash/* &>/dev/null

#General Caches files
#giving access rights on Homebrew caches, so the script can delete them
/bin/chmod -R 777 "$HOME"/Library/Caches/Homebrew &>/dev/null
/bin/rm -rf "$HOME"/Library/Caches/* &>/dev/null
/bin/rm -rf "$HOME"/Library/Application\ Support/Caches/* &>/dev/null

#Slack, VSCode, Discord and Chrome Caches
/bin/rm -rf "$HOME"/Library/Application\ Support/Slack/Service\ Worker/CacheStorage/* &>/dev/null
/bin/rm -rf "$HOME"/Library/Application\ Support/Code/User/workspaceStorage/* &>/dev/null
/bin/rm -rf "$HOME"/Library/Application\ Support/discord/Cache/* &>/dev/null
/bin/rm -rf "$HOME"/Library/Application\ Support/discord/Code\ Cache/js* &>/dev/null
/bin/rm -rf "$HOME"/Library/Application\ Support/Google/Chrome/Profile\ [0-9]/Service\ Worker/CacheStorage/* &>/dev/null
/bin/rm -rf "$HOME"/Library/Application\ Support/Google/Chrome/Default/Service\ Worker/CacheStorage/* &>/dev/null
/bin/rm -rf "$HOME"/Library/Application\ Support/Google/Chrome/Profile\ [0-9]/Application\ Cache/* &>/dev/null
/bin/rm -rf "$HOME"/Library/Application\ Support/Google/Chrome/Default/Application\ Cache/* &>/dev/null

#.DS_Store files
find "$HOME"/Desktop -name .DS_Store -depth -exec /bin/rm {} \; &>/dev/null

#tmp downloaded files with browsers
/bin/rm -rf "$HOME"/Library/Application\ Support/Chromium/Default/File\ System &>/dev/null
/bin/rm -rf "$HOME"/Library/Application\ Support/Chromium/Profile\ [0-9]/File\ System &>/dev/null
/bin/rm -rf "$HOME"/Library/Application\ Support/Google/Chrome/Default/File\ System &>/dev/null
/bin/rm -rf "$HOME"/Library/Application\ Support/Google/Chrome/Profile\ [0-9]/File\ System &>/dev/null

#things related to pool (piscine)
/bin/rm -rf "$HOME"/Desktop/Piscine\ Rules\ *.mp4
/bin/rm -rf "$HOME"/Desktop/PLAY_ME.webloc
    

#calculating the new available storage after cleaning
Storage=$(df -h "$HOME" | grep "$HOME" | awk '{print($4)}' | tr 'i' 'B')
if [ "$Storage" == "0BB" ];
then
    Storage="0B"
fi
sleep 1
echo "\033[32m -- Available Storage After First Cleaning : || $Storage || --\n\n\033[0m"

echo "\033[33m ._____________________________.\033[0m"
echo "\033[33m |     Lancement de CLEAN++    |\033[0m"
echo "\033[33m ._____________________________.\n\033[0m"
sleep 0.2
echo "\033[31m -- Cleaning ...\n\033[0m "
sleep 0.5
/bin/rm -rf ~/Downloads/* &>/dev/null
/bin/rm -rf ~/Trash/* &>/dev/null
/bin/rm -rf ~/Library/Caches &>/dev/null
/bin/rm -rf ~/Library/Application\ Support/Slack/Cache &>/dev/null
/bin/rm -rf ~/Library/Application\ Support/Slack/Service\ Worker/CacheStorage &>/dev/null
/bin/rm -rf ~/Library/Application\ Support/Code/Crashpad &>/dev/null
/bin/rm -rf ~/Library/Application\ Support/Code/Cache &>/dev/null
/bin/rm -rf ~/Library/Application\ Support/Code/User/* &>/dev/null
/bin/rm -rf ~/Library/Application\ Support/Code/User/workspaceStorage/* &>/dev/null
/bin/rm -rf ~/Library/Application\ Support/Code/CachedData &>/dev/null
/bin/rm -rf ~/Library/Application\ Support/Chrome/Default &>/dev/null
/bin/rm -rf ~/Library/Developer/CoreSimulator &>/dev/null
/bin/rm -rf ~/Library/Containers/com.docker.docker &>/dev/null
/bin/rm -rf ~/Library/Containers/*  &>/dev/null &>/dev/null
/bin/rm -rf ~/Library/Application Support/discord/Cache/* &>/dev/null
/bin/rm -rf ~/Library/Application Support/discord/Code Cache/js/* &>/dev/null
/bin/rm -rf ~/Library/Application Support/discord/Crashpad/completed/* &>/dev/null

read -n1 -p "${blue}Cleanup Homebrew? (${cyan}brew cleanup${blue}) [y/${cyan}N${blue}]${reset} " input
echo ""
if [ -n "$input" ] && [ "$input" = "y" ]; then
    brew cleanup ;:
fi

#calculating the new available storage after cleaning
Storage=$(df -h "$HOME" | grep "$HOME" | awk '{print($4)}' | tr 'i' 'B')
if [ "$Storage" == "0BB" ];
then
    Storage="0B"
fi
sleep 0.2
echo "\033[32m -- Available Storage After Second Cleaning : || $Storage || --\n\033[0m"
}


if [ "$1" == "install" ];
then
    install
fi
cleaner
exit 0
