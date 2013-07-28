#!/bin/bash

MY_PATH="`dirname \"$0\"`"              
MY_PATH="`( cd \"$MY_PATH\" && pwd )`"  

"$HOME/Library/Developer/fishlamp-scripts/fishlamp-script-installer" fishlamp-admin-scripts "$MY_PATH/Scripts"