#!/bin/bash

# Set the email address to send the output to
EMAIL_ADDRESS="user@example.com"

# Set the interval to fetch (day or week)
INTERVAL="week"

# Set the flag for including the CVE info in the output
INFO_FLAG="-info"

# Get the current date in the format YYYY-MM-DD
DATE=$(date +%F)

# Run the pyfetch script and save the output in a variable
OUTPUT=$(python pyfetch $INTERVAL $INFO_FLAG)

# Insert the date into the email subject string
SUBJECT="CVE List - $DATE"

# Send the output to the specified email address
echo "$OUTPUT" | mail -s "$SUBJECT" $EMAIL_ADDRESS
