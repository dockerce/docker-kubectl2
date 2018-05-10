sudo: required

env:
  - DOCKER_IMAGE=dockerce/kubectl
  - Docker_TAG=__DOCKER_TAG__

services:
  - docker

script:
  - docker build -f Dockerfile -t $DOCKER_IMAGE:$Docker_TAG .

after_success:
  - docker login -u $DOCKER_USERNAME -p $DOCKER_PASSWORD
  - docker push $DOCKER_IMAGE:$Docker_TAG