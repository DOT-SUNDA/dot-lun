#!/bin/bash

# Pengaturan variabel
USER="cloudsigma"
OLD_PASSWORD="Cloud2024"
NEW_PASSWORD="Dotaja123@HHHH"

if [ -z "$1" ]; then
    echo "Penggunaan: $0 ip1,ip2,ip3"
    exit 1
fi

IPS="$1"

# Baca IP dari file.txt
for IP in $IPS; do
    clear
    echo "Mengganti Sandi Vps $IP..."
    /usr/bin/expect << EOF > /dev/null 2>&1
        set timeout 10
        spawn ssh $USER@$IP
        expect {
            "yes/no" { send "yes\r"; exp_continue }
            "password:" { send "$OLD_PASSWORD\r" }
        }
        expect "Your password has expired. You must change your password now and login again!"
        expect "(current) UNIX password:" { send "$OLD_PASSWORD\r" }
        expect "Enter new UNIX password:" { send "$NEW_PASSWORD\r" }
        expect "Retype new UNIX password:" { send "$NEW_PASSWORD\r" }
        expect eof
EOF
done
