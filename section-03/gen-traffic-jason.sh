#!/bin/bash
GATEWAY_URL=$1
echo “IBM Cloud Public IP:”$GATEWAY_URL
KLAB_COOKIE=klab-cookie.txt
curl -c ./$KLAB_COOKIE -o /dev/null  -d "username=jason&password=test"  http://$GATEWAY_URL/login
while true
do
  curl -s -o /dev/null -b ./$KLAB_COOKIE http://$GATEWAY_URL/productpage
  sleep 1
done
