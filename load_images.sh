#!/bin/bash
ssh -i /Users/michaelstewart/.ssh/id_rsa root@66.245.195.86 << 'ENDSSH'
cd /root/RWTProj/tar_files
docker load -i rwtproj-api.tar
docker load -i rwtproj-frontend.tar
exit
ENDSSH