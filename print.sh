#!/bin/bash

echo "You want to print file " $1 
nb=$(pdfinfo $1 | grep 'Pages' | awk '{print $2}')
echo  $nb " pages"

if [ $(($nb%2)) -eq 0 ]
then 
echo "Odd"
else
echo "Even"
fi


