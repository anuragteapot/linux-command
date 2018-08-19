#!/usr/bin/env bash

# Notes making application

read -p "Notes : " message

read -p "Name : " filename

echo $message >> "/home/"$USER"/Documents/"$filename".txt"
