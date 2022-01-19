#!/bin/bash

# This script generates a random password.
# This user can set the password lenght with -l and add a special character with -s.
# Verbose mode can be enabled with -v.

# Set a default password lenght.
LENGTH=48

usage() {
	echo "Usage: ${0} [-vs] [-l LENGTH]" >&2
        echo 'Generate a random password.'	
	echo ' -l LENGHT Specify the password length.'
	echo ' -s Append a special  character to the password.'
	echo ' -v Increase verbosity'
	exit 1
}


log() {
	local MESSAGE="${@}"
	if [[ "${VERBOSE}" = 'true' ]]
	then
		echo "${MESSAGE}"
	fi
}

while getopts vl:sx OPTION
do
	case ${OPTION} in
		v)
			VERBOSE='true'
			log 'Verbose mode on.'
			;;
		l)
			LENGTH="${OPTARG}"
			;;
		s)
			USE_SPECIAL_CHARACTER='true'
			;;
		x)
			echo "$(date)"
			;;
		?)
			usage
			;;
	esac
done


# Remove the options while leaving the remaining arguments.
shift "$(( OPTIND - 1 ))"


if [[ "${#}" -gt 0 ]]
then
	usage
fi



log 'Generating a password.'

PASSWORD=$(date +%s%N${RANDOM}${RANDOM} | sha256sum | head -c${LENGTH})

# Append a special character if requested to do so.
if [[ "${USE_SPECIAL_CHARACTER}" = 'true' ]]
then
	log 'Selecting a random special character.'
	SPECIAL_CHARACTER=$(echo '!*=====////@+%&?=(-' | fold -w1 | shuf | head -c1)
	PASSWORD="${PASSWORD}${SPECIAL_CHARACTER}"

fi


log 'Done.'
log 'Here is the password:'

# Display the password.
echo "${PASSWORD}"

exit 0
