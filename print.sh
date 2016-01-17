#!/bin/bash

echo "You want to print file " $1 
nb=$(pdfinfo $1 | grep 'Pages' | awk '{print $2}')
echo  $nb " pages"

if [ $(($nb%2)) -eq 0 ]
then 

echo "Even"
lp -o page-set=odd $1
echo "Flip the printed pages and press [Enter] to continue"
read _
lp -o page-set=even -o outputorder=reverse $1

else

echo "Odd"
lp -o page-set=odd $1
echo "Flip the printed pages without the last one and press [Enter] to continue"
read _
lp -o page-set=even -o outputorder=reverse $1

fi

echo "Done"
