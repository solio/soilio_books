#!/bin/bash

. ../web.conf

books=$(ls)
webdoc=$WEB_DIR

git reset --hard HEAD
git clean -xdf

for book in $books; 
do
    echo $(date +"%Y-%m-%d %H:%M:%S") " publish $book to $webdoc" &>> ../_pub.log
    if [ -d $book ] ;
    then
        cp -rf $book $webdoc
    fi
done