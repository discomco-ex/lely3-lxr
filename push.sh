#! /bin/bash
clear
echo '-----------------------------------'
echo pushing version "$1" to dev branch
echo '-----------------------------------'
echo 'linting....'

echo 'adding...'
git add .
echo ''
git commit -a -m "$1"
git push
