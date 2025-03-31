#!/bin/sh

echo "Mise à jour RPI"
echo "==============="
#apt-get update && apt-get -y upgrade

echo "Installation des paquets"
apt-get -y install dos2unix

sudo rsync -avzrP * /
sudo systemctl daemon-reload

#Désactivation de la gestion Auto USB
sudo systemctl stop udisks2.service
sudo systemctl disable udisks2.service

#Activation service USB
sudo systemctl enable usb_script.service

echo "Gestion IP Statique Raspberry"
if sudo cp /run/NetworkManager/system-connections/Wired\ connection\ 1.nmconnection "$file_path" \
   && sudo sed -i '/\[ipv4\]/,/^method=auto$/c\[ipv4]\naddress1=192.168.23.250/24,192.168.23.254\ndns=8.8.8.8;8.8.4.4;\nmethod=manual' "$file_path" \
   && sudo chmod 600 "$file_path"; then
    echo "✅ Le fichier $file_path a été modifié avec succès pour IPv4. IPv6 est inchangé."
else
    echo "❌ Une erreur est survenue lors de la modification du fichier." >&2
fi

echo "Installation terminée, Redemarrage PI..."
sudo reboot
