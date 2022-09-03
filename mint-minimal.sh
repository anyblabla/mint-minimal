#!/bin/bash
#
# Autheur:
#   Amaury Libert <amaury-libert@hotmail.com> de Blabla Linux <https://blablalinux.be>
#
# Description:
#   Script qui va supprimer une série de paquets afin d'obtenir une Linux Mint Cinnamon 21 minimal.
#   Script that will remove a series of packages in order to obtain a minimal Linux Mint Cinnamon 21.
#
# Préambule Légal:
# 	Ce script est un logiciel libre.
# 	Vous pouvez le redistribuer et / ou le modifier selon les termes de la licence publique générale GNU telle que publiée par la Free Software Foundation; version 3.
#
# 	Ce script est distribué dans l'espoir qu'il sera utile, mais SANS AUCUNE GARANTIE; sans même la garantie implicite de QUALITÉ MARCHANDE ou d'ADÉQUATION À UN USAGE PARTICULIER.
# 	Voir la licence publique générale GNU pour plus de détails.
#
# 	Licence publique générale GNU : <https://www.gnu.org/licenses/gpl-2.0.txt>
#
echo "Effacement écran..."
clear
#
echo "Suppression des paquets..." 
apt purge --ignore-missing -y \
baobab \
celluloid \
drawing \
fonts-opensymbol \
gir1.2-rb-3.0 \
gir1.2-xviewer-3.0 \
gnome-calendar \
gnome-font-viewer \
gucharmap \
hexchat \
hunspell-de-at-frami \
hunspell-de-ch-frami \
hunspell-de-de-frami \
hunspell-en-au \
hunspell-en-ca \
hunspell-en-gb \
hunspell-en-us \
hunspell-en-za \
hunspell-es \
hunspell-it \
hunspell-pt-br \
hunspell-pt-pt \
hunspell-ru \
hyphen-de \
hyphen-en-gb \
hyphen-en-us \
hyphen-fr \
hyphen-it \
hyphen-pt-br \
hyphen-pt-pt \
hyphen-ru \
hypnotix \
liblibreoffice-java \
libreoffice-base \
libreoffice-base-core \
libreoffice-base-drivers \
libreoffice-calc \
libreoffice-common \
libreoffice-core \
libreoffice-draw \
libreoffice-gnome \
libreoffice-gtk3 \
libreoffice-help-common \
libreoffice-help-de \
libreoffice-help-en-gb \
libreoffice-help-en-us \
libreoffice-help-es \
libreoffice-help-fr \
libreoffice-help-it \
libreoffice-help-pt \
libreoffice-help-pt-br \
libreoffice-help-ru \
libreoffice-help-zh-cn \
libreoffice-help-zh-tw \
libreoffice-impress \
libreoffice-java-common \
libreoffice-l10n-de \
libreoffice-l10n-en-gb \
libreoffice-l10n-en-za \
libreoffice-l10n-es \
libreoffice-l10n-fr \
libreoffice-l10n-it \
libreoffice-l10n-pt \
libreoffice-l10n-pt-br \
libreoffice-l10n-ru \
libreoffice-l10n-zh-cn \
libreoffice-l10n-zh-tw \
libreoffice-math \
libreoffice-sdbc-hsqldb \
libreoffice-style-colibre \
libreoffice-writer \
librhythmbox-core10 \
libuno-cppu3 \
libuno-cppuhelpergcc3-3 \
libunoloader-java \
libuno-purpenvhelpergcc3-3 \
libuno-sal3 \
libuno-salhelpergcc3-3 \
mythes-de \
mythes-de-ch \
mythes-en-us \
mythes-fr \
mythes-it \
mythes-pt-pt \
mythes-ru \
onboard \
pix \
pix-dbg \
python3-uno \
redshift-gtk \
rhythmbox \
rhythmbox \
rhythmbox-data \
rhythmbox-plugins \
rhythmbox-plugin-tray-icon \
simple-scan \
sticky \
thunderbird \
thunderbird-gnome-support \
thunderbird-locale-en \
thunderbird-locale-en-us \
thunderbird-locale-fr \
transmission-gtk \
uno-libs-private \
ure \
ure-java \
warpinator \
webapp-manager \
xreader \
xreader-dbg \
xviewer \
xviewer-dbg \
xviewer-plugins \
