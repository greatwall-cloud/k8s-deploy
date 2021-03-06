#!/bin/bash

appName=$1
#解析地址如gw.gwcloud.tk
appAddress=$2
servicePort=$3

#创建证书
kubectl create secret tls ingress-secret --namespace=app-${appName} --key privkey.pem --cert fullchain.pem
#创建HTTPs的ingress解析，$1为应用名，$2为域名地址
#创建在域名空间app-xxx中，名字为xxx-ingress的配置
cat > ingress.yaml <<EOF
apiVersion: extensions/v1beta1
kind: Ingress
metadata:
  name: ${appName}-ingress
  namespace: app-${appName}
spec:
#无证书直接删除以下4行
  tls:
  - hosts:
    - ${appAddress}
    secretName: ingress-secret
  rules:
  - host: ${appAddress}
    http:
      paths:
      - backend:
          serviceName: ${appName}
          servicePort: ${servicePort}
EOF
kubectl apply -f ingress.yaml