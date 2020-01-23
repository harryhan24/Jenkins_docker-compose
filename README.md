# Jenkins_docker-compose

Requires Docker 19.03.3 installed on host machine

## Usage:

`$ docker run -d -p 8080:8080 -p 50000:50000 -v /var/run/docker.socks:/var/run/docker.sock --user root -v jenkins_home:/var/jenkins_home dc-jenkins:0.4`
