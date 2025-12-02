#!/bin/bash

date=$(date +%y%m%d-%H%M%S)
comment=$(curl -L -s http://whatthecommit.com/index.txt)

git add .

echo -e "\ngit push on ${date} ${comment}\n---"

# for i in $(git status | grep deleted | awk '{print $2}'); do git rm "$i"; done

git commit -m "$date $comment"

git push -u origin main
