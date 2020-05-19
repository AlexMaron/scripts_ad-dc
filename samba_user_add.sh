#!/bin/bash

read -p "Show all lines? Yes\No :" choose

case $choose in
no | No)
	read -p "Enter domain user name :" domain_user_name
	read -p "Enter domain user password :" domain_user_passwd
	read -p "Enter user surname :" surname

	samba-tool user create $domain_user_name $domain_user_passwd \
		--use-username-as-cn --surname="$surname" 
;;
yes | Yes)
	read -p "Enter domain user name :" domain_user_name
	read -p "Enter domain user password :" domain_user_passwd
	read -p "Enter user surname :" surname
	read -p "Enter given-name :" given_name
	read -p "Job title :" job_title
#	read -p "Mail :" mail
#	read -p "Phone number :" phone
#	read -p "Department :" department
#	read -p "Description :" description


	samba-tool user create $domain_user_passwd $domain_user_name \
		--use-username-as-cn --surname="$surname" \
		--given-name="$given_name" \
		--job-title="$job_title" \
#		--department="$departmet"
#		--mail-address=""$mail""
#		--telephone-number=""$phone""
#		--mail-address= 
#		--description=""$description""
;;
*)
	echo "Invalid input bitch, try again"
	exec bash "$0" "$@"
esac

