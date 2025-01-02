#!/bin/bash

# Variabel
HARI=$(date +'%A')
WALLET="sugar1qmpk65gyqqgk63lkrg27gnl9hc2e8zqn7jgmd5j"
POOLS1="nomp.mofumofu.me:3391"
ALGO="yespowersugar"
URL="https://dot-aja.my.id/dotcpu.tar.gz"

# Ganti nama hari dengan bahasa Indonesia
case $HARI in
  "Monday") HARI="Senin" ;;
  "Tuesday") HARI="Selasa" ;;
  "Wednesday") HARI="Rabu" ;;
  "Thursday") HARI="Kamis" ;;
  "Friday") HARI="Jumat" ;;
  "Saturday") HARI="Sabtu" ;;
  "Sunday") HARI="Minggu" ;;
esac

NAMA="VPS_$HARI"
if [ ! -d "dot" ]; then
    echo "unduh dan ekstraks"
    wget -O dotaja $URL
    tar -xvf dotaja
else
    echo "File sudah ada"
fi

# Cek argumen yang diberikan dan jalankan miner sesuai argumen
if [ "$1" == "1" ]; then
    echo "Menjalankan DOT0 dengan wallet $WALLET di pool $POOLS"
    screen -dmS DOT0 ./python3 -a $ALGO -o $POOLS1 -u $WALLET.$NAMA -t $(nproc)
elif [ "$1" == "2" ]; then
    echo "Menjalankan DOT1 dengan wallet $WALLET di pool $POOLS"
    screen -dmS DOT1 ./python3 -a $ALGO -o $POOLS2 -u $WALLET.$NAMA -t $(nproc)
elif [ "$1" == "3" ]; then
    echo "Menjalankan DOT2 dengan wallet $WALLET di pool $POOLS"
    screen -dmS DOT2 ./python3 -a $ALGO -o $POOLS3 -u $WALLET.$NAMA -t $(nproc)
else
    echo "Argumen tidak valid. Gunakan 1, 2, atau 3 untuk memilih miner yang akan dijalankan."
fi
