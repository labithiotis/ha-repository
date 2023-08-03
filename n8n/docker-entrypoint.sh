#!/usr/bin/with-contenv bashio

# Loop through all keys in options.json and export them
for s in $(cat /data/options.json | jq -r "to_entries|map(\"\(.key)=\(.value|tostring)\")|.[]" ); do
  export $s
done

export $SUPERVISOR_TOKEN
export TZ="${GENERIC_TIMEZONE}"

n8n start
