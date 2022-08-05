#!/bin/bash

# ./ScanPorts.sh <ip>

if [ $1 ]; then
    ip=$1
    for ports in $(seq 1 65535); do
        timeout 1 bash -c "echo '' > /dev/tcp/$ip/$ports" 2>/dev/null && echo "Puerto $ports - Abierto" &
    done; wait
else
    echo -e "\n Debe especificar una dirección IP\n"
    exit 1
fi
