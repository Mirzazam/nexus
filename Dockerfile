FROM jenkins/jenkins:lts-jdk11
RUN jenkins-plugin-cli \
    --plugins \
    git \
    slack \
    nexus-artifact-uploader \
    maven-plugin \
    publish-over-ssh \
    docker-plugin

EXPOSE 8080