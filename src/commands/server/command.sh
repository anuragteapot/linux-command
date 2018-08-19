#!/usr/bin/env bash

# Server control

if [ $TYPE == "xampp" ]
then
  sudo /opt/lampp/lampp $CTYPE
else
  if [ $TYPE == "mysql" ]
  then
    sudo /etc/init.d/mysql $CTYPE
  else
    if [ $TYPE == "apache2" ]
    then
      sudo service apache2 $CTYPE
      echo "Done! - " $CTYPE
    fi
  fi
fi
