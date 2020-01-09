#### 梳理由virt-manager 创建虚拟机 生成的xml 文件




从xml 文件创建虚拟机 

必须的的元素


虚拟机名字
虚拟机uuid
cpu
内存
硬盘 virtio
网络 virtio
网卡的mac


利于使用的元素
console
vnc en-us

uuid 生成

```
uuidgen
```




mac 生成

```
echo "52:54:$(dd if=/dev/urandom count=1 2>/dev/null | md5sum | sed -r 's/^(..)(..)(..)(..).*$/\1:\2:\3:\4/')"
```



















dmidecode  -s system-manufacturer


dmidecode -s system-serial-number
Not Specified

重新加载配置


virsh define /etc/libvirt/qemu/centos7.xml


添加这个属性 相当于重新创建

```
<sysinfo type='smbios'>
    <system>
      <entry name='serial'>7e7734b9-3d5f-44e5-bca4-4f8302f3fda7</entry>
    </system>
  </sysinfo>
  <os>
    <type arch='x86_64' machine='pc-i440fx-rhel7.0.0'>hvm</type>
    <boot dev='hd'/>
    <smbios mode='sysinfo'/>
  </os>
```

virsh 
virsh undefine  x
virsh define    x.xml


virsh dumpxml  172.16.99.202



