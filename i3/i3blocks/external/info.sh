#!/bin/bash

# change external ssd name (NTFS), unmount first:
# sudo ntfslabel <disk> <new-name>
#
# list info:
# lsblk -o NAME,LABEL,FSTYPE,MOUNTPOINT,SIZE
# or
# sudo fdisk -l
# or
# sudo blkid

# auto-mount
# edit: sudo vi /etc/fstab
# for example: UUID=<uuid> <path> ntfs defaults,nofail,x-systemd.automount,uid=1000,gid=1000 0 2
# sudo systemctl daemon-reload

# sudo mount -a
# sudo umount -l <label>

MOUNTPOINT="$HOME/labs/hunting/og-ssd"

mkdir -p "$MOUNTPOINT"

if mountpoint -q "$MOUNTPOINT"; then
  df -h "$MOUNTPOINT" | awk '/\//{ printf("  %4s/%s \n", $4, $2) }'
fi
