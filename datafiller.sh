#!/bin/bash
# first make the baseline file
echo "first make the baseline file"
curl -X GET "https://api.covalenthq.com/v1/pricing/tickers/?format=csv&key=ckey_fb5d7d485dc9431cb042bb93474" -H "Accept: application/json" > tempdata.csv
while true; do
sleep 10 
echo "then delete the first line from the new csv file and append it to the old one"
# then delete the first line from the new csv file and append it to the old one
curl -X GET "https://api.covalenthq.com/v1/pricing/tickers/?format=csv&key=ckey_fb5d7d485dc9431cb042bb93474" -H "Accept: application/json" | sed 1d >> tempdata.csv
done
