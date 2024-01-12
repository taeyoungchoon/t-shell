#!/usr/bin/env bash

if [[ $# == 1 ]]; then 
  target=$1
  mkdir $target
  cd $target
  python3 -m venv .venv --prompt $target
  echo virtual env made for project $target
fi
