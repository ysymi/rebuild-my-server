#!/usr/bin/env bash

. util.sh


case "$os" in
    "darwin")
        brew install ack
        ;;
    "ubuntu")
        apt-get install ack-grep
        dpkg-divert --local --divert /usr/bin/ack --rename --add /usr/bin/ack-grep
        ;;
esac
