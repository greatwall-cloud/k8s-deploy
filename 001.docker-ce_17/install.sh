#!/bin/bash
cd $(dirname $0)
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
  "registry-mirrors": ["https://docker.mirrors.ustc.edu.cn/"]
}
EOF
sudo systemctl restart docker



#dpkg -i apt-transport-https_1.6.2_all.deb
#dpkg -i aufs-tools_1%3a4.9+20170918-1ubuntu1_amd64.deb
#dpkg -i cgroupfs-mount_1.4_all.deb
#dpkg -i libltdl7_2.4.6-2_amd64.deb
#dpkg -i pigz_2.4-1_amd64.deb
#dpkg -i docker-ce_18.03.1~ce~3-0~ubuntu_amd64.deb
