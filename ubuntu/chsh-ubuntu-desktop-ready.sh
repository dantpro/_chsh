#! /bin/sh

# ~/bin/chsh-ubuntu-desktop-ready.sh
#
# $Id: chsh-ubuntu-desktop-ready.sh,v 1.8 2025/12/10 05:33:41 dant Exp $

# --- Ubuntu 25.10

# --- localization

sudo apt install -y console-cyrillic
# sudo dpkg-reconfigure console-setup

# sudo apt install -y localepurge
# sudo dpkg-reconfigure localepurge

# --- configure locale
#
# cat /usr/share/i18n/SUPPORTED
# cat /etc/default/locale
# cat /var/lib/locales/supported.d/local
# cat /var/lib/locales/supported.d/en
#
# ls /usr/lib/locale/
#
# locale
# locale -a -v
# ls -lh /usr/lib/locale/locale-archive
#
# locale-gen ru_RU.UTF-8
# sudo locale-gen --purge ru_RU.UTF-8 en_US.UTF-8
# sudo locale-gen --purge ru_RU.UTF-8 en_US.UTF-8
#
# sudo vim /var/lib/locales/supported.d/en
# --- sudo rm -rfv /usr/lib/locale/*
# sudo locale-gen
# sudo dpkg-reconfigure locales
#
# ---

# --- russian language support
#
sudo apt install -y language-pack-ru
#
# sudo vim /var/lib/locales/supported.d/ru
# sudo update-locale LANG=ru_RU.UTF-8
# sudo locale-gen
# sudo dpkg-reconfigure locales

# --- system
sudo apt install -y dconf-editor

# ubuntu dockbar
#
dconf reset -f /org/gnome/shell/extensions/dash-to-dock/
#
gsettings set org.gnome.shell.extensions.dash-to-dock dock-fixed false
gsettings set org.gnome.shell.extensions.dash-to-dock extend-height false
gsettings set org.gnome.shell.extensions.dash-to-dock dock-position 'BOTTOM'
#
# gsettings set org.gnome.shell.extensions.dash-to-dock dock-position show-mounts-only-mounted true

sudo apt install -y locate
# sudo apt install -y mlocate
sudo updatedb

sudo apt install -y openssh-server
sudo apt install -y openssh-client

# nfs
sudo apt install -y nfs-common
#
# sudo apt install -y nfs-kernel-server
# sudo systemctl status nfs-kernel-server.service

# zabbix
# sudo apt install -y zabbix-agent
# sudo systemctl status zabbix-agent.service

sudo apt install -y uptimed
# sudo systemctl status uptimed.service
uprecords

# --- man
sudo apt install -y manpages manpages-dev manpages-posix manpages-posix-dev
sudo snap install tldr

# --- info
#
sudo apt install -y pinfo
sudo apt install -y tkinfo
# sudo apt install -y texinfo
# sudo apt install -y tar-doc

# --- shell

# zsh
#
sudo apt install -y zsh
sudo apt install -y zsh-doc

sudo apt install -y zsh-syntax-highlighting
sudo apt install -y zsh-autosuggestions
sudo apt install -y zsh-theme-powerlevel9k

sudo apt install -y powerline
sudo apt install -y fonts-powerline

# --- ~/.zshrc
# source /usr/share/powerlevel9k/powerlevel9k.zsh-theme
# source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
# source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
# ---

# p10k + zsh
#
# git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/powerlevel10k
# echo 'source ~/powerlevel10k/powerlevel10k.zsh-theme' >>~/.zshrc

# omz
#
# sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
#
# git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
# sed -i 's/plugins=(git)/plugins=(git zsh-syntax-highlighting zsh-autosuggestions)/g' ~/.zshrc

# p10k + omz
#
# https://github.com/romkatv/powerlevel10k#meslo-nerd-font-patched-for-powerlevel10k
# git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
#
# exec zsh
# p10k configure

# chsh -s /usr/bin/zsh
# chsh -s /bin/bash

# bash-git-prompt
#
# git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt --depth=1
#
# --- ~/.bashrc:
# if [ -f "$HOME/.bash-git-prompt/gitprompt.sh" ]; then
#    GIT_PROMPT_ONLY_IN_REPO=1
#    source "$HOME/.bash-git-prompt/gitprompt.sh"
# fi
# ---

# network time
# sudo apt install -y ntp
#
sudo apt install -y systemd-timesyncd
# systemctl status systemd-timesyncd
sudo timedatectl set-ntp true
# sudo systemctl enable --now systemd-timesyncd.service

# --- /etc/systemd/timesyncd.conf.d/10-timesyncd.conf
# [Time]
# NTP=time1.google.com time2.google.com time3.google.com time4.google.com time.google.com
# FallbackNTP= ru.pool.ntp.org
#
# OR
#
# [Time]
# NTP=
# FallbackNTP= ad.domain.local
# ---

# --- mail
#
# sudo apt install -y nullmailer
# sudo apt install -y ssmtp
#
# mail server
#
# sudo apt install -y postfix
# systemctl status postfix.service
#
# mail client
#
sudo apt install -y mailutils
sudo apt install -y mailutils-doc
#
# sudo apt install -y bsd-mailx
# sudo apt install -y mailutils-mh
#
# maildirs support
#
sudo apt install -y mb2md
sudo apt install -y mutt
#
sudo apt install -y maildir-utils
# echo "Hello World" |mail -s "Hello world subj" info@domain.dom

# --- rs232/serial
#
# sudo dmesg | egrep 'serial|ttyS'
#
# sudo apt install -y setserial
# sudo setserial -g /dev/ttyS0
#
# sudo apt install -y minicom
# sudo apt install -y cu

#--- sysupdate
#
# sudo apt install -y update-manager update-manager-core update-notifier-common
# sudo do-release-upgrade
#
# unattended upgrades
#
# sudo apt install -y software-properties-common
# sudo apt install -y python3-software-properties
# sudo apt install -y unattended-upgrades
#
sudo apt install -y apt-listchanges
sudo apt install -y apticron
sudo apt install -y mailutils
#
# sudo dpkg-reconfigure unattended-upgrades
# sudo unattended-upgrades --dry-run --debug

# --- snap
# sudo snap install snap-store

# --- apt
#
sudo apt install -y apt-transport-https
sudo apt install -y aptitude
sudo apt install -y dselect
sudo apt install -y apt-clone
#
# ppa
# sudo apt install -y ppa-purge
#
# deb
sudo apt install -y gdebi-core
# sudo apt install gdebi

# --- applist save/restore
#
# https://www.ostechnix.com/create-list-installed-packages-install-later-list-centos-ubuntu/
# dpkg-query -f '${binary:Package}\n' -W > pkglist.txt
# dpkg --get-selections > pkglist.txt
#
# sudo dpkg --set-selections < pkglist.txt
# sudo apt-get dselect-upgrade
# sudo apt-get install $(cat /home/username/pkglist.txt | awk '{print $1}')

#--- tui
#
# sudo apt install -y expect
# sudo apt install -y dialog
# sudo apt install -y athena-jot
# jot
#
# sudo apt install -y grc

# fortunes
#
# sudo apt install -y fortunes-off
# sudo apt install -y fortunes-min
sudo apt install -y fortunes
#
sudo apt install -y cowsay
sudo apt install -y lolcat

# --- sysutils
sudo apt install -y htop

# mc
#
sudo apt install -y mc
#
sudo apt install -y p7zip-full
sudo apt install -y p7zip-rar
sudo apt install -y lhasa
#
sudo apt install -y odt2txt

# conky
sudo apt install -y conky-all # conky-std conky-cli

# web
sudo apt install -y links
sudo apt install -y lynx
sudo apt install -y w3m
sudo apt install -y elinks
sudo apt install -y curl
sudo apt install -y wget

# vcs
sudo apt install -y rcs
sudo apt install -y git git-doc git-gui
sudo apt install -y pass
# git gui
sudo apt install -y lazygit

# gcm
# https://github.com/git-ecosystem/git-credential-manager
wget https://github.com/git-ecosystem/git-credential-manager/releases/download/v2.6.1/gcm-linux_amd64.2.6.1.deb
sudo apt install "$PWD/gcm-linux_amd64.2.6.1.deb"

# /usr/local/bin/git-credential-manager diagnose
# /usr/local/bin/git-credential-manager configure

# --- ~/.gitconfig
#
# [user]
#    name = username
#    email = username@domain.dom
#
# gcm
#
#[credential]
#    helper =.
#    helper = /usr/local/bin/git-credential-manager
#    credentialStore = secretservice
#[credential "https://dev.azure.com"]
#    useHttpPath = true
# ---

# git ppa
# 
# sudo add-apt-repository ppa:git-core/ppa
# sudo apt update
# sudo apt install -y git

# git config --global user.name "User Name"
# git config --global user.email "user@name"
# git config --list

# diff
sudo apt install -y meld

# gui diff/compare
#
# xxdiff http://furius.ca/xxdiff/
# Meld   http://meldmerge.org/
# beediff http://freshmeat.sourceforge.net/projects/beediff/
# KDiff3 http://kdiff3.sourceforge.net/
# Diffuse http://diffuse.sourceforge.net/about.html
# fldiff http://freshmeat.sourceforge.net/projects/fldiff
# Beyond Compare 4  http://www.scootersoftware.com/download.php

# pwdgen
#
sudo apt install -y pwgen
sudo apt install -y diceware
sudo apt install -y xkcdpass
#
# pwdkeep
#
sudo apt install -y keepassx # keepassxc-minimal keepassxc-full
sudo apt install -y keepass2

# sysinfo
sudo apt install -y screenfetch
sudo apt install -y fastfetch

# top
#
sudo apt install -y htop
# sudo apt install -y atop
# sudo apt install -y vnstat
#
# sudo apt install -y iftop
# sudo apt install -y bwm-ng

#--- http://www.leonardoborda.com/blog/how-to-configure-sysstatsar-on-ubuntudebian/
#--- sudo apt install -y sysstat

# hwinfo
#
# sudo apt install -y hardinfo # qt, many depends
sudo apt install -y hwinfo

# cpu
#
# sudo apt install -y indicator-cpufreq

# laptop pwr/tlp
# 
# sudo apt install -y laptop-mode-tools
# lmt-config-gui
#
# https://linrunner.de/en/tlp/docs/tlp-linux-advanced-power-management.html#installation
# https://launchpad.net/~linrunner/+archive/ubuntu/tlp
# sudo add-apt-repository ppa:linrunner/tlp
# sudo apt install -y tlp
# sudo tlp start
# sudo tlp-stat
# sudo apt install -y tlp

# fs
# sudo apt install -y ntfs-3g

# disk usage
#
sudo apt install -y ncdu
sudo apt install -y discus

# multi terminal
#
sudo apt install -y screen
sudo apt install -y tmux
sudo apt install -y byobu

sudo apt install -y dos2unix
sudo apt install -y colordiff

# hw monitoring
#
sudo apt install -y lm-sensors
#
sudo apt install -y psensor
#
# sudo apt install -y mbmon
sudo apt install -y smartmontools
# sudo systemctl status smartmontools.service

# hw vesa
# sudo apt install -y v86d
# sudo apt install -y vbetool
# sudo apt install -y fbset

# sys bench
#
# sudo apt install -y stress
# sudo apt install -y sysbench
# sudo apt install -y stress-ng

# hdd part
#
sudo apt install -y gparted
sudo apt install -y gpart

#--- libs
#
#--- sudo apt install -y libcanberra-gtk-module # transgui
# sudo apt install -y libssl-dev

#--- xwindow
#
# X11/xorg
# sudo apt install -y xorg
# sudo apt install -y xinit
#
# x11 dm
# 
# sudo apt install -y lightdm
# sudo dpkg-reconfigure gdm3
# sudo dpkg-reconfigure lightdm
#
# x11 wm
#
# sudo apt install -y openbox
# sudo apt install -y openbox-gnome-session

#
# sudo apt install -y xterm xfonts-cyrillic

# x-terminals
#
# sudo apt install -y terminator

# x-bar
#
# sudo apt install -y plank # x11 only

# --- xfce
# sudo apt install -y xubuntu-desktop
# sudo apt install -y xfce4 xfce4-goodies xorg dbus-x11 x11-xserver-utils lightdm
#
# uninstall
#
# sudo apt remove -y xubuntu-desktop xfdesktop4 xfce4-* libxfce4-* lightdm
# sudo apt autoremove -y
# sudo apt install --reinstall -y gdm3
#
# --- sudo apt purge xubuntu-desktop xubuntu-icon-theme xfce4*
# --- sudo apt purge plymouth-theme-xubuntu-logo plymouth-theme-xubuntu-text
# ---

# --- gnome
#
sudo apt install -y gnome-session
# sudo apt install -y gnome-classic
# sudo apt install -y gnome-shell
#
# sudo apt install -y gnome-system-monitor
# sudo apt install -y gnome-disk-utility
#
sudo apt install -y gnome-terminal
# sudo update-alternatives --config x-terminal-emulator

# --- https://ubuntuhandbook.org/index.php/2021/04/enable-light-mode-menus-ubuntu-21-04/
#
# --- gnome extensions
#
sudo apt install -y gnome-browser-connector
sudo apt install -y gnome-shell-extensions
sudo apt install -y gnome-tweaks
#
# https://extensions.gnome.org/local/
#
# https://extensions.gnome.org/extension/1653/tweaks-in-system-menu
# https://extensions.gnome.org/extension/19/user-themes/
# https://extensions.gnome.org/extension/779/clipboard-indicator/
# https://extensions.gnome.org/extension/3628/arcmenu/
# https://extensions.gnome.org/extension/1231/switch-workspace/

# sudo apt install -y gnome-system-tools
# sudo apt install -y gnome-control-center
# sudo apt install -y gnome-calendar
# sudo apt install -y gnome-todo
sudo apt install -y gnome-weather
sudo apt install -y gnome-screenshot

# gnome text editors
#
# sudo apt install -y gnome-text-editor
#
sudo apt install -y gedit
sudo apt install -y gedit-plugins
# sudo apt install -y gedit-latex-plugin

sudo apt install -y nautilus-admin

#--- gtk themes
#
# sudo apt install -y gnome-shell-extensions
#
# sudo apt install -y numix-gtk-theme
# sudo apt install -y arc-theme
# sudo apt install -y greybird-gtk-theme
#
# sudo apt install -y yaru-theme-gnome-shell
# sudo apt install -y yaru-theme-gtk yaru-theme-icon yaru-theme-sound

#--- office
#
sudo apt install -y libreoffice
sudo apt install -y libreoffice-l10n-ru
sudo apt install -y libreoffice-help-ru libreoffice-help-en-us
sudo apt install -y mythes-ru
#
# sudo apt install -y libreoffice-style-breeze

# libre office fresh ppa
#
# sudo add-apt-repository ppa:libreoffice/ppa
# sudo ppa-purge ppa:libreoffice/ppa
#
# sudo apt purge libreoffice-base
# sudo apt purge libreoffice-impress
# sudo apt purge libreoffice
# sudo apt purge libreoffice-base
# sudo apt purge libreoffice-calc
# sudo apt purge libreoffice-writer
# sudo apt purge libreoffice-draw

# spellcheck
sudo apt install -y aspell aspell-ru
sudo apt install -y hunspell hunspell-ru

# translate/dict
# sudo apt install -y  mueller7-dict
# sudo apt install -y goldendict

# scribus
# sudo apt install -y scribus

# docs viewers
#
sudo apt install -y evince
sudo apt install -y papers

# notes
# sudo snap install simplenote

# ebooks
#
sudo apt install -y calibre
sudo apt install -y fbreader
sudo apt install -y sigil
#
# https://github.com/johnfactotum/foliate/releases
# sudo snap install foliate

#--- text editors
#
# sudo apt install -y mousepad # xfce
# sudo snap install leafpad --classic # gtk2

# vim
sudo apt install -y vim-tiny
sudo apt install -y vim
# sudo apt install -y vim-nox
sudo apt install -y vim-gtk3
#
sudo apt install -y vim-doc
sudo apt install -y vim-scripts
#
# neovim
# sudo apt install -y neovim
# nvim

# emacs
#
# sudo apt install -y emacs

# code/ide
#
sudo apt install -y geany
# geany

# markdown
#
# https://remarkableapp.github.io/
# sudo snap install remarkable --classic
#
# sudo apt install retext

# cipboard
# sudo apt install -y gpaste-2

#--- ubuntu desktop minimal to full
#
# sudo apt install -y baobab
# sudo apt install -y branding-ubuntu
# sudo apt install -y cheese
# sudo apt install -y deja-dup
# sudo apt install -y totem
#
sudo apt install -y transmission-gtk
sudo apt install -y transgui
#
sudo apt install -y rhythmbox
sudo apt install -y remmina
#
# sudo apt install -y vino # vnc
sudo apt install -y usb-creator-gtk
#
# sudo apt install -y shotel
# sudo apt install -y simple-scan

#--- games
#
# sudo apt install -y steam

# sudo apt install -y aisleriot
# sudo apt install -y gnome-games
# sudo apt install -y gnome-mines
# sudo apt install -y gnome-sudoku
# sudo apt install -y gnome-mahjongg
# sudo apt install -y gnome-chess
# sudo apt install -y xbill

# keyboard trainer
#
# sudo apt install -y klavaro
# sudo apt install -y ktouch
# sudo apt install -y gtypist

# weather
sudo apt install -y weather-util

#--- fonts
#
sudo apt install -y font-manager
#
sudo apt install -y xfonts-terminus
sudo apt install -y console-setup-linux # console-terminus
#
sudo apt install -y ttf-mscorefonts-installer
sudo fc-cache -f -v

#--- restricted extras
# 
sudo apt install -y ubuntu-restricted-extras

# sudo apt install -y vainfo

#--- multimedia/players
#
sudo apt install -y mplayer
sudo apt install -y mpv
sudo apt install -y celluloid
sudo att install -y showtime
#
sudo apt install -y mediainfo mediainfo-gui
sudo apt install -y ffmpeg
#
# vlc
sudo apt install -y vlc
#
# libdvd
# sudo apt install -y libdvd-pkg
# sudo dpkg-reconfigure libdvd-pkg
#
# vlc ppa
#
# sudo add-apt-repository ppa:videolan/master-daily
# sudo apt update
# sudo apt install -y vlc

# smplayer qt
#
# sudo apt install -y smplayer
#
# sudo add-apt-repository -y ppa:rvm/smplayer
# smtube smplayer-themes smplayer-skins

# kodi
# sudo apt install -y kodi
# sudo add-apt-repository -y ppa:team-xbmc/ppa

# openshot
# --- sudo apt install -y openshot
# --- sudo apt install -y kdenlive

# obs-studio
#
# sudo apt install -y obs-studio
# sudo add-apt-repository -y ppa:obsproject/obs-studio
# sudo snap install obs-studio

# transcode
# sudo apt install -y handbrake

# audio
#
# sudo apt install -y audacious
# sudo apt install -y audacity

# spotify
# sudo snap install spotify

# images
#
sudo apt install -y imagemagick
sudo apt install -y libimage-exiftool-perl # exiftool https://exiftool.org/

# darktable
# sudo apt install -y darktable
# sudo snap install darktable

# scan
#
# sudo apt install -y sane
# sudo apt install -y xsane
# sudo sane-find-scanner
# xsane &

# gnuplot
#
# sudo apt install -y gnuplot
# sudo apt install -y gnuplot-nox
# sudo apt install -y gnuplot-x11
# sudo apt install -y gnuplot-doc

#--- tex/doc
#
# + sudo apt install -y texlive-base # 158Mb
# + sudo apt install -y texlive-latex-recommended # 201Mb
#
# sudo apt install -y texlive # 267 Mb
# sudo apt install -y texlive-latex-extra # 439Mb
#
# sudo apt install -y texlive-publishers # 501Mb
# sudo apt install -y texlive-science # 441Mb
# sudo apt install -y texlive-pstricks # 423 Mb
# sudo apt install -y texlive-pictures # 263 Mb
#
# sudo apt install texlive-full # 5451Mb
#
# sudo apt install -y gedit-latex-plugin
# sudo apt install -y texmaker
# sudo apt install -y texstudio
# sudo apt install lyx
# sudo apt install kile # kde

# sudo apt install -y pandoc

# --- science
# sudo apt install -y octave
#
# sudo snap install octave
# sudo snap install --beta octave

# sudo apt install -y scilab

# --- stuff
# sudo apt install -y variety

# inkscape
# sudo apt install -y inkscape

# shutter
# sudo apt apt install -y shutter

# 3D
# sudo apt install -y blender

# cdemu
#
# sudo add-apt-repository -y ppa:cdemu/ppa
# sudo apt install -y cdemu-client
# sudo apt install -y gcdemu

# bleachbit clean fs
sudo apt install -y bleachbit

# html
# sudo snap install --classic brackets

# --- backup

# timeshift
sudo apt install -y timeshift
# sudo add-apt-repository ppa:teejee2008/ppa

# rsync
sudo apt install -y rsync
sudo apt install -y grsync

# stuff
#
# sudo apt install -y redshift-gtk

#--- networking

# wireless
#
# sudo apt install -y wpasupplicant
# sudo apt install -y wavemon

# net tools
#
sudo apt install -y net-tools
sudo apt install -y traceroute
sudo apt install -y mtr-tiny
# sudo apt install mtr

sudo apt install -y nmap
sudo apt install -y zenmap

sudo apt install -y wireshark

sudo apt install -y whois

sudo apt install -y oping
sudo apt install -y fping
sudo apt install -y hping3

sudo apt install -y iperf
sudo apt install -y iperf3

sudo apt install -y wakeonlan
sudo apt install -y etherwake

sudo apt install -y ethtool

sudo apt install -y dnstop

# snmp
#
sudo apt install -y snmp
sudo apt install -y snmp-mibs-downloader
sudo apt install -y snmpd
# systemctl status snmpd.service

# security
sudo apt install -y chkrootkit
# sudo apt install -y oathtool

# fw
sudo apt install -y ufw
sudo apt install -y gufw

# nut
# sudo apt install -y nut-client nut-monitor
# sudo apt install -y nut

#--- vpn

# ovpn
#
sudo apt install -y openvpn
# sudo apt install -y openvpn-systemd-resolved

sudo apt install -y network-manager-openvpn
sudo apt install -y network-manager-openvpn-gnome
sudo apt install -y network-manager-l2tp
sudo apt install -y network-manager-l2tp-gnome

# wireguard
#
sudo apt install -y wireguard

# proxy
#
# sudo apt install -y cntlm
# sudo apt install -y corkscrew

#--- net rdesktop
#
# sudo add-apt-repository ppa:remmina-ppa-team/remmina-next
#
sudo apt install -y remmina
sudo apt install -y remmina-plugin-rdp
sudo apt install -y remmina-plugin-vnc
sudo apt install -y remmina-plugin-spice
sudo apt install -y remmina-plugin-www
sudo apt install -y remmina-plugin-exec
sudo apt install -y remmina-plugin-secret
sudo apt install -y remmina-plugin-python
sudo apt install -y remmina-plugin-kiosk
sudo apt install -y remmina-plugin-x2go
#
# rdp srv
# sudo apt install -y xrdp
#
# rdp clnt
sudo apt install -y rdesktop
sudo apt install -y freerdp3-x11
#
# rdesktop
# xfreerdp3

#--- internet

# firefox
sudo apt install -y firefox firefox-locale-ru

# filezilla
sudo apt install -y filezilla

# dropbox
# sudo apt install -y nautilus-dropbox

# mega
#
wget https://mega.nz/linux/repo/xUbuntu_25.10/amd64/megasync-xUbuntu_25.10_amd64.deb
sudo apt install -y "$PWD/megasync-xUbuntu_25.10_amd64.deb"

# thunderbird
sudo apt install -y thunderbird thunderbird-locale-ru thunderbird-locale-en-us

# evolution
sudo apt install -y evolution-ews
# /usr/libexec/evolution-addressbook-factory -w

# im pidgin
#
sudo apt install -y pidgin
sudo apt install -y pidgin-plugin-pack

# telegram
#
sudo add-apt-repository -y ppa:atareao/telegram
sudo apt install -y telegram
# sudo snap install telegram-desktop

# viber
#
# sudo snap install viber-unofficial
# sudo snap install --edge viber-mtd

#--- code development
#
# sudo apt install -y build-essential
# sudo apt install -y intltool

#--- python3
#
sudo apt install -y python3
sudo apt install -y python-is-python3
sudo apt install -y idle
# sudo apt install -y python-markdown

#  golang https://github.com/golang/go/wiki/Ubuntu
sudo apt install -y golang-go
# sudo apt install -y golang
# go
#
# sudo add-apt-repository ppa:longsleep/golang-backports
# sudo apt update
# sudo apt install golang-go
#
# sudo snap install --classic go

# --- microsoft

# teams
# sudo snap install teams-for-linux

# vscode
#
# vscode snap
#
# sudo snap install code --classic

# vscode deb
#
# https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64
#
# sudo apt install ./<file>.deb
#
# 
# sudo dpkg -i <file>.deb
# sudo apt-get install -f # Install dependencies
#
# To automatically install the apt repository and signing key, such as on a non-interactive terminal,
# run the following command first:
#
# echo "code code/add-microsoft-repo boolean true" | sudo debconf-set-selections

# vscode apt
#
# sudo apt-get install wget gpg
# wget -qO- https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
# sudo install -D -o root -g root -m 644 microsoft.gpg /usr/share/keyrings/microsoft.gpg
# rm -f microsoft.gpg
#
# --- /etc/apt/sources.list.d/vscode.sources
#
# Types: deb
# URIs: https://packages.microsoft.com/repos/code
# Suites: stable
# Components: main
# Architectures: amd64,arm64,armhf
# Signed-By: /usr/share/keyrings/microsoft.gpg
# ---
#
# sudo apt install apt-transport-https
# sudo apt update
# sudo apt install code # or code-insiders
# sudo apt install code-insiders

# powershell snap
#
# sudo snap install powershell --classic
# sudo snap install powershell-preview --classic

# powershell apt
# https://learn.microsoft.com/en-us/powershell/scripting/install/install-ubuntu?view=powershell-7.5

###################################
# Prerequisites
#
# Update the list of packages
# sudo apt update
#
# Install pre-requisite packages.
# sudo apt install -y wget apt-transport-https software-properties-common
#
# Get the version of Ubuntu
# source /etc/os-release
# echo $VERSION_ID
#
# Download the Microsoft repository keys
# wget -q https://packages.microsoft.com/config/ubuntu/$VERSION_ID/packages-microsoft-prod.deb
#
# Register the Microsoft repository keys
# sudo dpkg -i packages-microsoft-prod.deb
# sudo apt modernize-sources
#
# Delete the Microsoft repository keys file
# #rm packages-microsoft-prod.deb
#
# Update the list of packages after we added packages.microsoft.com
# sudo apt update
# 
###################################
# Install PowerShell
# sudo apt install -y powershell
#
# Start PowerShell
# pwsh
###################################

#--- sublime
#
# sudo snap install sublime-text --classic
# sudo snap install sublime-merge --classic

#--- umake
#
# sudo snap install ubuntu-make --classic
#
# umake electronics arduino
# umake electronics arduino -r
# umake -l

#--- android
#
# sudo apt install -y android-sdk-platform-tools
# --- sudo apt install -y adb fastboot
#
# sudo snap install scrcpy

#--- web
#
# google chrome
#
# wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
# sudo apt install ./google-chrome-stable_current_amd64.deb
#
# --- wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
# --- sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
#
# google-chrome
#
# sudo apt install -y google-chrome-stable
# sudo apt install -y google-chrome-beta
# sudo apt install -y google-chrome-unstable
#
# sudo apt modernize-sources

# chromium
#
sudo apt install -y chromium-browser
# sudo snap install chromium
# sudo snap remove chromium
#
# sudo apt install -y chromium-codecs-ffmpeg
# sudo apt install -y chromium-codecs-ffmpeg-extra

# yandex
#
# wget https://browser.yandex.ru/download/?os=linux -O yandex-browser.deb
# sudo apt install -y ./yandex-browser.deb

# tor
# sudo apt install -y torbrowser-launcher

# i2p
# https://geti2p.net/en/
#
# sudo apt-add-repository ppa:i2p-maintainers/i2p
# sudo apt update
# sudo apt install -y i2p
#
# i2prouter start/stop/restart/status
# http://127.0.0.1:7657/welcome
# 127.0.0.1:4444 - i2p proxy
# 127.0.0.1:7657 - i2p router
#
# http://ugha.i2p/EepsiteIndex - site list;
# rus.i2p - ru wiki;
# eepsites.i2p -search ;
# search.rus.i2p/ - ru search;
# paste.i2p2.i2p - pastebin/code exchange;
# im.i2p - jabber/im;
# tracker2.postman.i2p/ - torrents;
# forum.i2p - forum;
# rusleaks.i2p — wiki leaks;

#--- vt

# wine
#
# sudo apt install -y wine-stable
# --- sudo dpkg --add-architecture i386 && sudo apt update
# --- sudo dpkg --remove-architecture i386
# --- sudo apt install -y wine32:i386
# sudo apt install -y winetricks
# winecfg

sudo apt install -y virt-what

# virtualbox
#
# sudo apt install -y virtualbox

# kvm
#
# http://www.cyberciti.biz/faq/how-to-install-kvm-on-ubuntu-linux-14-04/
#
sudo apt install -y cpu-checker
sudo kvm-ok
# sudo apt install -y qemu-kvm
# sudo apt install -y libvirt-clients
# sudo apt install -y libvirt-daemon-system
# sudo apt install -y bridge-utils
# sudo apt install -y virt-manager
#
# sudo apt install -y qemu-guest-agent

# --- anydesk
# https://deb.anydesk.com/howto.html
#
## Add the AnyDesk GPG key
# sudo apt update
# sudo apt install ca-certificates curl apt-transport-https
# sudo install -m 0755 -d /etc/apt/keyrings
# sudo curl -fsSL https://keys.anydesk.com/repos/DEB-GPG-KEY -o /etc/apt/keyrings/keys.anydesk.com.asc
# sudo chmod a+r /etc/apt/keyrings/keys.anydesk.com.asc
#
## Add the AnyDesk apt repository
# echo "deb [signed-by=/etc/apt/keyrings/keys.anydesk.com.asc] https://deb.anydesk.com all main" | sudo tee /etc/apt/sources.list.d/anydesk-stable.list > /dev/null
#
## Update apt caches and install the AnyDesk client
# sudo apt update
# sudo apt install anydesk

# --- lamp

# apache
#
sudo apt install -y apache2
#
# sudo chown www-data:www-data /var/www/html/ -R
#
# sudo apt install -y libapache2-mod-php
# sudo a2dismod php8.4
# sudo a2enmod php8.4
# sudo systemctl restart apache2

# php8
#
sudo apt install -y php
sudo apt install -y libapache2-mod-php
sudo apt install -y php-mysql
sudo apt install -y php-cli
#
# --- some php modules
# sudo apt install -y php-common php-soap php-gd
# sudo apt install -y php-curl php-json php-cgi php-gd php-zip php-mbstring php-xml php-xmlrpc
#
# --- php-mcrypt
# sudo apt install -y php-dev libmcrypt-dev
#
# sudo apt instal -y php-pear
# sudo pecl channel-update pecl.php.net
# sudo pecl install mcrypt-1.0.1


# mysql
#
# sudo apt install -y mysql-server mysql-client
# sudo mysql_install_db
# sudo /usr/bin/mysql_secure_installation
# systemctl status mysql
#
# remove mysql
#
# sudo apt purge mysql-server mysql-client mysql-common
# sudo apt autoremove
# sudo mv -iv /var/lib/mysql /var/tmp/mysql-backup
# sudo mv -iv /var/lib/mysql /var/tmp/`date +%y%m%d_%H%M`-mysql-bkp
# sudo rm -rf /var/lib/mysql*

# mariadb
#
# mariadb-repo (ubuntu lts)
#
# curl -sS https://downloads.mariadb.com/MariaDB/mariadb_repo_setup | sudo bash
#
# curl -LsSO https://r.mariadb.com/downloads/mariadb_repo_setup
# echo "${checksum} mariadb_repo_setup" | sha256sum -c -
# https://mariadb.com/docs/server/server-management/install-and-upgrade-mariadb/installing-mariadb/binary-packages/mariadb-package-repository-setup-and-usage#versions
#
# chmod +x ./mariadb_repo_setup
# sudo apt update
# sudo apt install curl apt-transport-https
# sudo ./mariadb_repo_setup
sudo apt install -y mariadb-server mariadb-client
# systemctl status mariadb
# sudo systemctl start mariadb
# sudo systemctl enable mariadb
# mariadb --version
# sudo apt remove -y mariadb-server mariadb-client

# postgress
#
# https://www.postgresql.org/download/linux/ubuntu/

# sudo apt install -y postgresql
# sudo systemctl status postgresql.service
# sudo systemctl disable  postgresql
#
# sudo snap install pgadmin4
# sudo snap connect pgadmin4:password-manager-service
# sudo snap connect pgadmin4:home

# sqlite
#
# https://launchpad.net/~linuxgndu/+archive/ubuntu/sqlitebrowser
#
# sudo add-apt-repository -y ppa:linuxgndu/sqlitebrowser
sudo apt install -y sqlitebrowser

#--- webapp

# phpsysinfo apt
#
sudo apt install -y phpsysinfo
# sudo apt install -y php-snmp
#
# http://localhost/phpsysinfo
#
# cat /etc/apache2/conf-available/50-phpsysinfo.conf
# cat /etc/phpsysinfo/apache.conf
#
# sudo a2enconf 50-phpsysinfo
# sudo a2disconf 50-phpsysinfo
# sudo systemctl reload apache2
#

#--- /etc/phpsysinfo/apache.conf
#
# Alias /phpsysinfo /usr/share/phpsysinfo
# <Location /phpsysinfo-apt>
# Options None
# Order deny,allow
# Deny from all
# Allow from localhost
# Allow from 192.168.0.0/24
# Allow from all
# </Location>
#---

#--- phpsysinfo custom
#
# cd /tmp
# wget https://sourceforge.net/projects/phpsysinfo/files/latest/download
# tar -zxvf download
# sudo mkdir /var/www/html/phpsysinfo && sudo mv phpsysinfo*/* /var/www/html/phpsysinfo
# sudo cp /var/www/html/phpsysinfo/phpsysinfo.ini.new /var/www/html/phpsysinfo/phpsysinfo.ini
#
# hardware monitoring for phpsysinfo
#
# sudo apt install -y hddtemp
# sudo dpkg-reconfigure hddtemp
# sudo apt install -y lm-sensors
#
# sudo apt-get install smartmontools
# sudo chmod 4755 /usr/sbin/smartctl #(for phpsyinfo)
#
# sudo apt install -y mbmon
# cat /etc/default/mbmon && sudo vi cat /etc/default/mbmon
# sudo /etc/init.d/mbmon start
#
# sudo apt install -y uptimed
# uprecords -a -w
# sudo chmod 4755 /usr/bin/uprecords - # for phpsyinfo
# ---

# --- samba + winbind

sudo apt install -y smbclient
sudo apt install -y cifs-utils

# sudo apt install -y samba-common samba winbind
# sudo apt install -y krb5-user # kerberos
# sudo apt install -y libpam-krb5 libpam-winbind libnss-winbind
#
# --- sudo restart smbd && sudo restart nmbd
# sudo net ads join -U <user@DOMAIN.DOM> -D <DOMAIN>
# sudo net ads testjoin
#
# sudo wbinfo -t
# sudo wbinfo -u
# sudo wbinfo -g
#
# kinit <user@DOMAIN.DOM>
# klist
# kdestroy
# smbclient -k -L <dom-srv-adc-1>

# --- sssd + ad + realmd
#
# sudo hostnamectl set-hostname <dom-lin-1.domain.dom> # host fqdn for system keytab
#
sudo apt install -y sssd sssd-tools sssd-ad # sssd
sudo apt install -y realmd adcli # realmd
sudo apt install -y krb5-user krb5-config # kerberos
sudo apt install -y libpam-sss libnss-sss libsss-sudo # libpam libsss
sudo apt install -y oddjob oddjob-mkhomedir packagekit # d-bus homedir
#
# --- samba
# --- sudo apt install -y samba-common-bin samba-libs
# --- sudo apt install -y libpam-krb5
#
# sudo pam-auth-update # create home directory on login
#
# sudo systemctl restart sssd.service
#
# sudo sss_cache -E
# sudo sss_cache -u <username>
#
# realm discover -v
# realm list
#
# sudo realm join --verbose --user=<username> --automatic-id-mapping=no --install=/ \
#     --computer-ou="OU=linux,OU=computers,DC=domain,DC=dom" domain.dom
# sudo realm join --verbose --user=user@DOMAIN.DOM --user-principal="host/dom-lin-1.domain.dom@DOMAIN.DOM" \
#     --computer-ou="OU=linux,OU=computers,DC=domain,DC=dom" --install=/ domain.dom
#
# sudo realm join --verbose --user=<username> domain.dom
#
# sudo klist -ekt /etc/krb5.keytab
#
# sudo realm leave
# ---

# --- docker
#
# https://thenewstack.io/penetration-testing-with-kali-linux-as-a-docker-container/
# https://docs.docker.com/engine/install/ubuntu/
#
# --- curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
# --- sudo apt install apt-transport-https ca-certificates curl gnupg lsb-release
#
sudo apt install -y ca-certificates curl
sudo install -m 0755 -d /etc/apt/keyrings
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
sudo chmod a+r /etc/apt/keyrings/docker.asc

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "${UBUNTU_CODENAME:-$VERSION_CODENAME}") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io
# sudo apt install docker-buildx-plugin docker-compose-plugin

sudo usermod -aG docker $USER
# sudo docker run hello-world

# docker pull kalilinux/kali-rolling
# docker run --tty --interactive kalilinux/kali-rolling
# docker run -ti kalilinux/kali-rolling /bin/bash
# docker run -it kalicore /bin/bash
#
# > apt install kali-linux-core
# docker ps
# docker commit <ID> kalicore

# docker container list --all
# docker start <id>
# docker attach <id>
# docker start -ai <id>
# docker rm <id>
# docker images

# --- gns3
# --- https://docs.gns3.com/docs/getting-started/installation/linux/
#
# sudo add-apt-repository ppa:gns3/ppa
# sudo apt update
# sudo apt install gns3-gui gns3-server
#
# --- gns3 iou support
#
# sudo dpkg --add-architecture i386
# sudo apt update
# sudo apt install gns3-iou
#
# --- docker ce
#
# sudo apt remove docker docker-engine docker.io
# sudo snap remove docker
#
# sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
#
# curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
#
# sudo add-apt-repository \
# "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
# $(. /etc/os-release && echo $VERSION_CODENAME) stable"
#
# sudo apt update
# sudo apt install docker-ce
#
# sudo usermod -aG ubridge,libvirt,kvm,wireshark,docker $(whoami)

# ---
