# 在kylin上使用离线方式快速安装K8S v1.11.2以及greatwall-console v1.1  
## 1、系统环境
```
系统版本
kylin 4.0.2
kubernete v1.11.2
greatwall-console v1.0.0
机器数量 x3 
配置 16核 32G 150G硬盘
k8s-master   172.16.4.27
k8s-node1     172.16.4.28
k8s-node2     172.16.4.29
```
## 2、准备工作(以下操作在三台机器中进行)

### 2.1 kylin 4.0.2
```
     默认安装 略
```
### 2.2 配置主机名、IP地址
     配置主机名、IP地址，步骤略

     reboot

### 2.3 自动安装
```
      bash install.sh
      输入主节点IP或者外部访问域名地址，
      输入各计算节点的IP地址  
```
####   2.3.1 自动关闭swap，安装curl，安装docker
####  2.3.2 自动安装Kubeadm等程序
####   2.3.3 导入镜像并初始化集群
      #注意修改脚本中初始化的网络地址
      #通过LOG文件查看客户端加入的命令
####   2.3.4  安装长城融合云console
      #通过gettoken命令获取登陆令牌

####   2.3.5 将安装文件根据之前输入的计算节点IP逐个传送安装文件到/tmp目录下
       自动安装，并且加入集群

## 3、kubernetes集群安装相关信息
```
安装日志：$HOME/k8s.init.log
集群加入命令：$HOME/joink8s.sh
      gwconsole的登陆：（1）直接点执行命令gettoken
                       （2）$HOME/gwconsole-token.md
```
## 4、入门命令
      https://kubernetes.io/docs/home/
      http://docs.kubernetes.org.cn/
      略，请自行学习
