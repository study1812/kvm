virsh set-user-password  172.16.99.203 root  123456
error: argument unsupported: QEMU guest agent is not configured

qemu-guest-agent

务必设置property的hw_qemu_guest_agent=yes,否则libvert启动虚拟机时不会生成qemu-ga配置项导致虚拟机内部的qemu-ga由于找不到对应的虚拟串行字符设备而启动失败提示找不到channel。

创建完虚拟机后若忘记了虚拟机的密码则可以直接修改

virsh set-user-password <domain> <user> <password>

systemctl  start   qemu-guest-agent


https://blog.csdn.net/liukuan73/article/details/49048003


```
[root@ceph-osd02 ~]# systemctl  status  qemu-guest-agent
● qemu-guest-agent.service - QEMU Guest Agent
   Loaded: loaded (/usr/lib/systemd/system/qemu-guest-agent.service; enabled; vendor preset: enabled)
   Active: inactive (dead)
[root@ceph-osd02 ~]# systemctl  start   qemu-guest-agent
A dependency job for qemu-guest-agent.service failed. See 'journalctl -xe' for details.
[root@ceph-osd02 ~]# journalctl -xe
-- Defined-By: systemd
-- Support: http://lists.freedesktop.org/mailman/listinfo/systemd-devel
-- 
-- Unit session-8.scope has finished starting up.
-- 
-- The start-up result is done.
Jun 25 16:01:01 ceph-osd02 CROND[13141]: (root) CMD (run-parts /etc/cron.hourly)
Jun 25 16:01:01 ceph-osd02 run-parts(/etc/cron.hourly)[13144]: starting 0anacron
Jun 25 16:01:01 ceph-osd02 run-parts(/etc/cron.hourly)[13150]: finished 0anacron
Jun 25 16:20:41 ceph-osd02 polkitd[2734]: Registered Authentication Agent for unix-process:13156:1815574 (system bus name :1.30 [/usr/bin/pkttyagent
Jun 25 16:22:11 ceph-osd02 systemd[1]: Job dev-virtio\x2dports-org.qemu.guest_agent.0.device/start timed out.
Jun 25 16:22:11 ceph-osd02 systemd[1]: Timed out waiting for device dev-virtio\x2dports-org.qemu.guest_agent.0.device.
-- Subject: Unit dev-virtio\x2dports-org.qemu.guest_agent.0.device has failed
-- Defined-By: systemd
-- Support: http://lists.freedesktop.org/mailman/listinfo/systemd-devel
-- 
-- Unit dev-virtio\x2dports-org.qemu.guest_agent.0.device has failed.
-- 
-- The result is timeout.
Jun 25 16:22:11 ceph-osd02 systemd[1]: Dependency failed for QEMU Guest Agent.
-- Subject: Unit qemu-guest-agent.service has failed
-- Defined-By: systemd
-- Support: http://lists.freedesktop.org/mailman/listinfo/systemd-devel
-- 
-- Unit qemu-guest-agent.service has failed.
-- 
-- The result is dependency.
Jun 25 16:22:11 ceph-osd02 systemd[1]: Job qemu-guest-agent.service/start failed with result 'dependency'.
Jun 25 16:22:11 ceph-osd02 systemd[1]: Job dev-virtio\x2dports-org.qemu.guest_agent.0.device/start failed with result 'timeout'.
Jun 25 16:22:11 ceph-osd02 polkitd[2734]: Unregistered Authentication Agent for unix-process:13156:1815574 (system bus name :1.30, object path /org/
```
