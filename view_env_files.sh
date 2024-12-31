#!/bin/bash
scp -i /Users/michaelstewart/.ssh/id_rsa /path/to/local/api.env root@66.245.195.86:/root/RWTProj/RWTapi/config/api.env
scp -i /Users/michaelstewart/.ssh/id_rsa /path/to/local/frontend.env root@66.245.195.86:/root/RWTProj/rwt/config/frontend.env
scp -i /Users/michaelstewart/.ssh/id_rsa /path/to/local/compose.yaml root@66.245.195.86:/root/RWTProj/compose.yaml

ssh -i /Users/michaelstewart/.ssh/id_rsa root@66.245.195.86 << 'ENDSSH'
cd /root/RWTProj/RWTapi/config

# Set permissions for .env files
chmod 600 api.env
chmod 600 /root/RWTProj/rwt/config/frontend.env

# Deploy services using Docker Compose
cd /root/RWTProj
docker-compose up -d
exit
ENDSSH

ssh -i /Users/michaelstewart/.ssh/id_rsa root@66.245.195.86 << 'ENDSSH'
echo "Contents of api.env:"
cat /root/RWTProj/RWTapi/config/api.env

echo "Contents of frontend.env:"
cat /root/RWTProj/rwt/config/frontend.env

exit
ENDSSH