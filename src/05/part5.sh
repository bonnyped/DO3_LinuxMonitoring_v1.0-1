#!/bin/bash

. ./functions_part5

TOTAL_FOLDERS=$(find ${1} -mindepth 1 -type d | wc -l)

echo -en "Total number of folders (including all nested ones) = ${TOTAL_FOLDERS} \n\n"
echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
top_five_folders 5
echo -en "${TOP_FIVE_FOLDERS}\n"