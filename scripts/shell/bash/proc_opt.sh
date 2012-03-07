#!/usr/bin/env bash

# dashes - print a line of dashes
# options: number of dashes
#          -c <char> instead of '-'

LEN=72
CHAR='-'

while (( $# > 0 ))
do
    case $1 in
        [0-9]*) LEN=$1
            ;;
        -c) echo $1
            shift
            CHAR=${1:--}
            ;;
        *) printf 'usage %s [-c <X>] [number]\n' $(basename $0) >&2
            exit 2
            ;;
    esac
    shift
done
