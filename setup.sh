#!/bin/sh

echo "Mise à jour RPI"
echo "==============="
#apt-get update && apt-get -y upgrade

echo "Installation des paquets"
apt-get -y install dos2unix

sudo rsync -avzrP * /
sudo systemctl daemon-reload

echo "Gestion IP Statique Raspberry"
cp /run/NetworkManager/system-connections/Wired\ connection\ 1.nmconnection /etc/NetworkManager/system-connections/Wired\ connection\ 1.nmconnection
file_path="/etc/NetworkManager/system-connections/Wired connection 1.nmconnection"

# Remplacer uniquement method=auto par method=manual dans [ipv4]
sudo sed -i '
/^\[ipv4\]/,/^\[ipv6\]/{
    s/^method=auto$/method=manual/
    t
    s/^$/addresses=192.168.23.250\/24\
gateway=192.168.23.254\
dns=8.8.8.8,8.8.4.4;\n/
}' "$file_path"

# Fixer les permissions du fichier pour NetworkManager
sudo chmod 600 "$file_path"

# Afficher un message de succès
echo "Le fichier $file_path a été modifié avec succès pour IPv4. IPv6 est inchangé."


echo "Installation terminée, Redemarrage PI..."
sudo reboot
