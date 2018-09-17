#!/bin/bash
sshsec="kylincloud_123."
sshuser="root"
cmd=`cat $HOME/k8s.init.log | awk /"kubeadm join"/`
echo "$cmd" > $HOME/joink8s.sh

project_path=$(cd `dirname $0`; pwd)
currentdir="${project_path##*/}"


for i in `cat  /tmp/nodeIP.txt`;do
echo "正在传送安装文件到计算节点$i"
sshpass -p $sshsec scp  -r  $project_path $sshuser@$i:/tmp

sshpass -p $sshsec ssh  $sshuser@$i bash /tmp/$currentdir/node-install.sh
sshpass -p $sshsec ssh  $sshuser@$i bash $cmd
done