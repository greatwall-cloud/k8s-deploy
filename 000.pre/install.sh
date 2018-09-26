#!/bin/bash
cd $(dirname $0)
# #off swap
# swapoff -a
# sed -i '/ swap / s/^/#/' /etc/fstab
# #install curl
# dpkg -i libcurl3-gnutls_7.47.0-1ubuntu2.8_arm64.deb
# dpkg -i curl_7.47.0-1ubuntu2.8_arm64.deb

# #install sshdpass
# dpkg -i sshpass_1.05-1_arm64.deb
# #install bash-completion
# dpkg -i bash-completion_1%3a2.1-4.2ubuntu1.1_all.deb

# #https
# dpkg -i apt-transport-https_1.2.27_arm64.deb

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
#wget -q -O- 'https://mirrors.aliyun.com/ceph/keys/release.asc' | sudo apt-key add -
#echo 'deb https://mirrors.aliyun.com/ceph/debian-jewel/ xenial main' > /etc/apt/sources.list.d/ceph.list

#install kubernetes
# curl https://mirrors.aliyun.com/kubernetes/apt/doc/apt-key.gpg | apt-key add - 
# echo 'deb https://mirrors.aliyun.com/kubernetes/apt/ kubernetes-xenial main' > /etc/apt/sources.list.d/kubernetes.list
