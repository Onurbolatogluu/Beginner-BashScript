#!/bin/bash

# This script demonstrates the case statement.

#if [[ "${1}" = 'start' ]]
#then
#	echo 'Starting.'
#elif [[ "${1}" = 'stop' ]]
#then
#	echo 'Stopping.'
#elif [[ "${1}" = 'status' ]]
#then
#	echo 'Status:'
#else
#	echo 'Supply a valid option.' >&2
#	exit 1
#fi

#ssh=$(/etc/init.d/ssh status)
#echo "${ssh}"

#shell=$(cat /etc/passwd | grep $USER | cut -d : -f 7)
#echo $shell

#case "${1}" in
#	start)
#		echo 'Starting...'
#		;;
#	stop)
#		echo 'Stopping...'
#		;;
#	status|state|--status|--state)
#		echo 'Status:'
#		;;
#	*)
#		echo 'Supply a valid option.' >&2
#		exit 1
#		;;
#esac


case "${1}" in
        start) echo 'Starting...' ;;
        stop)  echo 'Stopping...' ;;
        status) echo 'Status:' ;;
        *)
                echo 'Supply a valid option.' >&2
                exit 1
                ;;
esac
