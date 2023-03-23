#!/bin/bash

#using google api to update dynamic dns record
#https://support.google.com/domains/answer/6147083

MYIP=$(curl -s "https://domains.google.com/checkip")
URL="https://${USERNAME}:${PASSWORD}@domains.google.com/nic/update?hostname=${HOST}&myip=${MYIP}"

RESPONSE=$(curl -s $URL)

if [[ $RESPONSE =~ ^(good|nochg) ]]; then
  echo "[$(date)] IP updated Successfully"
else
  echo "[$(date)] Error while updating: \"$RESPONSE\""
fi
