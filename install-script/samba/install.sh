#!/usr/bin/bash

sudo apt-get install -y samba 
sudo systemctl stop samba 
sudo mv /etc/samba/smb.conf /etc/samba/smb.conf.1 
sudo wget -O /etc/samba/smb.conf https://raw.githubusercontent.com/jjye93/raspberrypi/refs/heads/main/install-script/samba/smb.conf
sudo chmod 644 /etc/samba/smb.conf
sudo chown root:root /etc/samba/smb.conf
sudo systemctl start samba 
if ! command -v expect &> /dev/null
then
    echo "Expect is not installed, installing..."
    sudo apt-get install -y expect
fi

expect <<EOF
spawn sudo smbpasswd -a admin
expect "New SMB password:"
send "qwer1234\r"
expect "Retype new SMB password:"
send "qwer1234\r"
expect eof
EOF
sudo systemctl restart samba
