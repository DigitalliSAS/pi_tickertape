# pi_tickertape_new
PI 3B+

Script udpate_tape.sh reste inchangé pour garder un seul et même script.
Le script automount.sh converti "telnet" en "nc -q 2"

Logs:
-journalctl -u usb_script.service


Notes:
sudo systemctl stop udisks2.service
sudo systemctl disable udisks2.service
