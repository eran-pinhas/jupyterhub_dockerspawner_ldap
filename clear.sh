#!/bin/bash

docker stop jupyterhub

docker image rm jupyterhub_dockerspawner_ldap

docker image rm jupyterhub_custom_notebook

docker rm jupyterhub
