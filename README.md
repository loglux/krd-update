# AV bases update for Kaspersky Resque Disk 18
This script update Kaspersky Rescue Disk databases for PXE boot.

## Usage
Edit the variable 'KRD=', putting the path to the directory where your unpacked KRD stored.
Set up CRON to launch the script automatically.

## Example for PXE config
Unpack disk into the folder (krd, for example)
I use http and nfs.
```
LABEL Kaspersky Rescue Disk 18
        MENU LABEL Kaspersky Rescue Disk 18 EN
        KERNEL disks/krd/boot/grub/k-x86_64
        APPEND initrd=http://192.168.10.153:888/krd/boot/grub/initrd.xz netboot=nfs://192.168.10.153:/Public/tftp/disks/krd rw net.ifnames=0 lang=en dostartx vga=791
```

## Example for CRON
```
30 */3 * * * /share/Public/tftp/disks/krd/krduptate.sh
```
