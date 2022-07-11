# SimpleX SMP Server

Simple container for the SimpleX chat server

[Dockerhub Link](https://hub.docker.com/r/kizaing/simplex-chat)

## Running
If using a FQDN

` docker run -d --name simplex-chat -e UseIP=false -e FQDN=<FQDN> -p 5223:5223 -v ${PWD}/config:/etc/opt/simplex kizaing/simplex-chat:latest `

or if using ip

` docker run -d --name simplex-chat -e UseIP=true -e IP=<IP> -p 5223:5223 -v ${PWD}/config:/etc/opt/simplex kizaing/simplex-chat:latest `
