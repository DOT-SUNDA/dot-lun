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
    echo "Memory: $(free -h | grep Mem | awk '{print $3 "/" $2}')"
    echo "##########################################"
}

# Memanggil fungsi
display_system_info
