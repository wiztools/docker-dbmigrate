#!/bin/sh

docker build . -t wiztools/dbmigrate:3.0.1
docker push wiztools/dbmigrate:3.0.1

