#!/bin/bash

. ./functions_part5
. ./checks_part5

detect_colors ${ARRAY_COLORS_DEFAULT[*]}
if check_path_existence $1 && check_end_slash $1  
then
echo -en "Total number of folders (including all nested ones) = ${TOTAL_FOLDERS} \n\n"
echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
top_five_folders $1
echo -en "${TOP_FIVE_FOLDERS}\n"
fi