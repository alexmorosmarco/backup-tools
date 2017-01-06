#!/bin/bash

# $1 = origin_path: due to the cp command way of working if the path has a /
#   as last char, then the content of the folder will be copied but not the
#   folder itself.
#
# $2 = target_path: the full path is created if it does not exist.
function copy_files () {
  local Color_Off='\033[0m'
  local Cyan='\033[0;36m'
  local Green='\033[0;32m'
  local Red='\033[0;31m'
  local Underlined_Red='\033[4;31m'
  local origin_path=$1
  local target_path=$2

  if [ -z "$origin_path" ]
  then
    echo -e $Red'Error: '$Underlined_Red'origin_path'$Red' argument was not supplied'$Color_Off;
    return;
  fi

  if [ -z "$target_path" ]
  then
    echo -e $Red'Error: '$Underlined_Red'target_path'$Red' argument was not supplied'$Color_Off;
    return;
  fi

  echo -e $Cyan'(⚆ _ ⚆): Backing up files ...'$Color_Off;
  echo -e $Cyan'Origin path: '$Color_Off$origin_path;
  echo -e $Cyan'Target path: '$Color_Off$target_path;

  mkdir -p $target_path;
  cp -aiv $origin_path $target_path;

  echo -e $Green'(⚆ ‿ ⚆): The backup finished successfully.';
}

origin_path=testFiles/origin
target_path=testFiles/target

copy_files $origin_path $target_path
