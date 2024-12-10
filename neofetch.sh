#!/bin/bash

# Fungsi untuk menampilkan informasi sistem
display_system_info() {
    echo "##########################################"
    echo "            SYSTEM INFORMATION           "
    echo "##########################################"
    echo "Hostname: $(hostname)"
    echo "OS: $(uname -o)"
    echo "Kernel: $(uname -r)"
    echo "Uptime: $(uptime -p)"
    echo "Packages: $(dpkg --get-selections | wc -l)"
    echo "Shell: $SHELL"
    echo "CPU: $(lscpu | grep 'Model name' | cut -d ':' -f2 | sed 's/^[ \t]*//')"
    
    # Menampilkan informasi memori dengan format yang benar
    MEM=$(free -h | grep Mem | awk '{print $3 "/" $2}')
    echo "Memory: $MEM"
    echo "##########################################"
}

# Fungsi untuk menampilkan informasi ISP dan lokasi menggunakan curl atau wget
display_isp_info() {
    # Mengecek apakah curl tersedia
    if command -v curl &> /dev/null
    then
        IP=$(curl -s https://ipinfo.io/ip)
        ISP=$(curl -s https://ipinfo.io/org)
        LOCATION=$(curl -s https://ipinfo.io/city), $(curl -s https://ipinfo.io/country)
    # Jika curl tidak ditemukan, menggunakan wget
    elif command -v wget &> /dev/null
    then
        IP=$(wget -qO- https://ipinfo.io/ip)
        ISP=$(wget -qO- https://ipinfo.io/org)
        LOCATION=$(wget -qO- https://ipinfo.io/city), $(wget -qO- https://ipinfo.io/country)
    else
        echo "Curl atau wget tidak ditemukan. Tidak dapat mengakses informasi ISP."
        exit 1
    fi

    echo "IP Address: $IP"
    echo "ISP: $ISP"
    echo "Location: $LOCATION"
    echo "##########################################"
}

# Memanggil fungsi
display_system_info
display_isp_info
