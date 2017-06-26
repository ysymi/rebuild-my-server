#!/usr/bin/env bash

. util.sh

case "$os" in
    "darwin")
        brew install curl
        ;;
    "ubuntu")
        apt-get install curl
        ;;
esac
