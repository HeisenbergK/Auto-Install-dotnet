#!/bin/bash

if ! command -v dotnet &> /dev/null
then
	if ! command -v wget &> /dev/null
	then
		echo "wget could not be found"
		echo "Installing wget..."
		apt-get update
		apt-get install -y wget
	fi
	echo "dotnet could not be found"
	echo "Installing dotnet"
	wget https://packages.microsoft.com/config/ubuntu/16.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
	dpkg -i packages-microsoft-prod.deb
	apt-get update
	rm -rf packages-microsoft-prod.deb
	apt-get install -y apt-transport-https
	apt-get update
	apt-get install -y dotnet-sdk-5.0
	exit
else
	echo "dotnet is already installed :)"
fi
