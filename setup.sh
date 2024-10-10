#!/bin/sh

echo "Mise à jour RPI"
echo "==============="
#apt-get update && apt-get -y upgrade

echo "Installation des paquets"
apt-get -y install dos2unix

sudo rsync -avzrP * /
sudo systemctl daemon-reload

echo "Installation terminée, Redemarrage PI..."
sudo reboot