curl -s https://raw.githubusercontent.com/DOT-SUNDA/dot-lun/refs/heads/main/ips.txt | while IFS= read -r IP; do
    ssh-keygen -f "/home/codespace/.ssh/known_hosts" -R "$ip"
done
