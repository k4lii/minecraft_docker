FROM openjdk:18-slim-buster

RUN apt update -y && apt install curl -y && apt install jq -y && \
    apt-get -y install cron && apt install git -y  && apt install rsync -y && \
    apt-get install iputils-ping -y && apt install dnsutils -y && apt install wget -y &&  apt install unzip -y 

ENV GROUP=mc_group
ENV USER=creeper
ENV MC_DIR=/home/$USER/mc
ENV JAVA_XMS=4096M
ENV JAVA_XMX=4096M
# ENV TOKEN

#creating new custom group + a new system user
RUN groupadd $GROUP && \
    useradd $USER -d /home/$USER -m -s /bin/bash

WORKDIR $MC_DIR
#changing folder groups root to custom group + giving permissions R+W
RUN chown -R $USER:$GROUP $MC_DIR
#chmod 700 foldername will give read, write, and execute permissions for the user only
RUN chmod -R 700 $MC_DIR

RUN usermod -aG $GROUP $USER

COPY ./entrypoint.sh /tmp/entrypoint.sh
RUN chmod +x /tmp/entrypoint.sh
# USER $USER
EXPOSE 25565
ENTRYPOINT [ "/tmp/entrypoint.sh" ]