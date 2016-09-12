#!/bin/bash

function setupCocoaPods {
    echo "Setting up CocoaPods ..."
    pod --verbose install
    echo "CocoaPods installation is completed."
    echo ""
    echo "===============  successed ======================"
    echo "Please start MLS project from 'mls.xcworkspace'."
    echo ""
}

function installCocoaPods {
	command -v gem >/dev/null 2>&1 || { 
	 	echo "============  CocoaPods install failed ================="
		echo >&2 "Please install gem then rerun this script."
		echo ""
		exit 1;
	}  

	echo "Please start MLS project from 'mls.xcworkspace'."
	echo "installing CocoaPods"
	sudo gem install cocoapods
}

# =========== main ===============
command -v pod >/dev/null 2>&1 || { 
	echo >&2 "CocoaPods is not installed. Do you want to install CocoaPods? y/n";
	read isAgree
	if [ ${isAgree} == 'y' ]; then
		installCocoaPods
	else
		echo "=========  MLS project init failed ============"
		echo "Exiting..."
		echo ""
		exit 1;
	fi 
}  

setupCocoaPods


