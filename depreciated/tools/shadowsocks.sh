#!/usr/bin/env bash

wget https://bootstrap.pypa.io/get-pip.py
python get-pip.py
pip install shadowsocks

public_ip=`curl ipinfo.io/ip`
#curl ipinfo.io/ip
#curl ip.gs
cat > /etc/shadowsocks.json << EOF
{
    "server": "${public_ip}",
    "port_password": {
        "10001": "passwd1",
        "10002": "passwd2",
        "10003": "passwd3",
    },
    "timeout": 300,
    "method": "aes-256-cfb"
}
EOF

ssserver -c /etc/shadowsocks.json -d start