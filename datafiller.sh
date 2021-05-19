#!/bin/bash
# first make the baseline file
echo "Making baseline file"
curl -X GET "https://api.covalenthq.com/v1/pricing/tickers/?format=csv&key=ckey_fb5d7d485dc9431cb042bb93474" -H "Accept: application/json" > tempdata.csv
grep "contract_decimals" tempdata.csv > nulladdresses.csv
grep "0x0000000000000000000000000000000000000000" tempdata.csv >> nulladdresses.csv
START=`date +%s`
while [ $(( $(date +%s) - 3600 )) -lt $START ]; do
sleep 60
echo "Appending new csv file to the old one"
# then delete the first line from the new csv file and append it to the old one
curl -X GET "https://api.covalenthq.com/v1/pricing/tickers/?format=csv&key=ckey_fb5d7d485dc9431cb042bb93474" -H "Accept: application/json" | sed 1d >> tempdata.csv
grep "0x0000000000000000000000000000000000000000" tempdata.csv >> nulladdresses.csv
done
