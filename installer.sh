#!/bin/bash
#$1 should be file path
#echo current version
echo "GNU/Linux Application installer version 0.1"
#log current date
echo "$(date)" >> ./installer.log
#check if specified file exists
if [ -f "$1" ]
then
    echo "File existence validated" >> ./installer.log
else
    echo "Couldn't validate file existence" >> ./installer.log
    echo "File not Found"
    echo "exiting" >> ./installer.log
    echo "exiting..."
    exit
fi
echo "checking filetype" >> ./installer.log
if [ ${1: -4} == ".deb" ]
then
    echo "Found .deb file" >> ./installer.log
    echo "File Type: Debian Package"
    echo "requesting password and attempting install" >> ./installer.log
    echo "Please enter your password. You will not see asteriks or similar"
    sudo apt install "$1" && echo "success" >> ./installer.log && echo "Success!" && echo "exiting" && exit || echo "apt or sudo error" >> ./installer.log && echo "error during installation" && echo "exiting" >> ./installer.log && echo "exiting..." && exit
elif [ ${1: -9} == ".appimage" ]
then
    echo "Found .appimage file" >> ./installer.log
    echo "File Type: application image"
    echo "attempting install" >> ./installer.log
    chmod +x "$1" && mkdir -p ~/Apps && cp "$1" ~/Apps && echo "success" >> ./installer.log && echo "Success!" && echo "exiting" && exit || echo "apt or sudo error" >> ./installer.log && echo "error during installation" && echo "exiting" >> ./installer.log && echo "exiting..." && exit
else
    echo "invalid filetype" >> ./installer.log
    echo "invalid filetype"
    echo "exiting" >> ./installer.log
    echo "exiting..."
    exit
fi