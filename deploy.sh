#!/bin/bash
# Upload Environment and SQL Files
scp -i /Users/michaelstewart/.ssh/id_rsa \
    /Users/michaelstewart/Coding/RWTProj/RWTapi/config/api.env \
    root@66.245.195.86:/root/RWTProj/RWTapi/config/api.env

scp -i /Users/michaelstewart/.ssh/id_rsa \
    /Users/michaelstewart/Coding/RWTProj/rwt/config/frontend.env \
    root@66.245.195.86:/root/RWTProj/rwt/config/frontend.env

scp -i /Users/michaelstewart/.ssh/id_rsa \
    /Users/michaelstewart/Coding/RWTProj/rwtchoir.sql \
    root@66.245.195.86:/root/RWTProj/

scp -i /Users/michaelstewart/.ssh/id_rsa \
    /Users/michaelstewart/Coding/RWTProj/compose.yaml \
    root@66.245.195.86:/root/RWTProj/compose.yaml

# Set permissions for .env files and deploy
ssh -i /Users/michaelstewart/.ssh/id_rsa root@66.245.195.86 << 'ENDSSH'
chmod 600 /root/RWTProj/RWTapi/config/api.env
chmod 600 /root/RWTProj/rwt/config/frontend.env

# Deploy services using Docker Compose
cd /root/RWTProj
docker-compose up -d

exit
ENDSSH