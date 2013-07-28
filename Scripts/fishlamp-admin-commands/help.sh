#!/bin/sh

#  fishlamp-help.sh
#  FishLampScripts
#
#  Created by Mike Fullerton on 6/22/13.
#

MY_PATH="`dirname \"$0\"`"              
MY_PATH="`( cd \"$MY_PATH\" && pwd )`"  

function usage() {
    echo "prints help for fishlamp commands"
}

if [ "$1" == "--help" ]; then
    usage
    exit 0;
fi

PARM="$1"

cd "$MY_PATH"

FILES=`ls`
for file in $FILES; do
    extension=${file##*.}
    filename_no_extension=`basename "$file" .sh`

    if [[ "$extension" == "sh" ]]; then

        if [[ "$PARM" != "-s" ]]; then
            echo "  $filename_no_extension:"
            bash "$file" --help | awk '{print "    "$0}'
            echo ""
        else
            echo "  $filename_no_extension"
        fi
    fi
done

