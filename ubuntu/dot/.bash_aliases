# $Id: .bash_aliases,v 1.1 2025/12/06 16:55:27 dant Exp $
#
# ~./.bash_aliases - bash aliaces

# cd
#
alias cd..='cd ..'

# a quick way to get out of current directory
#
alias ..='cd ..'
alias ...='cd ../../../'
alias ....='cd ../../../../'
alias .....='cd ../../../../'
alias .4='cd ../../../../'
alias .5='cd ../../../../..'

# ls
#
alias ll='ls -alF'
alias llh='ls -halF'
alias la='ls -A'
alias lf='ls -CF'
alias l='ls -l'

# ls - show hidden files
#
alias l.='ls -d .* --color=auto'

# mkdir - create parent directories on demand
#
alias mkdir='mkdir -pv'

# rm - do not delete / or prompt if deleting more than 3 files at a time
alias rm='rm -I --preserve-root'

# confirmation
#
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'

# parenting changing perms on /
#
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

# chmod
#
alias cr='chmod a+r'
alias cx='chmod a+x'
alias cx-='chmod a-x'

# become root
#
alias root='sudo -i'
alias sui='sudo -i'

# apt-get
#
# alias upd='sudo apt-get update'
# alias upgr='sudo apt-get upgrade'
# alias upgr-dist='sudo apt-get dist-upgrade'
# alias upgr-all='echo Update;sudo apt-get update ; sudo apt-get upgrade -y ; sudo apt-get dist-upgrade && sudo apt-get autoremove -y'
# alias upgr-rmv='sudo apt-get autoremove'
# alias install='sudo apt-get install'
# alias uninstall='sudo apt-get remove'
# alias uninstall-purge='sudo apt-get purge'
# alias autoremove='sudo apt-get autoremove'

# --- apt
#
alias upd='sudo apt update'
alias upgr='sudo apt upgrade'
alias upgr-dist='sudo apt dist-upgrade'
alias upgr-full='sudo apt full-upgrade'
alias upgr-all='sudo apt update && sudo apt upgrade && sudo apt dist-upgrade && sudo apt autoremove'
alias upgr-lst='sudo apt list --upgradable'
alias app-lst='sudo apt list --installed'
#
alias install='sudo apt install'
# alias instlog='sudo apt-get install $1 2>&1 |tee -a ~/app/log/$1.log'
#
alias uninstall='sudo apt remove'
alias remove='sudo apt remove'
alias purge='sudo apt purge'
#
alias autoremove='sudo apt autoremove'
# ---

alias sumc='sudo mc'
alias mcsu='sudo mc'
alias mcbw='mc -b'

alias cls=clear
alias h=history
alias j='jobs -l'

alias df='sudo df -h'
# alias df='sudo df -H'
# alias df='df -B M'
alias dfree='sudo df -h -x tmpfs'
alias du='sudo du -ch'
alias dus='sudo du -hs'

alias duf='du -sk * | sort -n | while read size fname; do for unit in k M G T P E Z Y; do if [ $size -lt 1024 ]; then echo -e "${size}${unit}\t${fname}"; break; fi; size=$((size/1024)); done; done'
# alias duf='du -sk * | sort -n | perl -ne '\''($s,$f)=split(m{\t});for (qw(K M G)) {if($s<1024) {printf("%.1f",$s);print "$_\t$f"; last};$s=$s/1024}'\'

# reboot
#
alias reboot='sudo /sbin/reboot'
alias poweroff='sudo /sbin/poweroff'
alias halt='sudo /sbin/halt'
alias shutdown='sudo /sbin/shutdown'
alias hibernate='sudo systemctl hibernate'

alias sysver='uname -a'

alias rnd='egrep -aom 1 '[0-9]{2}' /dev/urandom | head -n 1'
alias rnd-str='echo `cat /dev/urandom | base64 | tr -dc "[:alnum:]" | head -c64`'

# --- mount
#
# make mount command output pretty and human readable format
alias mnt-inf='mount|column -t'
#
# alias mnt-backup='sudo mount /mnt/nfs/nas/backup'
# alias umnt-backup='sudo umount /mnt/nfs/nas/backup'
#
# alias mnt-download='sudo mount /mnt/nfs/nas/download'
# alias umnt-download='sudo umount /mnt/nfs/nas/download'
#
# alias mnt-all='sudo mount /mnt/nfs/nas/download ; sudo mount /mnt/nfs/nas/backup'
# alias umnt-all='sudo umount /mnt/nfs/nas/download ; sudo umount /mnt/nfs/nas/backup '
# ---

alias svc='sudo service'
alias ctl='sudo systemctl'

# colorize diff output
#
alias diff=colordiff

# rcs version control
#
alias vci='ci -u'
alias vco='co'
alias vcl='co -l'
alias vcd='rcsdiff -u'
alias vcr='rlog'

# git
#
alias ga='git add'
alias gp='git push'
alias gl='git log'
alias gs='git status'
alias gd='git diff'
alias gdc='git diff --cached'
alias gm='git commit -m'
alias gma='git commit -am'
alias gb='git branch'
alias gc='git checkout'
alias gra='git remote add'
alias grr='git remote rm'
alias gpu='git pull'
alias gcl='git clone'

# weather
#
alias wttr='curl https://wttr.in'
alias wttr2='curl https://v2.wttr.in'
alias wttr-nsk='curl https://wttr.in/novosibirsk'
alias wttr2-nsk='curl https://v2.wttr.in/novosibirsk'

# powershell
#
# alias posh='export DOTNET_SYSTEM_GLOBALIZATION_INVARIANT=1 ; powershell'

# wine
alias winbox='wine /usr/local/bin/winbox.exe'

# networking
#
alias ip-all='ifconfig | grep -o "inet [^ ]*" | cut -d: -f2'
#
alias vnstat='vnstat -i wlp2s0'
alias dnstop='sudo dnstop -l 5  wlp2s0'
alias iftop='sudo iftop -i wlp2s0'
alias tcpdump='sudo tcpdump -i wlp2s0'
alias ethtool='sudo ethtool wlp2s0'
#
# wireless
alias iwconfig='iwconfig wlp2s0'
#
alias net-route='netstat -nr'
alias net-stat='netstat -ai'
alias net-con='netstat -ant'
alias net-svc='netstat -pnltu'
alias net-lst='netstat -pnltu|grep LISTEN'
alias net-port='netstat -tulanp'

# wol
#
alias wol-nas='/usr/bin/wakeonlan 00:08:9b:c9:d4:6a'

# iptables
#
alias ipt='sudo /sbin/iptables'
#
alias ipt-lst='sudo /sbin/iptables -L -n -v --line-numbers'
alias ipt-lst-in='sudo /sbin/iptables -L INPUT -n -v --line-numbers'
alias ipt-lst-out='sudo /sbin/iptables -L OUTPUT -n -v --line-numbers'
alias ipt-lst-fw='sudo /sbin/iptables -L FORWARD -n -v --line-numbers'
alias firewall=ipt-lst

alias fwsu='sudo gufw &'

# curl
#
# get web server headers #
alias curl-hdr='curl -I'

# service
#
alias timesvc-status='systemctl status systemd-timesyncd'
alias timesvc-restart='sudo systemctl restart systemd-timesyncd'
alias timesvc-log='journalctl -u systemd-timesyncd --since today'

# start calculator with math support
alias bc='bc -l'

# openssl
#
alias sha1='openssl sha1'

# env
#
alias path='echo -e ${PATH//:/\\n}'

# date&time
#
alias time-now='date +"%T"'
alias date-now='date +"%d-%m-%Y"'
alias now='time-now && date-now'

# edit
#
alias vi=vim
alias visu='sudo vim'
alias visi='vim "+set si"'
alias edit='vim'
alias nano='nano -w'
alias sublime='/opt/sublime_text/sublime_text &'

# ping
#
# stop after sending count ECHO_REQUEST packets
#
alias pingc='ping -c 5'
#
# do not wait interval 1 second, go fast
#alias fastping='ping -c 100 -s 2'

# apache
#
alias httpd-reload='sudo /usr/sbin/apachectl -k graceful'
alias httpd-test='sudo /usr/sbin/apachectl -t && /usr/sbin/apachectl -t -D DUMP_VHOSTS'
alias httpd-status='sudo /usr/sbin/apachectl status'
alias httpd-statusfull='sudo /usr/sbin/apachectl fullstatus'

# multimedia
#
# play video files in a current directory ##
alias play-avi='mplayer *.avi'
alias play-avi-vlc='vlc *.avi'
#
# play all music files from the current directory #
alias play-wave='for i in *.wav; do mplayer "$i"; done'
alias play-ogg='for i in *.ogg; do mplayer "$i"; done'
alias play-mp3='for i in *.mp3; do mplayer "$i"; done'
#
# shuffle mp3/ogg etc by default #
alias music='mplayer --shuffle *'

# --- system Information

# pass options to free
#
alias meminfo='free -h'
alias meminfo-all='free -h -m -l -t'
#
alias psmem-all='ps -eo pmem,pcpu,rss,vsize,args | sort -k 1 -r | less'
#
# get top process eating memory
alias psmem='ps auxf | sort -nr -k 4'
alias psmem10='ps auxf | sort -nr -k 4 | head -10'
#
# get top process eating cpu
#
alias pscpu='ps auxf | sort -nr -k 3'
alias pscpu10='ps auxf | sort -nr -k 3 | head -10'
#
# get server cpu info
#
alias cpuinfo='lscpu'

# older system use /proc/cpuinfo
#
alias cpuinfo-proc='less /proc/cpuinfo'

# get GPU ram on desktop / laptop
# alias gpumeminfo='grep -i --color memory /var/log/Xorg.0.log'

# wget
#
alias wget='/usr/bin/wget --server-response --timestamping --continue --progress=bar'
# alias wget='/usr/bin/wget -S -N --progress=dot '
# alias wget='wget -c'

# xwindow
#
# alias xw-inf='xwininfo -id $(xprop -root | awk '/_NET_ACTIVE_WINDOW\(WINDOW\)/{print $NF}')'

# web browsers
#
alias ff='/usr/bin/firefox &'
alias chrome='/usr/bin/google-chrome &'
#
# default browser
alias www=ff

# ---
