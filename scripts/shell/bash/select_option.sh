#!/bin/bash

directorylist="exit $(ls /)"

PS3='select a dir>'
until [ "$directory" = "exit" ]; do
  printf "%b" "\a\n\nplease select a directory...\n" >&2
  select directory in $directorylist; do
    if [ "$directory" = "exit" ]; then
      echo "you chose to exit..."
      break
    elif [ -n "$directory" ]; then
      echo "you chose no. $REPLY, processing $directory..."
      break
    else
        echo "invalid option chosen"
    fi
  done
done
