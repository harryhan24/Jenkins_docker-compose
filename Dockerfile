FROM jenkins/jenkins:lts
USER root
COPY run.sh ./run.sh
RUN chmod +x ./run.sh


#RUN apt-get update && \
#	apt-get -y install apt-transport-https \
#    ca-certificates \
#    curl \
#    gnupg2 \
#    software-properties-common && \
#	curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg > /tmp/dkey; apt-key add /tmp/dkey && \
#	add-apt-repository \
#   	"deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
#   	$(lsb_release -cs) \
#   	stable" && \
#	apt-get update && \
#	apt-get -y install docker-ce

RUN apt-get update -qq && \
    apt-get install -qqy apt-transport-https ca-certificates curl gnupg2 software-properties-common && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
    apt-key fingerprint 0EBFCD88 && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" && \
    apt-get update -qq && \
    apt-get install -qqy docker-ce && \
    usermod -aG docker jenkins && \
    chown -R jenkins:jenkins $JENKINS_HOME/

#RUN mkdir -p /tmp/download && \
# curl -L https://download.docker.com/linux/static/stable/x86_64/docker-19.03.3.tgz | tar -xz -C /tmp/download && \
# rm -rf /tmp/download/docker/dockerd && \
# mv /tmp/download/docker/docker* /usr/local/bin/ && \
# rm -rf /tmp/download
# groupadd -g 999 docker && \
# usermod -aG docker jenkins &&\
# gpasswd -a jenkins docker

RUN curl -L "https://github.com/docker/compose/releases/download/1.25.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
RUN chmod +x /usr/local/bin/docker-compose

#USER jenkins

#ENTRYPOINT ["/bin/bash","-c","./run.sh"]

VOLUME [$JENKINS_HOME, "/var/run/docker.sock"]