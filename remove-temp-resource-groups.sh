#!/bin/sh

jsongroups=$(az group list --query "[?tags.Permanent!='True'].name")
groups=$(echo $jsongroups | tr '"' '\n' | grep t)
for group in ${groups}
do
	read -p "Remove resource group '$group'?" -n 1 -r
	echo    # (optional) move to a new line
	if [[ $REPLY =~ ^[Yy]$ ]]
	then
    	# do dangerous stuff
		echo "Removing resource group '$group'..."
		echo $group | xargs az group delete -y --no-wait -n
	else
		echo "Skipping resource group '$group'"
	fi
	echo
done
