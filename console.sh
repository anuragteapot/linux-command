#!/bin/bash

# Command line helper
my_dir="$(dirname "$0")"

echo Usage: command list [options]
echo
echo Options:
echo

read get_command
command_type=($(echo $get_command | tr " " "\n"))

if [ -d "$my_dir/src/commands/${command_type[0]}/command.sh" ];
then
"$my_dir/src/commands/${command_type[0]}/command.sh"
echo Done!
else
echo Command not found.
fi
