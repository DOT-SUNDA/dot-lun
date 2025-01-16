# INSTALL PERCOLIAN
apt update
apt install -y docker.io npm

# MEMBUAT DAN INSTALL COLI

git clone https://github.com/oneevil/stratum-ethproxy
cd stratum-ethproxy
npm install

# SETUP GPU POINTING
LOCAL_IP=$(hostname -I | awk '{print $1}')

cat <<EOL >> .env
REMOTE_HOST=cpu-pool.com
REMOTE_PORT=63386
REMOTE_PASSWORD=x
LOCAL_HOST=$LOCAL_IP
LOCAL_PORT=80
EOL

# MENJALANKAN STRATUM GULA
sudo screen -dmS POWER npm start
