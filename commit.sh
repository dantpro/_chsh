#!/bin/bash

date=$(date +%Y-%m-%d-%H%M%S)
comment=$(curl -L -s http://whatthecommit.com/index.txt)

git add .

echo git push on "${date}" "${comment}"

# for i in $(git status | grep deleted | awk '{print $2}'); do git rm "$i"; done

git commit -m "$date $comment"

git push -u origin main
