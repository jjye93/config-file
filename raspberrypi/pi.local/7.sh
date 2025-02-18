#!/usr/bin/bash
echo "----------------------------------------------------------------"
echo "Alist"
echo "----------------------------------------------------------------"
sudo docker run -d --name alist --restart always -v '/etc/alist:/opt/alist/data' -v '/etc/alist/data:/data' -p '5244:5244' -p '5245:5245' -e 'PUID=1000' -e 'PGID=1000' -e 'TZ=Asia/Kuala_Lumpur' -e 'UMASK=022' xhofe/alist:latest
sleep 10s
sudo docker exec -it alist ./alist admin set qwer1234
echo "----------------------------------------------------------------"
echo "Completed"
echo "----------------------------------------------------------------"
echo "portainer; http://pi.local:9000"
echo "prowlarr; http://pi.local:9696"
echo "aria2; http://pi.local:8888; rpc_secret=qwer1234"
echo "transmission; http://pi.local:9091 with id admin and password qwer1234"
echo "qbittorent; http://pi.local:8081"
echo "alist; http://pi.local:5244 with id admin and password qwer1234"
echo "plex media server; http://pi.local:32400/web"
echo "----------------------------------------------------------------"
echo "please perform a reboot"
echo "----------------------------------------------------------------"
