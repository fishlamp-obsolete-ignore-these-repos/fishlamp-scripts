#!/bin/bash

function usage() {
    echo "prints help for fishlamp scripts"
}

if [ "$1" == "--help" ]; then
    usage
    exit 0;
fi

SELF_NAME="`basename \"$0\"`"
MY_PATH="`dirname \"$0\"`"
MY_PATH="`( cd \"$MY_PATH\" && pwd )`"

if [ "$1" == "" ]; then
    echo "commands:"

    FILES=`find "$MY_PATH" -type f -depth 1`
    for file in $FILES; do

        filename=$(basename "$file")

        echo "$filename" | awk '{print "    "$0}'

        if [ -d "$file-commands" ]; then
            if [ -f "$file-commands/help.sh" ]; then
                "$file-commands/help.sh" | awk '{print "    "$0}'
            else
                ls "$file-commands"
            fi
        fi

    done

    echo ""
    echo "try '$SELF_NAME help' for more info"
    echo ""

    exit 1
fi

MY_COMMAND="$1"
MY_SCRIPT="$MY_COMMAND.sh"
MY_PARMS=${*:2}

# echo "command = $MY_COMMAND $PARMS"

script_path="$SELF_NAME-commands/$MY_SCRIPT"

if [ -f "$script_path" ]; then
    "$script_path" $MY_PARMS
else
    echo "unknown command \"$MY_COMMAND\""
    exit 1
fi

exit 0

