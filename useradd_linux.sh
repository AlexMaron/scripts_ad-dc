#!/bin/bash

read -p "Enter user name : " name
read -p "Password :" passwd
read -p "Main group :" main_group
read -p "Other groups :" other_groups

if test "$other_groups" = ""
then
	useradd --no-create-home -p $passwd -g $main_group $name
else
	useradd --no-create-home -p $passwd -g $main_group \
		-G $other_groups \
		$name
fi

echo
echo "Linux user added"
