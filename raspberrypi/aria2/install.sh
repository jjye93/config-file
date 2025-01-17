#!/usr/bin/bash
echo "aria2"
sudo apt install aria2 -y
sudo apt install git -y
sudo mkdir /etc/aria2-webui
sudo git clone https://github.com/ziahamza/webui-aria2.git /etc/aria2-webui
sudo killall aria2c
sudo mkdir /etc/aria2 -p
sudo wget -O /etc/aria2/aria2.conf https://raw.githubusercontent.com/jjye93/config-file/refs/heads/main/raspberrypi/aria2/aria2.conf
sudo chmod 755 /etc/aria2/aria2.conf
sudo wget -O /etc/systemd/system/aria2c.service https://raw.githubusercontent.com/jjye93/config-file/refs/heads/main/raspberrypi/aria2/aria2c.service
sudo chmod 755 /etc/systemd/system/aria2c.service
sudo systemctl enable aria2c
sudo systemctl start aria2c
git clone https://github.com/ziahamza/webui-aria2.git
sudo mv webui-aria2 /etc/
cd /etc/webui-aria2
sudo apt install npm -y
sudo npm install -g pm2
sudo env PATH=$PATH:/usr/bin /usr/local/lib/node_modules/pm2/bin/pm2 startup systemd -u admin --hp /home/admin
pm2 start node-server.js
pm2 save
echo "complete"
