#!/bin/sh
echo "Retrieving resource groups..."
jsongroups=$(az group list --query "[?tags.Permanent!='True'].name")
groups=$(echo $jsongroups | tr '"' '\n' | grep t)
echo
for group in ${groups}
do
	read -p "Remove resource group '$group'?" answer
	case $answer in
   		[yY]* ) echo "Removing resource group '$group'..."
			echo $group | xargs az group delete -y --no-wait -n
			;;
		* )
			echo "Skipping resource group '$group'"
			;;
	esac
	echo
done
