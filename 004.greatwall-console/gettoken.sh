#!/bin/bash
tokenName=`kubectl get secrets -n kube-system  | awk /greatwall-console/{'print $1'}`

#token=`kubectl -n kube-system  get $tokenName -o jsonpath={.data.token}| base64 -d`
token=`kubectl describe -n kube-system secrets $tokenName | grep token | grep -v Name | grep -v Type`
echo "================================================================================"
echo ""
echo "Please copy text for login greatwall console"
echo ""
echo "$token" 
echo ""
echo "================================================================================"