#!/bin/bash
cd $(dirname $0)
installdir=`pwd`



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

#install gwconsloe
echo "Install greatwall console"
cd $installdir/004.greatwall-console
docker load < $installdir/004.greatwall-console/*.tar

#install ingress
echo "Install nginx-ingress"
cd $installdir/005.nginx-ingress
/bin/bash $installdir/005.nginx-ingress/install_on_node.sh

