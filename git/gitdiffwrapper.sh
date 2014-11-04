#!/bin/sh

git diff --no-index "$2" "$5"

echo -n "Compare in vimdiff $5? [y]/n "
read hitme
hitme=${hitme:="y"}
if [ $hitme = "y" ]
then
  vim -d "$2" "$5"
fi
