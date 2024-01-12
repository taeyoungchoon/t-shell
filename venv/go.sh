#!/usr/bin/env bash

if [[ $# == 1 ]]; then 
  target=$1
  mkdir $target
  python3 -m venv $target/.venv --prompt $target
  echo virtual env made for project $target
fi
