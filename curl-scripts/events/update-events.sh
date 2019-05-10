#!/bin/bash

curl "http://localhost:4741/events/${ID}" \
  --include \
  --request PATCH \
  --header "Content-Type: application/json" \
  --header "Authorization: Token token=${TOKEN}" \
  --data '{
    "event": {
      "category": "'"${CAT}"'",
      "date": "'"${DATE}"'",
      "action": "'"${ACTION}"'",
      "friend_id": "'"${FRIEND_ID}"'",
      "is_annual": "'"${ANNUAL}"'"
    }
  }'

echo
