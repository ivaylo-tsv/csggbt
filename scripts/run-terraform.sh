#!/bin/bash
set -eo pipefail

RED='\033[0;31m'
NC='\033[0m' # No Color
GREEN='\033[0;32m'

while getopts ":c:" opt; do
    case $opt in
    c)
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

if [ "$CHANGE" = "YES" ] 
    then
        echo -e "${GREEN}======================================${NC}"
        echo -e "${GREEN}======= running terraform $cmd =======${NC}"
        echo -e "${GREEN}======================================${NC}"

        terraform -chdir=environments/$CURRENT_ENV init
        terraform -chdir=environments/$CURRENT_ENV plan -out terraform-plan.file

        if [[ "$cmd" == "apply" ]] 
            then
                terraform -chdir=environments/$CURRENT_ENV apply terraform-plan.file
        fi

    else 
        echo -e "${GREEN}=========================================================${NC}"
        echo -e "${GREEN}======== no changes made to $CURRENT_ENV exiting ========${NC}"
        echo -e "${GREEN}=========================================================${NC}"
fi 