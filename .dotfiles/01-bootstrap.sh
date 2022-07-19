#!/usr/bin/env bash

set -e 

order=$(ls | grep "\d" | tail -n+2)

for entry in $order; do

	if [[ -d $entry ]]
	then
	    echo "Executing $entry/install.sh"
	    /bin/bash -c $entry/install.sh
	elif [[ -f $entry ]]
	then
	    echo "Executing $entry"
	    /bin/bash $entry
	else
	    echo "Unknown step $entry"
	fi
done
