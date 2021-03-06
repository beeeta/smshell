#!/bin/sh

##----init kali shell----##
## add images for apt of kali.2
echo 'deb http://http.kali.org/kali kali-rolling main non-free contrib' >> /etc/apt/sources.list
echo 'deb http://mirrors.ustc.edu.cn/kali kali-rolling main non-free contrib' >> /etc/apt/sources.list

apt-get update && apt-get upgrade
apt-get clean

## install vsftpd server
apt-get install vsftpd

# config ftp user
adduser itfpt
passwd itfpt

echo 'userlist_file=/etc/vsftpd.userlist' >> /etc/vsftpd.conf
echo 'userlist_enable=YES' >> /etc/vsftpd.conf
echo 'userlist_deny=NO' >> /etc/vsftpd.conf

# enable to upload file
echo 'write_enable=YES' >> /etc/vsftpd.conf
echo 'allow_writeable_chroot=YES' >> /etc/vsftpd.conf

# disable user to get out of the path
echo 'chroot_local_user=YES' >> /etc/vsftpd.conf

# the save file path /home/user_name/ftp
echo 'user_sub_token=$USER' >> /etc/vsftpd.conf
echo 'local_root=/home/$USER/ftp' >> /etc/vsftpd.conf

touch /etc/vsftpd.userlist
echo 'itftp' > /etc/vsftpd.userlist

service vsftpd restart

echo 'vsftpd config success!'



