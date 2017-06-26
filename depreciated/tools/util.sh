#!/usr/bin/env bash

function get_os()
{
    os=`uname`
    case "$os" in
        "Darwin")
            echo darwin
            ;;
        "Linux")
            [[ `python -mplatform | grep -o Ubuntu` = "Ubuntu" ]] && echo ubuntu
            ;;
        *)
            echo unknown
    esac
}

os=$(get_os)