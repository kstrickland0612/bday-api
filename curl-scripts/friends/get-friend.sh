#!/bin/bash

curl "http://localhost:4741/friends/${ID}" \
  --include \
  --request GET \
  --header "Authorization: Token token=${TOKEN}"

echo
