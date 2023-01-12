FROM openjdk:20-slim-buster

RUN apt update -y && apt install curl -y && apt install jq -y && \
    apt-get -y install cron && apt install git -y  && apt install rsync -y && apt install wget -y

ENV GROUP=mc_group
ENV USER=creeper
ENV PORT=5000
ENV MC_DIR=/home/$USER/mc
ENV BACKUP_INTERVAL=30
ENV BACKUP=false
ENV JAVA_XMS=4096M
ENV JAVA_XMX=4096M
ENV MC_VERSION=1.19.2
# ENV TOKEN

#creating new custom group + a new system user
RUN groupadd $GROUP && \
    useradd $USER -d /home/$USER -m -s /bin/bash

WORKDIR $MC_DIR
#changing folder groups root to custom group + giving permissions R+W 
RUN chown -R $USER:$GROUP $MC_DIR
RUN chmod -R g+w $MC_DIR
RUN chmod u+s /usr/sbin/cron
RUN chown -R $USER:$GROUP /etc/cron.d/
#put USER into groups who have permissions on MC_DIR
RUN usermod -aG $GROUP $USER

COPY ./entrypoint.sh /tmp/entrypoint.sh
COPY ./gitcronjob.sh /tmp/gitcronjob.sh
RUN chmod +x /tmp/entrypoint.sh /tmp/gitcronjob.sh

# USER $USER
EXPOSE $PORT

ENTRYPOINT [ "/tmp/entrypoint.sh" ]
