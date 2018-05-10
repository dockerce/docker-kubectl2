# Kubectl Docker image

[![Travis CI](https://travis-ci.org/dockerce/docker-kubectl2.svg?branch=v1.8.0)](https://travis-ci.org/dockerce/docker-kubectl2)

## Build

```bash
docker build -f Dockerfile -t dockerce/kubectl:v1.8.0 .
```

## Run

```bash
docker run -it --rm dockerce/kubectl:v1.8.0 --help
```