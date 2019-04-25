#!/bin/bash

curl "http://localhost:4741/friends" \
  --include \
  --request GET \
  --header "Authorization: Token token=${TOKEN}"

echo
