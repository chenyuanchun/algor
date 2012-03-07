#!/usr/bin/env bash

# getopts_example.sh -a -b blar

opta=
optb=

while getopts 'ab:' OPTION
do
    case $OPTION in
        a)
            opta=1
            ;;
        b)
            optb="$OPTARG"
            ;;
        ?)
            printf "Usage: %s: [-a] [-b xx]\n" $(basename $0) >&2
            exit 2
            ;;
    esac
done

shift $(($OPTIND - 1))

if [ "$opta" ]; then
    printf "Option -a specified\n"
fi

if [ "$optb" ]; then
    printf "Option -b specified with value: %s\n" "$optb"
fi

printf "Remaining args: %s\n" "$*"