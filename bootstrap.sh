#!/bin/bash
download_url=https://mcashchain-snapshot.s3-ap-southeast-1.amazonaws.com/bootstrap.tar.gz
if [[ -d "${BASH_SOURCE%/*}/volumes" ]]; then
  read -p "The blockchain directory already exists, do you want to replace it? y/N  " -n 1 -r
  echo
  if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    [[ "$0" = "$BASH_SOURCE" ]] && exit 1 || return 1
  else
    rm -rf "${BASH_SOURCE%/*}/volumes"
  fi
fi
if [[ -f "${BASH_SOURCE%/*}/bootstrap.tar.gz" ]]; then
  read -p "The bootstrap.tar.gz file already exists, do you want to re-download it? y/N  " -n 1 -r
  echo
  if [[ $REPLY =~ ^[Yy]$ ]]; then
    rm -f bootstrap.tar.gz
    wget "$download_url"
  fi
else
  wget "$download_url"
fi

tar -xzf bootstrap.tar.gz
rm -f bootstrap.tar.gz
