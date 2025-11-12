#!/bin/bash

# ==============================================================================
# TITRE: Création d'une installation minimale de Linux Mint Cinnamon 21
# AUTEUR: Amaury Libert (Base) | Amélioré par l'IA
# LICENCE: GPLv2
# DESCRIPTION:
#   Supprime un ensemble de paquets par défaut (LibreOffice, Thunderbird, Média,
#   Jeux) et leurs dépendances pour alléger le système.
# ==============================================================================

# --- Configuration et Préparation ---

# Mode strict: Quitte en cas d'erreur (-e), variable non définie (-u), ou échec
# dans un pipe (-o pipefail). Indispensable pour les scripts sudo.
set -euo pipefail

# Couleurs pour une meilleure sortie
VERT='\033[0;32m'
ROUGE='\033[0;31m'
JAUNE='\033[0;33m'
CYAN='\033[0;36m'
FIN='\033[0m'

# Vérification des droits root
if [ "$(id -u)" -ne 0 ]; then
    echo -e "${ROUGE}ERREUR : Ce script doit être exécuté avec 'sudo' ou en tant que root.${FIN}"
    exit 1
fi

echo -e "${CYAN}*** Début de la suppression des paquets par défaut... ***${FIN}"
clear # Effacer l'écran après le message d'introduction

# --- Liste des Paquets Principaux à Purger (Dépendances inutiles retirées) ---

# Nous listons uniquement les paquets principaux. La plupart des paquets 'hunspell',
# 'hyphen', 'mythes', et de nombreuses librairies 'lib*' seront retirés
# automatiquement et en toute sécurité par 'apt autoremove'.
PAQUETS_PRINCIPAUX_A_PURGER=(
    # --- Suite Bureautique & Email ---
    thunderbird
    libreoffice-writer
    libreoffice-calc
    libreoffice-impress
    libreoffice-math
    # Retirer les paquets de support GNOME/Java/Base pour purger la suite complète
    libreoffice-base
    libreoffice-base-core
    libreoffice-base-drivers
    libreoffice-core
    libreoffice-draw
    libreoffice-gnome
    libreoffice-gtk3
    libreoffice-java-common
    liblibreoffice-java
    libreoffice-sdbc-hsqldb
    libreoffice-style-colibre
    thunderbird-gnome-support

    # --- Applications Média, Vidéo & Internet ---
    celluloid      # Lecteur Vidéo
    rhythmbox      # Lecteur Musique
    hypnotix       # IPTV
    transmission-gtk
    hexchat        # IRC
    warpinator     # Transfert de fichiers local
    webapp-manager # Gestionnaire d'applications web

    # --- Applications Graphiques et Utilitaires GNOME/Mint ---
    baobab         # Analyseur d'utilisation de disque
    drawing        # Outil de dessin simple
    gnome-calculator
    gnome-calendar
    gnome-disk-utility # Utilitaire de disques
    gnome-font-viewer
    gnome-screenshot
    gucharmap      # Carte des caractères
    mintstick      # Créateur de clef USB
    onboard        # Clavier virtuel
    pix            # Visionneuse d'images (fork de Eye of GNOME)
    redshift-gtk   # Ajustement de la température des couleurs
    seahorse       # Gestionnaire de clés/mots de passe
    simple-scan    # Scan
    sticky         # Notes adhésives
    # XApps (éditeurs de texte, visionneuses, lecteurs)
    xed            # Éditeur de texte (fork de Gedit)
    xreader        # Lecteur de documents (fork de Evince)
    xviewer        # Visionneuse d'images

    # --- Dépendances mineures (la plupart gérées par autoremove, mais listées si nécessaire) ---
    bison          # Outil de développement
    dc             # Calculatrice en ligne de commande
    fonts-opensymbol # Police pour LibreOffice

    # --- Paquets de débogage (dbg) qui seront probablement retirés par autoremove ---
    pix-dbg
    xed-dbg
    xreader-dbg
    xviewer-dbg
)

# --- Exécution de la Purge ---

echo -e "${JAUNE}1. Purge des paquets principaux (${#PAQUETS_PRINCIPAUX_A_PURGER[@]} paquets)...${FIN}"

# Exécuter la purge en utilisant xargs pour la longue liste
printf '%s\n' "${PAQUETS_PRINCIPAUX_A_PURGER[@]}" | xargs apt purge --ignore-missing -y

if [ $? -ne 0 ]; then
    echo -e "${ROUGE}AVERTISSEMENT : La purge APT a rencontré des erreurs (paquets ignorés). Poursuite du nettoyage.${FIN}"
fi
echo -e "${VERT}Paquets principaux purgés avec succès.${FIN}"

# --- Nettoyage Final (autoremove) ---

echo -e "${JAUNE}2. Nettoyage final du système (suppression des dépendances inutiles)...${FIN}"

# Utilisation de apt autoremove -y pour retirer toutes les dépendances devenues
# inutiles suite à la purge ci-dessus (y compris les dictionnaires, locales, librairies, etc.).
apt autoremove -y

echo -e "${VERT}*** Nettoyage terminé. Votre installation de Linux Mint est maintenant minimale. ***${FIN}"