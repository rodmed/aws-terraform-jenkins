#!/bin/bash

set -xe
if [ "$(file -b -s /dev/xvdh)" == "data" ]; then
 mkfs -t ext4 /dev/xvdh
fi

if ! mountpoint -q /data; then
 mkdir -p /data
 mount /dev/xvdh /data
 chown -R ubuntu /data
 echo /dev/xvdh /data ext4 defaults,nofail 0 2 >> /etc/fstab
fi
