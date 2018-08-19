#!/bin/bash

# Command line helper
my_dir="$(dirname "$0")"

echo Usage: command list [options]
echo
echo Options:
echo "=========================================="

while :
do
read -p "-> " get_command
command_type=($(echo $get_command | tr " " "\n"))
echo "------------------------------------------"

# Exit
if [ ${command_type[0]} == "exit" ] || [ ${command_type[0]} == "EXIT" ]
then
echo "Bye!"
echo "=========================================="
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

if [ -d "$my_dir/src/commands/${command_type[0]}/" ];
then
  sudo chmod +x "$my_dir/src/commands/${command_type[0]}/command.sh"
  "$my_dir/src/commands/${command_type[0]}/command.sh"
else
  echo "Command not found."
fi
echo "=========================================="
done
echo "Exit!"
