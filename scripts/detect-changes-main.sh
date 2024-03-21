#!/bin/bash
set -eo pipefail

RED='\033[0;31m'
NC='\033[0m' # No Color
GREEN='\033[0;32m'

while getopts ":d:" opt; do
    case $opt in
    d)
        cmd=$OPTARG
        ;;
    \?)
        echo "Invalid option: $OPTARG" 1>&2
        ;;
    :)
        echo "Invalid option: $OPTARG requires an argument" 1>&2
        ;;
    esac
done

if [[ "$cmd" in *"terraform/main"* ]]
    then
        echo -e "${GREEN}There was a change in main terraform folder"
        echo CHANGE=YES >> $GITHUB_ENV
        echo CURRENT_ENV="terraform/main" >> $GITHUB_ENV
        exit 0 
    else    
        echo CHANGE=NO >> $GITHUB_ENV
fi

echo $CHANGE