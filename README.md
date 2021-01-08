# AV bases update for Kaspersky Resque Disk 18
This script updates Kaspersky Rescue Disk Antivirus databases.
The script checks whether AV bases were updated or not. If they did, it downloads new AV bases and corrects information in the configuration. 
## Usage
Unpack disk into the folder (krd, for example)
Edit the variable 'KRD=', putting here the path to the directory where your unpacked KRD is stored.
Set up CRON to launch the script automatically.
## Example for CRON
```
30 */3 * * * /share/Public/tftp/disks/krd/krduptate.sh
```
## Example for PXE config
I use http and nfs.
```
LABEL Kaspersky Rescue Disk 18
        MENU LABEL Kaspersky Rescue Disk 18 EN
        KERNEL disks/krd/boot/grub/k-x86_64
        APPEND initrd=http://192.168.10.153:888/krd/boot/grub/initrd.xz netboot=nfs://192.168.10.153:/Public/tftp/disks/krd rw net.ifnames=0 lang=en dostartx vga=791
```
## PXE settings examples from Kaspersky:
https://support.kaspersky.com/15271

https://support.kaspersky.ru/15271
