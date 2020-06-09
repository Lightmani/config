








apt update 
apt upgrade -y
apt install vim ufw curl wget unzip rng-tools -y
#bbr

wget --no-check-certificate https://github.com/teddysun/across/raw/master/bbr.sh && chmod +x bbr.sh && ./bbr.sh



apt install ufw -y
ufw default allow
ufw default deny
ufw allow 22
ufw allow 443
ufw allow 80
ufw enable



#wget http://soft.vpser.net/lnmp/lnmp1.7.tar.gz -cO lnmp1.7.tar.gz && tar zxf lnmp1.7.tar.gz && cd lnmp1.7 && ./install.sh nginx
apt install nginx
service nginx start

#rng
echo "HRNGDEVICE=/dev/urandom">>/etc/default/rng-tools




#wget https://github.com/zhangxiang958/Tour4U/archive/dev.zip
#unzip dev.zip
#lnmp vhost add
cd /srv
wget https://github.com/ginuerzh/gost/releases/download/v2.11.1/gost-linux-amd64-2.11.1.gz
gzip -d gost-linux-amd64-2.11.1.gz
mv gost-linux-amd64-2.11.1 gost
chmod +x gost
wget https://raw.githubusercontent.com/Lightmani/config/master/gost.service
mv gost.service /etc/systemd/system/




wget https://raw.githubusercontent.com/Lightmani/shadowsocks_install/master/shadowsocksR.sh
chmod +x shadowsocksR.sh
bash shadowsocksR.sh
service gost start

#echo "/usr/local/nginx/conf/nginx.conf "
#vi /usr/local/nginx/conf/nginx.conf 
