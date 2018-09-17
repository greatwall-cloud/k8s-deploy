#/bin/bash
cd $(dirname $0)
# cert_dir="/opt/gwconsole/certs"
hostip=`cat /tmp/masterIP.txt`
#创建gwconsole证书
if [ ! -d tls ] ; then 
mkdir tls
fi

cert_dir="tls"


openssl genrsa -out $cert_dir/dashboard.key 1024
openssl req -new -x509 -key $cert_dir/dashboard.key -out $cert_dir/dashboard.crt -subj "/C=ZH/L=beijing/O=gw/CN=$hostip"
# 创建证书配置
# kubectl create secret tls kubernetes-dashboard-certs --namespace=kube-system --key $cert_dir/dashboard.key --cert $cert_dir/dashboard.crt
 kubectl create secret generic greatwall-console-certs --namespace=kube-system --from-file="$cert_dir/dashboard.key,$cert_dir/dashboard.crt"

#gwclonsoel名字为"greatwall-console-arm64-v1.0.tar"
docker load < greatwall-console-arm64-v1.0.tar


kubectl apply -f greatwallconsole.yaml
kubectl apply -f greatwallconsole-admin.yaml
#token的获取命令创建
cp gettoken.sh /usr/bin/gettoken
chmod +x /usr/bin/gettoken

#kubectl proxy --address='0.0.0.0' --port=8001 --accept-hosts='^*$' &
#echo "please visit http://MASTERIP:8001/api/v1/namespaces/kube-system/services/https:kubernetes-dashboard:/proxy/"

