clear
echo "开始安装..."
yum -y install wget,git
cd ~
wget -N --no-check-certificate https://github.com/teddysun/across/raw/master/bbr.sh && chmod +x bbr.sh
clear
yum -y update
yum -y groupinstall "Development Tools"
wget https://github.com/jedisct1/libsodium/releases/download/1.0.16/libsodium-1.0.16.tar.gz
tar xf libsodium-1.0.16.tar.gz && cd libsodium-1.0.16
./configure && make -j2 && make install
echo /usr/local/lib > /etc/ld.so.conf.d/usr_local_lib.conf
ldconfig && cd ~
yum -y install epel-release
yum -y install python-pip
git clone https://github.com/Anankke/shadowsocks.git
cd shadowsocks
git reset --hard efc986b731164aae3fef6fb5b9e8802754e63e3e
pip install -r requirements.txt
cp apiconfig.py userapiconfig.py
cp config.json user-config.json
cd ~
rm -rf libsodium-1.0.16.tar.gz
rm -rf libsodium-1.0.16
./bbr.sh
