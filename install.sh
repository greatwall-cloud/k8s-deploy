#!/bin/bash
clear
#获取当前目录的绝对路径
cd $(dirname $0)
installdir=`pwd`

#为console登陆网址生成SSL证书，以便gwconsole能用chrome登陆
echo "STEP 1:"
read -p "输入准备访问的console域名地址（如：console.gwcloud.tk）：" masterIP
echo $masterIP > /tmp/masterIP.txt

#输入每个节点，传输安装文件
echo "STEP 2:"
rm -rf /tmp/nodeIP.txt
while :
do
 echo -n "输入计算节点node的IP或域名（直接回车键结束输入）： "
 read nodeIP

 if [ "$nodeIP" == "" ];then
   echo "输入完毕！"
   echo "计算节点地址如下："
   cat /tmp/nodeIP.txt
   echo -n "是否确认(y/Y),重新输入（n/N）,直接回车键继续输入："
   read checkNodeIP
   
   case $checkNodeIP in
   Y|y) echo "所有计算节点输入结束，开始下一步安装！" ;break
    ;;
   N|n) rm -rf /tmp/nodeIP.txt;continue
    ;;
   *) continue
    ;;
   esac
 fi
    echo $nodeIP >> /tmp/nodeIP.txt
done


#install docker
echo "Install docker now"
cd $installdir/001.docker-ce_17
/bin/bash $installdir/001.docker-ce_17/install.sh

#install kubeadm kubelet kubectl
echo "Install kubernetes ..."
cd $installdir/002.k8s.v1.11.2/k8s.deb.v1.11.2
/bin/bash $installdir/002.k8s.v1.11.2/k8s.deb.v1.11.2/install.sh

#import image for kubernetes-v1.11.2
echo "Load image for kubernetes ..."
cd $installdir/002.k8s.v1.11.2/k8s.master.v1.11.2
/bin/bash $installdir/002.k8s.v1.11.2/k8s.master.v1.11.2/loadall.sh

#init kubernetes for version of v1.11.2
echo "Install "
cd $installdir/003.kubeadm_init
/bin/bash $installdir/003.kubeadm_init/install.sh

#install gwconsloe
echo "Install greatwall console"
cd $installdir/004.greatwall-console
/bin/bash $installdir/004.greatwall-console/install.sh

#install ingress
cd $installdir/005.nginx-ingress/
/bin/bash $installdir/005.nginx-ingress/install_on_master.sh

cd $installdir

#如果输入过nodeIP，则开始安装计算节点
if [ -s  /tmp/nodeIP.txt ] ; then
/bin/bash per-node.sh
fi

echo "更多kubernetes 安装信息请查看文件:"
echo "                   $HOME/k8s.init.log"
echo "==========================================================="
echo "更多kubernetes 集群添加信息请查看文件:"
echo "                   $HOME/joink8s.sh"

gettoken 
