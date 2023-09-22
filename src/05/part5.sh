#!/bin/bash

. ./functions_part5
. ./checks_part5

if [[ ${PATH_EXIST} -eq 0 ]] && check_end_slash $1 && check_path_existence_arg $1  
then
echo -en "Total number of folders (including all nested ones) = ${total_folders} \n\n"
echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
top_five_dir $1
echo -en "${top_five_folders}\n"
echo -en "Total number of files = ${total_files} \n\n"
echo -en "Configuration files (with the .conf extension) = ${total_conf} \n\n"
echo -en "Text files = ${total_text} \n\n"
echo -en "Executable files = ${total_exec} \n\n"
echo -en "Log files (with the extension .log) = ${total_log} \n\n"
echo -en "Archive files = ${total_arch} \n\n"
echo -en "Symbolic links = ${total_symb} \n\n"
echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
top_ten_f $1
echo -en "${top_ten_files}\n"
echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file):"
top_ten_exe $1
echo -en "${top_ten_exe_files}\n"
echo -en "Script execution time (in seconds) = "
count_exec_time 

fi