#!/bin/bash
cd $(dirname $0)

#添加DNS
if [ -s  /etc/resolv.conf ] ; then
echo "nameserver 114.114.114.114" > /etc/resolv.conf
fi
#off swap
swapoff -a
sed -i '/ swap / s/^/#/' /etc/fstab
#install curl
dpkg -i libcurl3-gnutls_7.47.0-1ubuntu2.8_arm64.deb
dpkg -i curl_7.47.0-1ubuntu2.8_arm64.deb

#install sshdpass
dpkg -i sshpass_1.05-1_arm64.deb
#install bash-completion
dpkg -i bash-completion_1%3a2.1-4.2ubuntu1.1_all.deb

#install ntp
###########################

#https
dpkg -i apt-transport-https_1.2.27_arm64.deb
#install docker
systemctl stop docker
dpkg -i less_481-2.1ubuntu0.2_arm64.deb
dpkg -i bridge-utils_1.5-9ubuntu1_arm64.deb
dpkg -i cgroupfs-mount_1.2_all.deb
dpkg -i docker.io_17.03.2-0ubuntu2~16.04.1_arm64.deb
dpkg -i liberror-perl_0.17-1.2_all.deb
dpkg -i git-man_1%3a2.7.4-0ubuntu1.4_all.deb
dpkg -i git_1%3a2.7.4-0ubuntu1.4_arm64.deb
dpkg -i netcat-traditional_1.10-41_arm64.deb
dpkg -i netcat_1.10-41_all.deb
dpkg -i ubuntu-fan_0.12.8~16.04.2_all.deb

cat > /etc/docker/daemon.json <<EOF
{
  "registry-mirrors": ["https://36hvcnma.mirror.aliyuncs.com"]
}
EOF
sudo systemctl restart docker

#change source
cat > /etc/apt/sources.list <<EOF
# 默认注释了源码仓库，如有需要可自行取消注释
deb https://mirrors.ustc.edu.cn/ubuntu-ports/ xenial main restricted universe multiverse
deb-src https://mirrors.ustc.edu.cn/ubuntu-ports/ xenial main main restricted universe multiverse
deb https://mirrors.ustc.edu.cn/ubuntu-ports/ xenial-updates main restricted universe multiverse
deb-src https://mirrors.ustc.edu.cn/ubuntu-ports/ xenial-updates main restricted universe multiverse
deb https://mirrors.ustc.edu.cn/ubuntu-ports/ xenial-backports main restricted universe multiverse
deb-src https://mirrors.ustc.edu.cn/ubuntu-ports/ xenial-backports main restricted universe multiverse
deb https://mirrors.ustc.edu.cn/ubuntu-ports/ xenial-security main restricted universe multiverse
deb-src https://mirrors.ustc.edu.cn/ubuntu-ports/ xenial-security main restricted universe multiverse
# 预发布软件源，不建议启用
# deb https://mirrors.ustc.edu.cn/ubuntu-ports/ xenial-proposed main restricted universe multiverse
# deb-src https://mirrors.ustc.edu.cn/ubuntu-ports/ xenial-proposed main restricted universe multiverse
EOF

#install ceph 
wget -q -O- 'https://mirrors.aliyun.com/ceph/keys/release.asc' | sudo apt-key add -
echo 'deb https://mirrors.aliyun.com/ceph/debian-jewel/ xenial main' > /etc/apt/sources.list.d/ceph.list

#install kubernetes
curl https://mirrors.aliyun.com/kubernetes/apt/doc/apt-key.gpg | apt-key add -
echo 'deb https://mirrors.aliyun.com/kubernetes/apt/ kubernetes-xenial main' > /etc/apt/sources.list.d/kubernetes.list
