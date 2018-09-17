cd $(dirname $0)
#import image first
for i in `ls *.tar` ;do docker load -i "$i" ;done
#install nginx-ingress from local
kubectl apply -f mandatory.yaml
kubectl apply -f service-nodeport.yaml
#install nginx-ingress from internet
#kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/mandatory.yaml
#kubectl apply -f https://raw.githubusercontent.com/kubernetes/ingress-nginx/master/deploy/provider/baremetal/service-nodeport.yaml
