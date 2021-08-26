#!/bin/bash

#SSH
apt-get install openssh-server
systemctl enable ssh

#Remove Vulerable Programs
apt-get purge apache2
apt-get purge nginx
apt-get purge ftp
apt-get purge wesnoth
apt-get purge netcat
apt-get purge wireshark
apt-get purge nmap
apt-get purge apache

#IPV6
sysctl -w net.ipv6.conf.all.disable_ipv6=1
sysctl -w net.ipv6.conf.default.disable_ipv6=1
sysctl -w net.ipv6.conf.lo.disable_ipv6=1
sysctl -p

#Updates
apt update && apt upgrade && apt dist-upgrade && apt clean && apt autoclean && apt autoremove

#Firewall
ufw enable
#ufw allow ssh

#Things to revisit
# Check user permissions
# Disable ssh root logon
# Forensics questions
# Malware scan (probably unneccessary)
# Remove pictures, music, and videos from home dirs
# Disable autologon (/etc/gdm3/custom.conf)
# update sudo
# update openssl
# update firefox
# update kernel
# check crontab
# check firewall status using alt+f2 gufw
# enable firefox popup blocker
# Disable root logon locally
# locking and unlocking users
# enforce password requirements (/etc/login.defs)
	#PASS_MIN_DAYS 7
        #PASS_MAX_DAYS 90
        #PASS_WARN_AGE 14
# Add a minimum password length, password history, and add complexity requirements
	#Open `/etc/pam.d/common-password` with sudo
	#Add `minlen=8` to the end of the line that has `pam_unix.so` in it
	#Add `remember=5` to the end of the line that has `pam_unix.so` in it
	#Locate the line that has pam.cracklib.so in it. If you cannot find that line, install cracklib with `sudo apt-get install libpam-cracklib`
	#Add `ucredit=-1 lcredit=-1 dcredit=-1 ocredit=-` to the end of that line
# Implement an account lockout policy
	#Open `/etc/pam.d/common-auth`
	#Add `deny=5 unlock_time=1800` to the end of the line with `pam_tally2.so` in it
# change passwords to satisfy requirements
# enable automatic updates
	#In the GUI set Update Manager->Settings->Updates->Check for updates:->Daily
