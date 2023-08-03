#!/usr/bin/with-contenv bashio

# Loop through all keys in options.json and export them
for s in $(cat /data/options.json | jq -r "to_entries|map(\"\(.key)=\(.value|tostring)\")|.[]" ); do
  export $s
done

export TZ="${GENERIC_TIMEZONE}"
export SUPERVISOR_TOKEN="${SUPERVISOR_TOKEN}"

n8n start
