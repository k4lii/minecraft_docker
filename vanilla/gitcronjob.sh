#!/bin/bash

cd /home/$USER/mc/

if [ !/home/$USER/mc/mc_backup ]
then
    echo "Cloning Git Backup Folder"
    git clone https://oauth2:$GIT_TOKEN@github.com/$GIT_USER/$GIT_REPO.git
else
    echo "Git Backup Folder Already Exist"
fi

cp -rf /home/$USER/mc/* /home/$USER/mc/$GIT_REPO/
rm -rf /home/$USER/mc/$GIT_REPO/server.jar # [pas ouf]

cd /home/$USER/mc/$GIT_REPO
git add . 
git commit -m "server backup" -m "$(date)"
git push
cd /home/$USER/mc