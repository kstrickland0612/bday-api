#!/bin/bash

curl "http://localhost:4741/events" \
  --include \
  --request POST \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "event": {
      "category": "'"${CAT}"'",
      "date": "'"${DATE}"'",
      "action": "'"${ACTION}"'",
      "friend_id": "'"${FRIEND_ID}"'"
    }
  }'

echo
