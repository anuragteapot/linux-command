#!/usr/bin/env bash

# Install
echo "Installation starting...."
echo
  case $TYPE in
  apache2|all)
  sudo apt-get update
  sudo apt-get install apache2
  echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
		;;

  sublime)
  wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
  echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
  sudo apt-get update
  sudo apt-get install sublime-text
  echo "^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^"
		;;

	*)
		echo "[Warning] Provide name of the package."
    echo "Example: install your_package_name OR install all to install all registered package."
    echo
    echo "Error...."
    exit 0;
		;;
  esac
echo
echo "Installation completed!"
