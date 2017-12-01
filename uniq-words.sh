#!/bin/bash

if [[ $# < 1 ]]; then
  echo "Usage: $0 text_file"
  exit 1
fi
if [[ ! -f $1 ]]; then
  echo "Argument 1 is not a file"
  exit 2
fi

grep -o -E '\w+' "$1" | grep -E '^[а-зА-З]+$' | sort | uniq > $(basename $1)_uniq.txt
cat *_uniq.txt | sort | uniq | tr '\n' ' ' > bgwords.txt
