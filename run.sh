#! /bin/bash
BASEDIR=$(dirname $0) #go to directory where script is located
cd $BASEDIR
sudo git pull
(sleep 4; xdg-open $(cat logs/log.out | grep http | tail -n 1 | awk '{print $NF}')) & #redirect to jupyter webapp
sudo docker-compose up --remove-orphans | tee logs/log.out #redirect docker output to log.out
sudo docker-compose down
sudo git add .
sudo git commit -m "backing up jupyter notebooks"
sudo git push
