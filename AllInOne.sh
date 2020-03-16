
#初始环境
environment(){

apt update 
apt upgrade -y
apt install vim ufw curl wget unzip rng-tools -y
#bbr

wget --no-check-certificate https://github.com/teddysun/across/raw/master/bbr.sh && chmod +x bbr.sh && ./bbr.sh

}

modify_port_UUID(){

    UUID=$(cat /proc/sys/kernel/random/uuid)

    sed -i "/\"id\"/c \\\t  \"id\":\"${UUID}\"," /etc/v2ray/config.json


}

#Firewall
firewall(){
apt install ufw -y
ufw default allow
ufw default deny
ufw allow 28913
ufw allow 443
ufw allow 80
ufw enable
}

#获取ssh
#wget --no-check-certificate https://raw.githubusercontent.com/Lightmani/Seetheworld/master/ssh.sh?token=AKJ42JSK6FEB24V7UO2AKUS6LXV3Y  -cO ssh.sh&& chmod +x ssh.sh && ./ssh.sh 1xd4onbNDMvf

ssha(){
echo "PasswordAuthentication no">>/etc/ssh/sshd_config
echo "PubkeyAuthentication yes">>/etc/ssh/sshd_config
echo "Port 28913">>/etc/ssh/sshd_config
service sshd restart
}

#net-speeder 	
#wget https://github.com/snooda/net-speeder/archive/master.zip	
#unzip master.zip	
#apt-get install libnet1-dev libpcap0.8-dev -y	
#cd /net 	
#sh build.sh	
#ethtool -K xxx tso off	
#nohup /root/net/net_speeder eth0 "tcp src port 443" >/dev/null 2>&1 &	
#cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime	
#echo '0 18 * * * root nohup /root/net/net_speeder eth0 "tcp src port 443" >/dev/null 2>&1 &' >>/etc/crontab	
#echo "0 2 * * * root killall net_speeder" >>/etc/crontab	
#/etc/init.d/cron restart


#bbr2
#wget --no-check-certificate -q -O bbr2.sh "https://raw.githubusercontent.com/yeyingorg/bbr2.sh/master/bbr2.sh" && chmod +x bbr2.sh && bash bbr2.sh


#LNMP一键
v2_nginx(){


#rng
echo "HRNGDEVICE=/dev/urandom">>/etc/default/rng-tools
#cat /proc/sys/kernel/random/entropy_avail

#V2ray
bash <(curl -L -s https://install.direct/go.sh)
cd /etc/v2ray
rm config.json
*****************************************
wget https://raw.githubusercontent.com/Lightmani/config/master/config.json  -cO config.json
modify_port_UUID
service v2ray restart
wget https://raw.githubusercontent.com/Lightmani/config/master/traffic.sh -cO traffic.sh
chmod 755 traffic.sh

clear
echo "v9-dy.ixigua.com"
echo "/srv/Tour4U-dev"
lnmp vhost add
wget https://raw.githubusercontent.com/Lightmani/Seetheworld/master/v9-dy.ixigua.com.conf?token=AKJ42JVTD3IW4RNVUPR3PEC6O776W -cO a.json
cat a.json>/usr/local/nginx/conf/vhost/v9-dy.ixigua.com.conf


echo "*******************************************************************"
lnmp restart
service v2ray status
echo "USE vi /usr/local/nginx/conf/vhost/ To Change Nginx File"
echo -e "${Red} 用户id（UUID）：${Font} ${UUID}"
}


echo -e "1.Environment"
echo -e "2.V2Ray+Nginx"
echo -e "3.SSH"
echo -e "4.Firewall"
echo -e "5.All"
read -p "Press:" menu_Num
case "$menu_Num" in
	1)
	environment
	;;
	2)
	v2_nginx
	;;
	3)
	ssha
	;;
	4)
	firewall
	;;
	5)
	environment
    ssha
    firewall
    v2_nginx
	;;
	*)
	echo "Enter Right[1-5]:"
	;;
esac
