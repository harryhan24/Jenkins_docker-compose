# Jenkins_docker-compose

Requires Docker 19.03.3 installed on host machine

## Usage:
Build:
`$ docker image build -t jenkins_docker-compose:[version] .` 

Run:
`$ docker run -d -p 8080:8080 -p 50000:50000 -v /var/run/docker.socks:/var/run/docker.sock --user root -v jenkins_home:/var/jenkins_home jenkins_docker-compose:[version]`
