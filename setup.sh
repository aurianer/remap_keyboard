#!/bin/bash
# Copyright (c) 2024 Auriane Reverdell

set -eux pipefail

dest_file=/etc/udev/hwdb.d/60-cherry-keyboard.hwdb
if [[ ! -f $dest_file ]]; then
    sudo cp 60-cherry-keyboard.hwdb /etc/udev/hwdb.d/60-cherry-keyboard.hwdb
    sudo chmod og-rwx
fi

sudo systemd-hwdb update
sudo udevadm control --reload-rules && sudo udevadm trigger
