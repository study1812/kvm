libvirtd 中主要的对象



|主要对象|  解释|
|:----|:------|
|node   |  宿主机|
|domain | 虚拟机|
|net     |虚拟网络|
|pool   | 存储池|
|vol  | 存储卷|



##### 基于xml 创建 kvm  对象的技巧  可以先用 virt-manager 创建 然后查看 xml 文件

```
virsh  dumpxml
```


```
https://www.libvirt.org/virshcmdref.html
```


```
https://libvirt.org/sources/virshcmdref/Virsh_Command_Reference-0.8.7-1.pdf
```

```
wget https://libvirt.org/sources/virshcmdref/Virsh_Command_Reference-0.8.7-1.pdf
```


```
virsh help domain
```

##### virsh 命令自动补全

```
yum install -y bash-completion libvirt-bash-completion
yum -y install libvirt-client
source  /usr/share/bash-completion/completions/vsh
```



edit

```
1、kvm中使用virsh命令编辑一个虚机时，系统默认用的vi，这在一些补全路径时很不方便，而vim才具备这些功能

# virsh edit xxx

2、编辑系统环境变量，使编辑时调用vim

# vim /etc/profile

最后添加

export EDITOR=vim

# source /etc/profile
```
