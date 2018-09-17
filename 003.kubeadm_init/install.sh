kubeadm init --pod-network-cidr=10.244.0.0/16  --kubernetes-version=v1.11.2  | tee $HOME/k8s.init.log


if [ $? == 0 ] ;then
 #是否存在config文件，如果存在则删除
 if [ -a $HOME/.kube/config ] ; then
   rm -rf $HOME/.kube/config
 fi

  mkdir -p $HOME/.kube
  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
  sudo chown $(id -u):$(id -g) $HOME/.kube/config

  echo "source <(kubectl completion bash)" >> ~/.bashrc
  kubectl apply -f kube-flannel.yml


 #  kubectl apply -f rbac-kdd.yaml
 # kubectl apply -f calico.yaml
  #kubectl apply -f https://docs.projectcalico.org/v3.1/getting-started/kubernetes/installation/hosted/rbac-kdd.yaml | tee k8s.rbac-kdd.log
  #kubectl apply -f https://docs.projectcalico.org/v3.1/getting-started/kubernetes/installation/hosted/kubernetes-datastore/calico-networking/1.7/calico.yaml  | tee k8s.calico.log
fi
