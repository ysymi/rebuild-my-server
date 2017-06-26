#!/usr/bin/env bash

cp /etc/ssh/sshd_config /etc/ssh/sshd_config.bak

# ignore gss
sed -i 's/^GSSAPI/#GSSAPI/g' /etc/ssh/sshd_config

# change ssh port to 22789
sed -i '/^Port/ s/.*/Port 22789/' /etc/ssh/sshd_config

# forbid login by password
sed -i '/^PasswordAuthentication/ s/.*/PasswordAuthentication no/' /etc/ssh/sshd_config

# allow login by pubkey
sed -i '/^PubkeyAuthentication/ s/.*/PubkeyAuthentication yes/' /etc/ssh/sshd_config

# use rsa auth
sed -i '/^RSAAuthentication/ s/.*/RSAAuthentication yes/' /etc/ssh/sshd_config

# do not use dns to save connection time
sed -i '/^UseDNS/ s/.*/UseDNS no/' /etc/ssh/sshd_config