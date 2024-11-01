#!/bin/bash

# Pastikan expect terpasang untuk menangani login otomatis dengan password
if ! command -v expect &> /dev/null
then
    echo "Expect belum terpasang. Install dengan: sudo apt install expect"
    exit
fi

# Fungsi untuk menjalankan script di satu VPS
run_script() {
    local IP=$1
    local USER="cloudsigma"         # Menetapkan USER
    local PASSWORD="Dotaja123@HHHH"   # Menetapkan PASSWORD
    local COMMAND=$2

    echo "Gasken!!!"

    # Menggunakan expect untuk login otomatis dan menjalankan script
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
}

# Membaca daftar VPS Asia dan menjalankan script
curl -s https://raw.githubusercontent.com/DOT-SUNDA/dot-lun/refs/heads/main/ips.txt | while IFS= read -r IP; do
    MINEL="pkill screen; nohup bash -c 'bash <(wget -qO- https://raw.githubusercontent.com/DOT-SUNDA/dot-lun/refs/heads/main/gulazg.sh)' > /dev/null 2>&1"
    run_script "$IP" "$MINEL" &
done

# Tunggu semua proses selesai
wait

clear
echo "Selesai menjalankan script di semua VPS."
