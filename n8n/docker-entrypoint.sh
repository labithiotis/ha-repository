#!/usr/bin/with-contenv bashio

# Loop through all keys in options.json and export them
for s in $(cat options.json | jq -r "to_entries|map(\"\(.key)=\(.value|tostring)\")|.[]" ); do
  export $s
done

if [ -z "${N8N_BASIC_AUTH_USER}" ] || [ -z "${N8N_BASIC_AUTH_ACTIVE}" ]; then
  export N8N_BASIC_AUTH_ACTIVE=false
  unset N8N_BASIC_AUTH_USER
  unset N8N_BASIC_AUTH_PASSWORD
fi

export TZ="${GENERIC_TIMEZONE}"

n8n start
