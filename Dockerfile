FROM jenkins/jenkins

#TODO: prepare 
#COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
#RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
# if we want to install via apt

USER root

# install ansible and docker-ce
# for production we should select and install specific versions of ansible and doccker-ce
# unless we want rolling updates
RUN apt-get update \
 && apt-get install -y apt-transport-https \
    ca-certificates \
    curl \
    software-properties-common \
    apt-utils \
 && apt-key adv --keyserver keyserver.ubuntu.com --recv-keys 93C4A3FD7BB9C367 \
 && add-apt-repository "deb [arch=amd64] http://ppa.launchpad.net/ansible/ansible/ubuntu trusty main" \
 && (curl -fsSL https://download.docker.com/linux/$(. /etc/os-release; echo "$ID")/gpg | apt-key add -) \
 && add-apt-repository \
      "deb [arch=amd64] https://download.docker.com/linux/$(. /etc/os-release; echo "$ID") \
      $(lsb_release -cs) \
      stable" \
 && rm -rf /var/lib/apt/lists/*

RUN apt-get update \
 && apt-get install -y ansible docker-ce \
 && rm -rf /var/lib/apt/lists/*

# drop back to the regular jenkins user - good practice
USER jenkins


