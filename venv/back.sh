#!/usr/bin/env bash

if [[ $# == 1 &&  -d $1 ]]; then
  target=$1
  rm -rf $target
  echo remove project $target
fi
