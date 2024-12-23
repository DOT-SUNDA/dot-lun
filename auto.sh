# INSTALL PERCOLIAN
sudo apt update
sudo apt install -y docker.io npm

# MEMBUAT DAN INSTALL COLI
mkdir Pointing
cd Pointing
git clone https://github.com/oneevil/stratum-ethproxy
cd stratum-ethproxy
npm install

# SETUP GPU POINTING
LOCAL_IP=$(hostname -I | awk '{print $1}')

cat <<EOL >> .env
REMOTE_HOST=yespowersugar.eu.mine.zergpool.com
REMOTE_PORT=6535
REMOTE_PASSWORD=x
LOCAL_HOST=$LOCAL_IP
LOCAL_PORT=443
EOL

# MENJALANKAN STRATUM GULA
sudo screen -dmS GULA npm start
