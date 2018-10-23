#!/bin/bash

cd ~/openshift-on-aws/labs/lab0
docker build -t registry registry/
docker run --restart="always" --name registry -p 5000:5000 -d registry
docker build -t mariadb mariadb/
docker build -t wordpress wordpress/
docker tag mariadb localhost:5000/mariadb
docker tag wordpress localhost:5000/wordpress
docker push localhost:5000/mariadb
docker push localhost:5000/wordpress
docker stop mariadb wordpress