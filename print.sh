#!/bin/bash

echo "You want to print file " $1 
nb=$(pdfinfo $1 | grep 'Pages' | awk '{print $2}')
echo  $nb " pages."

echo "The side that will be printed on should face up."
echo "The top will be printed on the part that goes inside the printer."
echo "Press [Enter] to continue..."
read _

if [ $(($nb%2)) -eq 0 ]
then 

echo "Even"
lp -o page-set=odd $1
echo "When the printing is done, flip the printed pages while keeping the same side facing up."
echo "Then press [Enter] to continue..."
read _
lp -o page-set=even -o outputorder=reverse $1

else

echo "Odd"
lp -o page-set=odd $1
echo "When the printing is done, flip the printed pages WITHOUT THE LAST ONE while keeping the same side facing up."
echo "Then press [Enter] to continue..."
read _
lp -o page-set=even -o outputorder=reverse $1

fi

echo "Done."
