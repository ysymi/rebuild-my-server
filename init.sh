#!/usr/bin/env bash

function modify_sshd {

    sed -i 's/Port 22/Port 22789/' /etc/ssh/sshd_config
    sed -i 's/^GSSAPI/#GSSAPI/g' /etc/ssh/sshd_config

    sed -i '/PasswordAuthentication/d' /etc/ssh/sshd_config
    sed -i '/PubkeyAuthentication/d' /etc/ssh/sshd_config
    sed -i '/RSAAuthentication/d' /etc/ssh/sshd_config
    sed -i '/UseDNS/d' /etc/ssh/sshd_config

    echo 'PasswordAuthentication no' >> /etc/ssh/sshd_config
    echo 'PubkeyAuthentication yes' >> /etc/ssh/sshd_config
    echo 'RSAAuthentication yes' >> /etc/ssh/sshd_config
    echo 'UseDNS no' >> /etc/ssh/sshd_config

    service ssh restart
}

# for bbr
function install_kernel {

    wget http://kernel.ubuntu.com/~kernel-ppa/mainline/v4.9/linux-image-4.9.0-040900-generic_4.9.0-040900.201612111631_amd64.deb
    dpkg -i linux-image-4.9.0*.deb
    update-grub
    reboot

}

function open_bbr {

    echo "net.core.default_qdisc=fq" >> /etc/sysctl.conf
    echo "net.ipv4.tcp_congestion_control=bbr" >> /etc/sysctl.conf
    sysctl -p
    sysctl net.ipv4.tcp_available_congestion_control

}