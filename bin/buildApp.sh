#!/bin/bash
if [[ ! $1 =~ ^(dev|staging|prod)$ ]]; then
  echo "Pass desired environment. Valid values: prod, staging, dev"
  exit 1
fi

#build dev
if [[ $1 == 'dev' ]]; then
  #change to desired build
  docker build \
    -f docker/Dockerfile \
    -t baseapp:0.1 \
    .
fi

#build staging
if [[ $1 == 'staging' ]]; then
  #change to desired build
  docker build \
    -f docker/Dockerfile \
    -t baseapp:0.1 \
    --build-arg ENVIRONMENT=staging \
    .
fi

#build prod
if [[ $1 == 'prod' ]]; then
  #change to desired build
  docker build \
    -f docker/Dockerfile \
    -t baseapp:0.1 \
    --build-arg ENVIRONMENT=prod \
    .
fi