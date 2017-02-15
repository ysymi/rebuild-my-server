
function modify_sshd {
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

# install shadowsocks
function install_shadowsocks {

    wget https://bootstrap.pypa.io/get-pip.py
    python get-pip.py
    pip install shadowsocks

}

function run_shadowscks {


}


function main(){

    case $1 in
    0)
        modify_sshd
        ;;
    1)
        install_kernel
        ;;
    2)
        open_bbr
        ;;
    3)
        install_shadowsocks
        ;;
    4)
        run_shadowscks
        ;;
    *)
        ;;
    esac
}

main