# pi_tickertape_new
Pour Pi 3B+
OS : Bookworm 32bits version Desktop

Script udpate_tape.sh reste inchangé pour garder un seul et même script.
Le script automount.sh converti "telnet" en "nc -q 2"

Logs:
journalctl -u usb_script.service

Pour duplication img disk, dans "/boot/firmware", changer le cmdline.txt
console=serial0,115200 console=tty1 root=/dev/mmcblk0p2 rootfstype=ext4 fsck.repair=yes rootwait



