#!/bin/bash

data="/var/lib/jupyterhub"
mkdir $data

cd hub
sudo docker build -t jupyterhub_dockerspawner_ldap .

cd ../notebook
sudo docker build -t jupyterhub_custom_notebook .

sudo docker run -p 8000:8000 -v /var/lib/jupyter-notebooks:/mount/jupyter-notebooks -v /var/run/docker.sock:/var/run/docker.sock --name jupyterhub jupyterhub_dockerspawner_ldap
