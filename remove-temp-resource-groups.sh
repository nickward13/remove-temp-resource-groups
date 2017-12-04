#!/bin/sh

jsongroups=$(az group list --query "[?tags.Permanent!='True'].name")
groups=$(echo $jsongroups | tr '"' '\n' | grep t)
for group in ${groups}
do
	echo "Removing resource group '$group'"
	echo $group | xargs az group delete -y --no-wait -n
done
