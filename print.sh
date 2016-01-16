#!/bin/bash

echo "You want to print file " $1
echo "Number of pages"
pdfinfo $1 | grep 'Pages' | awk '{print $2}'


