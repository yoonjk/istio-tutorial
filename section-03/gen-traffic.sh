#!/bin/bash
GATEWAY_URL=$1
echo “IBM Cloud Public IP:” $GATEWAY_URL
while true
do
  curl -s -o /dev/null http://$GATEWAY_URL/productpage
  sleep 1
done
