#!/bin/bash

if [ $# -eq 0 ]
  then
    git checkout "$(git branch --sort=-committerdate | cut -c 3- | gum choose)"
  else 
    git checkout "$1"
fi
