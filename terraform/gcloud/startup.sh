#!/bin/bash

apt-get update
apt-get -y install wget coreutils
wget https://github.com/interbiznw/btcp-node/raw/master/btcpd -O /root/btcpd
wget https://github.com/interbiznw/btcp-node/raw/master/btcp-cli -O /root/btcp-cli
chmod +x /root/btcpd
chmod +x /root/btcp-cli
cp /root/btcpd /usr/bin/btcpd
cp /root/btcp-cli /usr/bin/btcp-cli
mkdir /root/.bitcoinprivate
wget https://raw.githubusercontent.com/interbiznw/btcp-node/b1d0313069823fb70211574e784c034e8d77e3ed/btcprivate.conf -O /root/.bitcoinprivate/btcprivate.conf
wget https://raw.githubusercontent.com/interbiznw/btcp-node/master/terraform/gcloud/fetch-params.sh -O /root/fetch-params.sh
chmod +x /root/fetch-params.sh
bash /root/fetch-params.sh
echo hi > /root/test.txt