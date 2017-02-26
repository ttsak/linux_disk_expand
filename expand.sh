#!/bin/bash

# install parted - required for partprobe
/usr/bin/apt-get install -y parted

# extend existing partition
(
echo d  # delete partition
echo 5  # logical partition 5
echo d  # delete partition
echo 2  # extended partition
echo n  # create new partition
echo e  # extended partition
echo 2  # partition 2
echo    # First sector (Accept default)
echo    # Last sector (Accept default)
echo n  # create new partition
echo l  # logical partition
echo    # First sector (Accept default)
echo    # Last sector (Accept default)
echo t  # partition type
echo 5  # partition 5
echo 8e # type 8e , Linux LVM
echo w  # write changes
) | /sbin/fdisk /dev/xvda

# make partition changes visible to the kernel without reboot
/sbin/partprobe

# extend physical volume
/sbin/pvresize /dev/xvda5

# extend logical volume to use all available space
/sbin/lvextend -l +100%FREE /dev/mapper/*--vg-root

# resize filesystem - ext4
/sbin/resize2fs /dev/mapper/*--vg-root

# resize filesystem - xfs
# xfs_growfs /
