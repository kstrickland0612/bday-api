#!/bin/bash

curl "http://localhost:4741/friends" \
  --include \
  --request POST \
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
