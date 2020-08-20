#! /bin/bash

set -o errexit

if ! which git || ! which wget; then
  if which apk; then
    apk add --no-cache git wget
  elif which apt-get; then
    apt-get update && apt-get install -y git wget
  fi
fi

INSTALLATION_DIR=/usr/local/cachr
git clone https://github.com/scripbox/cachr.git $INSTALLATION_DIR
mkdir -p $INSTALLATION_DIR/bin
wget https://github.com/scripbox/cachr/releases/download/v1.1/cachr-ubuntu -O $INSTALLATION_DIR/bin/cachr
chmod +x $INSTALLATION_DIR/bin/cachr
ln -sf $INSTALLATION_DIR/cache_run /usr/bin/cache_run
ln -sf $INSTALLATION_DIR/cache_get /usr/bin/cache_get
ln -sf $INSTALLATION_DIR/bin/cachr /usr/bin/cachr
