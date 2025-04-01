#!/bin/bash

echo "🌐 Configuration IP Statique"

# Chemin vers le fichier de configuration
file_path="/etc/NetworkManager/system-connections/Wired connection 1.nmconnection"

# Copie du fichier actif depuis /run vers /etc
if sudo cp /run/NetworkManager/system-connections/Wired\ connection\ 1.nmconnection "$file_path"; then
    echo "✅ Copie du fichier de configuration réussie."

    # Modification de la section [ipv4] pour configurer une IP statique
    sudo sed -i '/\[ipv4\]/,/^method=auto$/c\[ipv4]\naddress1=192.168.23.250/24,192.168.23.254\ndns=8.8.8.8;8.8.4.4;\nmethod=manual' "$file_path"

    # Attribution des bons droits
    sudo chmod 600 "$file_path"

    echo "✅ Configuration IP statique appliquée dans $file_path."

    # Redémarrage du service NetworkManager pour appliquer les modifications
    echo "🔁 Redémarrage de NetworkManager..."
    sudo systemctl restart NetworkManager

    echo "✅ Changement d'IP statique appliqué et NetworkManager redémarré."
else
    echo "❌ Une erreur est survenue lors de la copie ou modification du fichier." >&2
fi
