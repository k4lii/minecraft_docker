FROM openjdk:20-slim-buster

ARG FORGE_VERSION
# ARG GIT_TOKEN

RUN apt update -y && apt install curl -y
# ARG USER
ENV GROUP=mc_group
ENV USER=creeper
ENV MC_DIR=/home/$USER/mc

#creating new custom group + a new system user 
RUN groupadd $GROUP && \
    useradd $USER -d /home/$USER -m -s /bin/bash

WORKDIR $MC_DIR
#changing folder groups root to custom group + giving permissions R+W 
RUN chown -R $USER:$GROUP $MC_DIR
RUN chmod -R g+w $MC_DIR
#put USER into groups who have permissions on MC_DIR
RUN usermod -aG $GROUP $USER

#download minecraft server for choosen version
RUN curl -O https://maven.minecraftforge.net/net/minecraftforge/forge/$FORGE_VERSION/forge-$FORGE_VERSION-installer.jar


USER $USER

# RUN if [[ -z "$arg" ]] ; then echo Argument not provided ; else echo Argument is $arg ; fi

# RUN git clone git@github.com:k4lii/mc_backup.git

# RUN 0 */1 * * *  /home/username/test.sh

RUN java -jar forge-$FORGE_VERSION-installer.jar --installServer && \
    rm forge-$FORGE_VERSION-installer.jar
# RUN ./run.sh  && sed -i 's/eula=false/eula=true/g' eula.txt
# CMD ./run.sh --port 8000



CMD /bin/bash