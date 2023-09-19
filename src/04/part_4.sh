#!/bin/bash

#раскраска Баш-скрипта исследование системы при помощи кофигурационного файла

. ./functions_part4

OS=`uname -s`
MEM_TOTAL_b="$(free -b | grep "Mem:" | printf %d $(awk '{print $2}'))"
MEM_TOTAL_b_used="$(free -b | grep "Mem:" | printf %d  $(awk '{print $3}'))"
MEM_TOTAL_b_free="$(free -b | grep "Mem:" | printf %d  $(awk '{print $4}'))"
b_Gb=1073741824;
b_Mb=1048576;
C=1024;
alias alias_ar={ARRAY_COLORS_FROM_FILE[*]}

read_line_from_file
if check_arguments_part4 $# && check_integer ${ARRAY_COLORS_FROM_FILE[*]} && check_sequence ${ARRAY_COLORS_FROM_FILE[*]} && check_number_of_color ${ARRAY_COLORS_FROM_FILE[*]}
then
detect_colors ${ARRAY_COLORS_FROM_FILE[*]}
echo -en "${COLOR_NAME}HOSTNAME:        ${COLOR_VALUE}$(hostname)${NCOLOR}"                                                                                         && d_echo
echo -en "${COLOR_NAME}TIMEZONE:        ${COLOR_VALUE}$(cat /etc/timezone) $(date +"%Z %:::z")${NCOLOR} "                                                           && d_echo
echo -en "${COLOR_NAME}HOSTNAME:        ${COLOR_VALUE}$(hostname)${NCOLOR}"                                                                                         && d_echo
echo -en "${COLOR_NAME}USER:            ${COLOR_VALUE}$USER ${NCOLOR}"                                                                                              && d_echo
echo -en "${COLOR_NAME}OS:              ${COLOR_VALUE}$OS ${NCOLOR}"                                                                                                && d_echo
echo -en "${COLOR_NAME}DATE:            ${COLOR_VALUE}$(date +"%d %b %Y %X")${NCOLOR}"                                                                              && d_echo
echo -en "${COLOR_NAME}UPTIME:          ${COLOR_VALUE}$(uptime -p)${NCOLOR}"                                                                                        && d_echo
echo -en "${COLOR_NAME}UPTIME_SEC:      ${COLOR_VALUE}$(cut -d " " -f 1 /proc/uptime) ${NCOLOR}"                                                                    && d_echo
echo -en "${COLOR_NAME}IP:              ${COLOR_VALUE}$( ip route show to default | awk '{print $3}' | head -1) ${NCOLOR}"                                          && d_echo
echo -en "${COLOR_NAME}MASK:            ${COLOR_VALUE}$(ifconfig $(ip route show to default | awk '{print $5}' | head -1) | awk 'FNR==2{print $4}') ${NCOLOR}"      && d_echo
echo -en "${COLOR_NAME}GATEWAY:         ${COLOR_VALUE}$(ip route | grep "default via" | awk '{print $3}') ${NCOLOR}"                                                && d_echo
echo -en "${COLOR_NAME}RAM_TOTAL:       ${COLOR_VALUE}$(bc<<<"scale=3;$MEM_TOTAL_b/$b_Gb") GB ${NCOLOR}"                                                            && d_echo
echo -en "${COLOR_NAME}RAM_USED:        ${COLOR_VALUE}$(echo "$MEM_TOTAL_b_used $b_Gb"  | awk '{printf "%.3f", $1 / $2}') GB ${NCOLOR}"                             && d_echo
echo -en "${COLOR_NAME}RAM_FREE:        ${COLOR_VALUE}$(echo "$MEM_TOTAL_b_free $b_Gb" | awk '{printf "%.3f", $1 / $2 }') GB ${NCOLOR}"                             && d_echo
echo -en "${COLOR_NAME}SPACE_ROOT :     ${COLOR_VALUE}$(echo "$(df /root | awk 'FNR==2 {printf $2}') $b_Mb $C" | awk '{printf "%.3f", $1 * $3 / $2}') MB ${NCOLOR}" && d_echo
echo -en "${COLOR_NAME}SPACE_ROOT_USED: ${COLOR_VALUE}$(echo "$(df /root | awk 'FNR==2 {printf $3}') $b_Mb $C" | awk '{printf "%.3f", $1 * $3 / $2}') MB ${NCOLOR}" && d_echo
echo -en "${COLOR_NAME}SPACE_ROOT_FREE: ${COLOR_VALUE}$(echo "$(df /root | awk 'FNR==2 {printf $4}') $b_Mb $C" | awk '{printf "%.3f", $1 * $3 / $2}') MB ${NCOLOR}" && d_echo
COLOR_NAME=${NCOLOR}
COLOR_NAME_BCKGRND=${NCOLOR}
fi

print_color_case ${ARRAY_TO_PRINT[*]}