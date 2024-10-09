#!/usr/bin/env bash

set -e

AWS_REGION=$(aws configure get region || echo "$AWS_REGION" || echo "$AWS_DEFAULT_REGION")

if [ -z "$AWS_REGION" ]; then
  echo "Could not determine current AWS region."
  exit 1
fi

AWS_ACCOUNT=$(aws sts get-caller-identity --query Account --output text)

DOCKER_TAG="$(date +%Y%m%d)-$(git rev-parse --short=8 HEAD)"
DOCKER_IMAGE=$AWS_ACCOUNT.dkr.ecr.$AWS_REGION.amazonaws.com/setup-app:$DOCKER_TAG

aws ecr get-login-password --region "$AWS_REGION" | docker login --username AWS --password-stdin "$AWS_ACCOUNT".dkr.ecr."$AWS_REGION".amazonaws.com
docker build -t  "$DOCKER_IMAGE" .
docker push "$DOCKER_IMAGE"

echo "Pushed image $DOCKER_IMAGE"
