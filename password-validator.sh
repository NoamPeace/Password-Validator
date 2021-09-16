
# Password Validator script
# Author: Noam Ben-Ari, noam.benari@gmail.com
# This script performs password strenth validation automatically with the given password as a parameter
# Usage Parameters: ./password-validator.sh {PASSWORD}
#
# The script was written performance wise to use minimum variables as possible

# Checks whether a "-f" flag is passed to the script with a filename argument
#   and sets the $1 variable to the first line in the file
#   if file doesn't exist -> print an error message to stdout
#   in case the wrong flag is passed -> print an error message to stdout
#   in case there is no filename argument after the -f flag -> print an error message to stdout

while getopts "f:" flag; do
  case ${flag} in
	f )
	    if ! [[ -f "$OPTARG" ]]; then echo "$OPTARG file not exists." 1>&2 && exit 2 ;fi
	    read -r Password_From_File < $OPTARG
	    set -- $Password_From_File
	    ;;
	\? )
	    echo "Invalid option: $OPTARG" 1>&2
	    exit 2
	    ;;
	: )
	    echo "Invalid option: $OPTARG requires an argument" 1>&2
	    exit 2
	    ;;
  esac
done

# Validates number of characters in the passed parameter ${#1}
#   and outputs a message whether they are not ! equal or greater then 10 (in red color)


if ! [[ ${#1} -ge 10 ]]; then
	echo "$(tput setaf 1)password is lower than 10 characters"
	exit 1
fi

# Validates alphabet and digits
#   in the passed parameter $1
#   and outputs a message whether they are not ! containing both alphabet and numbers (in red color)

if ! [[ $1 =~ [[:alpha:]] && $1 =~ [[:digit:]] ]]; then
	echo "$(tput setaf 1)password doesn't contain both alphabet and numbers"
	exit 1
fi

# Validates uppercase and lowercase letters
#   in the passed parameter $1
#   and outputs a message whether they are not ! containing both uppercase and & lowercase letters (in red color)

if ! [[ $1 =~ [[:upper:]] && $1 =~ [[:lower:]] ]] ;then
	echo "$(tput setaf 1)password doesn't contains both upppercase and lowercase"
	exit 1
fi

# Password validation successful, exit 0
# Prints a successful message in green color

echo "$(tput setaf 2)Successful"
exit 0

