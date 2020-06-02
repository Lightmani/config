#wget --no-check-certificate -q -O fly.sh "https://raw.githubusercontent.com/Lightmani/Seetheworld/master/All%20In%20One?token=AKJ42JUQCGXUEZ746G24RZC6O774E" && chmod +x fly.sh && bash fly.sh










apt update 
apt upgrade -y
apt install vim ufw curl wget unzip rng-tools -y
#bbr

wget --no-check-certificate https://github.com/teddysun/across/raw/master/bbr.sh && chmod +x bbr.sh && ./bbr.sh



apt install ufw -y
ufw default allow
ufw default deny
ufw allow 28913
ufw allow 443
ufw allow 80
ufw enable



wget http://soft.vpser.net/lnmp/lnmp1.6.tar.gz -cO lnmp1.6.tar.gz && tar zxf lnmp1.6.tar.gz && cd lnmp1.6
./install.sh nginx

#rng
echo "HRNGDEVICE=/dev/urandom">>/etc/default/rng-tools




cd /srv
wget https://github.com/zhangxiang958/Tour4U/archive/dev.zip
unzip dev.zip
lnmp vhost add


wget https://raw.githubusercontent.com/Lightmani/shadowsocks_install/master/shadowsocksR.sh
chmod +x shadowsocksR.sh
bash shadowsocksR.sh

echo "/usr/local/nginx/conf/nginx.conf "
vi /usr/local/nginx/conf/nginx.conf 
