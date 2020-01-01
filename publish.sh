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
        cd $book
        gitbook build
        rm -rf $webdoc/$book
        mkdir $webdoc/$book -p
        cp -rf _book/* $webdoc/$book
        cd ..
    fi
done