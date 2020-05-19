#!/usr/bin/env bash

# Recreate config file
rm -rf ./env-config.js
touch ./env-config.js

# Add assignment
printf "window.globalThis.process = {\n\tenv : {\n" >> ./env-config.js

# Each line represents key=value pairs
env | while read -r line || [[ -n "$line" ]];
  do
    if printf '%s\n' "$line" | grep -q -e 'REACT_APP'; then
      key=$(printf '%s\n' "$line" | sed -e 's/=.*//')
      value=$(printf '%s\n' "$line" | sed -e 's/^[^=]*=//')

      # Append configuration property to JS file
      printf "\t\t$key: \"$value\",\n" >> ./env-config.js
    fi
  done
printf  "\t}\n}\n" >> ./env-config.js

