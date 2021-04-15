#!/bin/bash

#if [ "$#" -ne 1 ]; then
#  echo "Usage: $0 DIRECTORY" >&2
#  exit 1
#fi
#if ! [ -e "$1" ]; then
#  echo "$1 not found" >&2
#  exit 1
#fi
#if ! [ -d "$1" ]; then
#  echo "$1 not a directory" >&2
#  exit 1
#fi

if [ "$#" -ne 1 ]; then
  echo "Usage: $0 FILE" >&2
  exit 1
fi

#pg_restore -C -d admin_development $1 -C is create the database before restoring it
pg_restore --clean -d admin_development "$1"
