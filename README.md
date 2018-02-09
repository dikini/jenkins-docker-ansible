## Jenkins, docker and ansible in a docker container

This is a simple image, built on top of the stock https://jenkins.io (docker image)[https://hub.docker.com/r/jenkins/jenkins/] .It adds (ansible)[https://ansible.com] and (docker-ce)[https://docker.com].

## Running jenkins in docker

Instead of a docker-in-docker type scheme, this image requires mounting the docker socket, which allows starting, and controlling _'sibling'_ containers:

```bash
docker run -p 8080:8080 -p 50000:50000 -v /var/run/docker.sock:/var/run/docker.sock dikini/jenkins-docker-ansible
```
