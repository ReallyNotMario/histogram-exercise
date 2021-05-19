#!/bin/bash
# manually delete tempdata.csv and nulladdresses.csv if you want a clean slate
while true; do
echo "Fetching data."
curl -X GET "https://api.covalenthq.com/v1/pricing/tickers/?format=csv&key=ckey_fb5d7d485dc9431cb042bb93474" -H "Accept: application/json" | sed 1d >> tempdata.csv
echo "Filtering null addresses"
grep "0x0000000000000000000000000000000000000000" tempdata.csv >> nulladdresses.csv
sleep 60
done
