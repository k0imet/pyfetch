#!/bin/bash
par_dir=/home/k0imet/pyfetch/
reports_dir=$par_dir/Trends/
oldreports_dir=/home/k0imet/pyfetch/Trends/Old_reports
outputtxtfile=$reports_dir/Trending_CVEs_$(date "+%F").txt #this is a txt file generated when the scan is done.
outputHTMLfile=$reports_dir/Trending_CVES_$(date "+%F").html #this file created when the txt file is converted to HTML.
trending=$reports_dir/Trending*
# Set the email address to send the trending CVEs to
EMAIL_ADDRESS="you@email.com"

# Set the subject of the email
EMAIL_SUBJECT="Trending CVEs for $(date +%F)"

# Set the body of the email
EMAIL_BODY="Hello kindly find attached copy of trending CVEs for $(date +%F)"

# Generate a string with the current date and time in the format YYYY-MM-DD_HHMMSS
DATE=$(date +%F)

# Capture the output of the pyfetch.py command and store it in the TRENDING_CVE_LIST variable
TRENDING_CVE_LIST=$(/usr/bin/python /home/k0imet/pyfetch/pyfetch.py day -info)

# Save the output of the pyfetch.py command to a file called trending_cves_YYYY-MM-DD_HHMMSS.txt,
# where YYYY-MM-DD_HHMMSS is the current date and time
echo "$TRENDING_CVE_LIST" > $outputtxtfile

# Colorize the word "CRITICAL" in the file using the sed command
sed -i 's/CRITICAL/\x1B[31mCRITICAL\x1B[0m/g' $outputtxtfile
# Colorize the word "HIGH" in the file using the sed command
sed -i 's/HIGH/\x1B[35mHIGH\x1B[0m/g' $outputtxtfile

# Colorize the word "MEDIUM" in the file using the sed command
sed -i 's/MEDIUM/\x1B[33mMEDIUM\x1B[0m/g' $outputtxtfile

# Colorize the word "None" in the file using the sed command
sed -i 's/None/\x1B[32mNone\x1B[0m/g' $outputtxtfile

# Convert the ANSI colors in the trending_cves_$DATE_TIME.txt file to HTML using the ansi2html command
HTML_OUTPUT=$(/home/k0imet/.local/bin/ansi2html < $outputtxtfile)

echo "$HTML_OUTPUT" >> $outputHTMLfile
#echo "Content-Type: text/html" >> trending_cves_$DATE.html
#echo "" >> trending_cves_$DATE.html

# Check if the outputHTMLfile is empty
if [ ! -s "$outputHTMLfile" ]; then
  echo "Error: $outputHTMLfile is empty" >&2
  exit 1
fi

# Send the email
# with the trending CVEs appended to the body of the email as HTML
echo "$EMAIL_BODY" |  mutt -e "set content_type=text/html" -s "$EMAIL_SUBJECT" $EMAIL_ADDRESS < $outputHTMLfile

#Clean up DIR
mv $trending $oldreports_dir/
