#!/bin/bash

# Checks initialization status
if [ ! -f "/app/config/smp-server.ini" ] && [ ! -f "/etc/opt/simplex/smp-server.ini" ]; then
    # If no configs are present, initialize
    if [ "$UseIP" = true ]; then
        ./smp-server init --ip $IP
    elif [ "$UseIP" = false ]; then
        ./smp-server init -n $FQDN        
    else
        echo "UseIP is not defined!! Exiting..."
        exit
    fi

    mv /etc/opt/simplex/* /app/config/
    ln -s /app/config/* /etc/opt/simplex/

elif [ -f "/app/config/smp-server.ini" ] && [ ! -f "/etc/opt/simplex/smp-server.ini" ]; then
    # If existing config exists, make a symbolic link
    mkdir /etc/opt/simplex
    ln -s /app/config/* /etc/opt/simplex/

fi

./smp-server start
