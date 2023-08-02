#!/usr/bin/sh

if ! [ -x "$(command -v jq)" ]; then
  apk update && apk upgrade && apk add --no-cache jq
fi

# Loop through all keys in options.json and export them
for s in $(cat options.json | jq -r "to_entries|map(\"\(.key)=\(.value|tostring)\")|.[]" ); do
  export $s
done

export TZ="${GENERIC_TIMEZONE}"

n8n start
