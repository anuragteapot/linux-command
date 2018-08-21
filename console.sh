#!/bin/bash

# Command line helper
my_dir="$(dirname "$0")"

# Register color
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;35m'
BLUE='\033[0;34m'
NC='\033[0m'

export RED GREEN YELLOW BLUE NC

echo
printf "  Usage: command list [${BLUE}options${NC}]\n"
echo
printf "  Options : [${BLUE}arguments${NC}]\n"
echo
for file in src/commands/*; do
    printf "${GREEN}    -> $(basename "$file")\n${NC}"
done
echo
printf "${YELLOW}==========================================${NC}\n"

while :
do
read -p "-> " get_command
command_type=($(echo $get_command | tr " " "\n"))
echo "------------------------------------------"

# Exit
if [ "${command_type[0]}" == "exit" ]
then
echo "Bye!"
printf "${YELLOW}==========================================${NC}\n"
exit 0;
fi

# Command type
if [ ${command_type[1]} ]
then
TYPE=${command_type[1]}
fi

if [ ${command_type[2]} ]
then
CTYPE=${command_type[2]}
fi

export CTYPE TYPE

if [ -d "$my_dir/src/commands/${command_type[0]}/" ] && [ ! -z "${command_type[0]}" ];
then
  sudo chmod +x "$my_dir/src/commands/${command_type[0]}/command.sh"
  "$my_dir/src/commands/${command_type[0]}/command.sh"
else
  printf "${RED}Command not found.${NC}\n"
fi
printf "${YELLOW}==========================================${NC}\n"
done
echo "Exit!"
