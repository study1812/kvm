
vim /etc/sysconfig/network-scripts/ifcfg-eth0

DEVICE=eth0
ONBOOT=yes
BRIDGE=br0

vim /etc/sysconfig/network-scripts/ifcfg-br0

DEVICE=br0
ONBOOT=yes
BOOTPROTO=static
NM_CONTROLLED=no
IPADDR=172.16.100.10
GATEWAY=172.16.100.2
NETMASK=255.255.255.0
USERCTL=no
TYPE=Bridge
```


重启网络 使之生效

```
systemctl  restart network
```

检查宿主机是否支持  kvm

egrep '(vmx|svm)' /proc/cpuinfo


安装kvm 

yum   -y   install   libvirt*  

创建 kvm 使用的网络  名字是  br0   类型为桥接    桥接到宿主机的br0 网桥上


```echo "<network><name>br0</name><uuid>`uuidgen`</uuid><forward mode='bridge'/><bridge name='br0' /></network>" >  /etc/libvirt/qemu/networks/br0.xml```

```
virsh net-define    /etc/libvirt/qemu/networks/br0.xml
virsh net-start   br0
virsh  net-autostart  br0
mkdir -p /kvm/image
mkdir  -p /kvm/iso
virsh pool-define-as  kvmimage  dir --target  "/kvm/image"
virsh pool-define-as  ISO  dir --target  "/kvm/iso"
virsh pool-start  kvmimage
virsh pool-start  ISO
virsh  pool-autostart   kvmimage
virsh  pool-autostart   ISO
```

按装virt-manager  图形工具

```
yum   -y   install    virt-manager xorg*
```


在xshell 中再次连接宿主机  可以多尝试几次 只到 没有再出现 之类的提示 

输入 virt-manager 命令  即可打开图形工具
