#!/usr/bin/env bash

if [[ -z $1 || -z $2 ]]; then
  echo 'provide redhat username and password';
  exit;
else
  USERNAME=$1; PASSWORD=$2
fi

function status {
  state=$(subscription-manager status | awk '/Overall/ { print $3 }')
  printf 'State: %s\n' $state
}

function sm {
  local request=$1

  if [[ $request =~ ^register$ ]]; then
    option="--username=$USERNAME --password=$PASSWORD"
  elif [[ $request =~ ^unregister$ ]]; then
    option=""
  elif [[ $request =~ ^attach$ ]]; then
    option="--auto"
  elif [[ $request =~ ^remove$ ]]; then
    option="--all"
  fi

  printf 'Stage: %s\n' ${request^}
  subscription-manager $request $option &>/dev/null
}

status

requests=(register attach)
#requests=(register attach remove unregister)
for request in "${requests[@]}"; do
  sm $request
  status
done
