# Password Validator script forked to Powershell
# Author: Noam Ben-Ari, noam.benari@gmail.com
# This script performs password strenth validation automatically with the given password as a parameter
# Usage Parameters: ./password-validator.sh {PASSWORD}
#
# The script was written performance wise to use minimum variables as possible

# Validates number of characters in the passed parameter ${#1}
#   and outputs a message whether they are not equal or greater then 10 (in red color)

if ( -Not ( $args[0].Length -ge 10 ) )
{
	Write-Host "Password is lower than 10 characters" -ForegroundColor Red
	exit 1
}

# Validates alphabet and digits
#   in the passed parameter $1
#   and outputs a message whether they are not containing both alphabet and numbers (in red color)

if ( -Not ( $args[0] -cmatch '[^a-zA-Z]' -And $args[0] -match '[^0-9]' ) )
{
	Write-Host "Password doesn't contain both alphabet and numbers" -ForegroundColor Red
	exit 1
}

# Validates uppercase and lowercase letters
#   in the passed parameter $1
#   and outputs a message whether they are not containing both uppercase and & lowercase letters (in red color)

if ( -Not ( $args[0] -cmatch '[A-Z]' -And $args[0] -cmatch '[a-z]' ) )
{
	Write-Host "Password doesn't contains both upppercase and lowercase" -ForegroundColor Red
	exit 1
}

# Password validation successful, exit 0
# Prints a successful message in green color

Write-Host "Successful" -ForegroundColor Green

exit 0
