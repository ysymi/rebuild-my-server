#!/usr/bin/env bash

function get_os()
{
    platform=`python -mplatform`
    if [ `echo 
    case "$platform" in
        "Darwin")
            return darwin
            ;;
        "Linux")
            [[ `python -mplatform | grep -o Ubuntu` = "Ubuntu" ]] && return ubuntu
            ;;
        *)
            return unknown
    esac
}

os=$(get_os)