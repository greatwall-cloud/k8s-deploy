#for i in `ls *.tar` ;do docker load -i "$i" ;done
cd $(dirname $0)
docker load < k8simage.tar
