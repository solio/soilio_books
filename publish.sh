#!/bin/bash

. ../web.conf

books=$(ls -l)
webdoc=$WEB_DIR

git reset --hard HEAD
git clean -xdf

for book in $books do
    echo '$(date +"%Y-%m-%d %H:%M:%S") publish $book to $webdoc' &>> _pub.log
end