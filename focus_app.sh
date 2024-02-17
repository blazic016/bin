#! /usr/bin/env bash

if [ $# -lt 1 ]; then
    echo "usage: `basename $0` [class-name] [command] [args]"
    echo "./focus_app.sh fixTrans python3 /home/mblazic/Mega/python/translate.py "
    echo
    echo "Find and activate window with [class-name]."
    echo "Execute [command] if window cannot be found."
    echo
    echo "If [command] is not given, it is assumed to be [class-name]"
    exit 1
fi


class="$1"
id=$(xdotool search --name "$class")

if [ -z "$id" ]; then
    shift
    run_app="$@"
    echo $run_app
    eval "xdotool exec ${run_app}"
else
    xdotool windowactivate $id
fi

exit
