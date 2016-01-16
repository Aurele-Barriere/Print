#!/bin/bash

echo "You want to print file " $1 
nb=$(pdfinfo $1 | grep 'Pages' | awk '{print $2}')
echo  $nb " pages"

