#!/bin/bash

if [ -z $1 ]
then
echo No parametr found, need 1 text parametr!
elif [ $2 ]
then
echo More than 1 parametr!
else [[ $1 =~ [-+]?([0-9]*[.])?[0-9]+([eE][-+]?\d+)? ]] && echo It is the number! Please enter the 1 text parametr! || echo $1
fi
