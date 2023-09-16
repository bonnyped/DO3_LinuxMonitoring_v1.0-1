#!/bin/bash

#исследование системы при помощи Баш-скрипта


PURPLE='\033[1;35m'
RED='\033[0;31m'
NOCOLOR='\033[0m'
OS=`uname -s`
MEM_TOTAL_b="$(free -b | grep "Mem:" | printf %d $(awk '{print $2}'))"
MEM_TOTAL_b_used="$(free -b | grep "Mem:" | printf %d  $(awk '{print $3}'))"
MEM_TOTAL_b_free="$(free -b | grep "Mem:" | printf %d  $(awk '{print $4}'))"
b_Gb=1073741824;
b_Mb=1048576;
C=1024;

function delete_status_file {
    [ -e *.status ] && rm *.status 
}

function yes_or_no {
    while true; do
    read -r -p "If you want to save this data \"Y/N\" to save this data in file: "
    case $REPLY in
        [Yy] )  
            touch ./flag;
            delete_status_file;
            ./part_2.sh > $(date +"%d_%m_%y_%H_%M_%S").status;
            break;;
        * ) 
            echo; 
            echo -e "${RED}$REPLY${NOCOLOR} is not answer Y or y, thank's for using my script! Exiting..."; 
            delete_status_file;
            echo; 
            exit;;
    esac
    done
}

function d_echo {
    echo
    echo
}

echo -en "HOSTNAME:         ${PURPLE}$(hostname)${NOCOLOR}"                                                                                         && d_echo
echo -en "TIMEZONE:         ${PURPLE}$(cat /etc/timezone) $(date +"%Z %:::z")${NOCOLOR} "                                                           && d_echo
echo -en "USER:             ${PURPLE}$USER ${NOCOLOR}"                                                                                              && d_echo
echo -en "OS:               ${PURPLE}$OS ${NOCOLOR}"                                                                                                && d_echo
echo -en "DATE:             ${PURPLE}$(date +"%d %b %Y %X")${NOCOLOR}"                                                                              && d_echo
echo -en "UPTIME:           ${PURPLE}$(uptime -p)${NOCOLOR}"                                                                                        && d_echo
echo -en "UPTIME_SEC:       ${PURPLE}$(cut -d " " -f 1 /proc/uptime) ${NOCOLOR}"                                                                    && d_echo
echo -en "IP:               ${PURPLE}$( ip route show to default | awk '{print $3}' | head -1) ${NOCOLOR}"                                          && d_echo
echo -en "MASK:             ${PURPLE}$(ifconfig $(ip route show to default | awk '{print $5}' | head -1) | awk 'FNR==2{print $4}') ${NOCOLOR}"      && d_echo
echo -en "GATEWAY:          ${PURPLE}$(ip route | grep "default via" | awk '{print $3}') ${NOCOLOR}"                                                && d_echo
echo -en "RAM_TOTAL:        ${PURPLE}$(bc<<<"scale=3;$MEM_TOTAL_b/$b_Gb") GB ${NOCOLOR}"                                                            && d_echo
echo -en "RAM_USED:         ${PURPLE}$(echo "$MEM_TOTAL_b_used $b_Gb"  | awk '{printf "%.3f", $1 / $2}') GB ${NOCOLOR}"                             && d_echo
echo -en "RAM_FREE:         ${PURPLE}$(echo "$MEM_TOTAL_b_free $b_Gb" | awk '{printf "%.3f", $1 / $2 }') GB ${NOCOLOR}"                             && d_echo
echo -en "SPACE_ROOT :      ${PURPLE}$(echo "$(df /root | awk 'FNR==2 {printf $2}') $b_Mb $C" | awk '{printf "%.3f", $1 * $3 / $2}') MB ${NOCOLOR}" && d_echo
echo -en "SPACE_ROOT_USED:  ${PURPLE}$(echo "$(df /root | awk 'FNR==2 {printf $3}') $b_Mb $C" | awk '{printf "%.3f", $1 * $3 / $2}') MB ${NOCOLOR}" && d_echo
echo -en "SPACE_ROOT_FREE:  ${PURPLE}$(echo "$(df /root | awk 'FNR==2 {printf $4}') $b_Mb $C" | awk '{printf "%.3f", $1 * $3 / $2}') MB ${NOCOLOR}" && d_echo

if [ -e ./flag ]
then
rm -rf ./flag
else
yes_or_no
fi
