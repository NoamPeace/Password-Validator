
# Password Validator script
# Author: Noam Ben-Ari, noam.benari@gmail.com
# This script performs password strenth validation automatically with the given password as a parameter
# Usage Parameters: ./password-validator.sh {PASSWORD}
#
# The script was written performance wise to use minimum variables as possible

# Validates number of characters in the passed parameter ${#1}
#   and outputs a message whether they are not ! equal or greater then 10

if ! [[ ${#1} -ge 10 ]]; then
	echo "password is lower than 10 characters"
	exit 1
fi

# Validates alphabet and digits
#   in the passed parameter $1
#   and outputs a message whether they are not ! containing both alphabet and numbers

if ! [[ $1 =~ [[:alpha:]] && $1 =~ [[:digit:]] ]]; then
	echo "password doesn't contain both alphabet and numbers"
	exit 1
fi

# Validates uppercase and lowercase letters
#   in the passed parameter $1
#   and outputs a message whether they are not ! containing both uppercase and & lowercase letters

if ! [[ $1 =~ [[:upper:]] && $1 =~ [[:lower:]] ]] ;then
	echo "password doesn't contains both upppercase and lowercase"
	exit 1
fi

# Password validation successfull, exit 0

exit 0

