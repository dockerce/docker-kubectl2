# Kubectl Docker image

[![Travis CI](https://travis-ci.org/dockerce/docker-kubectl2.svg?branch=__DOCKER_TAG__)](https://travis-ci.org/dockerce/docker-kubectl2)

## Build

```bash
docker build -f Dockerfile -t dockerce/kubectl:__DOCKER_TAG__ .
```

## Run

```bash
docker run -it --rm dockerce/kubectl:__DOCKER_TAG__ --help
```