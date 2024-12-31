#!/bin/bash
ssh -i /Users/michaelstewart/.ssh/id_rsa root@66.245.195.86 << 'ENDSSH'
echo "Contents of api.env:"
cat /root/RWTProj/RWTapi/config/api.env

echo "Contents of frontend.env:"
cat /root/RWTProj/rwt/config/frontend.env

exit
ENDSSH