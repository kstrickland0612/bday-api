#!/bin/bash

curl "http://localhost:4741/friends/${ID}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "friend": {
      "first_name": "'"${FIRST}"'",
      "last_name": "'"${LAST}"'",
      "dob": "'"${DOB}"'"
    }
  }'

echo
