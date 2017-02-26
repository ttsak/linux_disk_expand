# Linux Disk Expand

Linux Disk Expand is a script that will automatically expand the root drive to use all available disk space.

## Info

It was created for Debian 8 Jessie, installed from minimal CD with LVM and no disk encryption

It assumes the default ext4 fs and /dev/xvda device which is what XEN VMs have by default

## Caution

This script asks no questions!!!

Please review the script source code and check that everything is as it should be!

Make sure that your LVM partition resides on /dev/xvda5 and that your root volume group has the default hostname--vg-root name

If you use xfs then you must comment the ext4 resize line and uncomment the xfs resize line (this has not been tested!)

If above assumptions are inaccurate then change the script to reflect your environment or do not use it!

_The user is responsible for the results of using this script!_

## Usage

AFTER reading the Caution paragraph and making sure that all is OK just "chmod +x expand.sh" and execute it as root user.

A reboot is *not* required but is recommended

## References

https://help.1and1.com/servers-c37684/dynamic-cloud-server-linux-c73266/increase-the-physical-volume-size-of-a-linux-1and1-dynamic-cloud-server-a771780.html

https://help.1and1.com/servers-c37684/dedicated-server-linux-c37687/administration-c37694/increase-the-size-of-the-logical-volume-a756168.html

http://www.linuxbrigade.com/easily-increase-storage-size-with-lvm/

http://superuser.com/a/332322

http://www.debianadmin.com/howto-make-partition-changes-visible-to-the-kernel-without-reboot.html

