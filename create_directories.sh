#!/bin/bash
ssh -i /Users/michaelstewart/.ssh/id_rsa root@66.245.195.86 << 'ENDSSH'
mkdir -p /root/RWTProj/RWTapi/config
mkdir -p /root/RWTProj/rwt/config
mkdir -p /root/RWTProj/images
mkdir -p /root/RWTProj/music
exit
ENDSSH
