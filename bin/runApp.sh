#!/bin/bash
#change to desired run
docker run \
  --rm \
  --name baseapp \
  -p 80:80 \
  -v $PWD:/var/www \
  baseapp:0.1