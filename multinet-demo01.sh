#!/bin/bash

# This script pings a list of servers and reports their status.

SERVER_FILE='/root/servers'


if [[ ! -e "${SERVER_FILE}" ]]
then
	echo "Cannot open ${SERVER_FILE}." >&2
	exit 1
fi


for SERVER in $(cat ${SERVER_FILE})
do
	echo "Pinging ${SERVER}"
	ping -c 1 ${SERVER} &> /dev/null
	# ping -c 1 ${SERVER}

	if [[ "${?}" -ne 0 ]]
	then
		echo "${SERVER} down."
	else
		echo "${SERVER} up."
	fi
done
