#!/bin/bash

K8S_VERSIONS=(v1.8.0 v1.8.1 v1.8.2 v1.9.0 v1.10.1 v1.10.2)

function git_init()
{
    git config user.email jinsyin@gmail.com
    git config user.name jinsyin
}

function git_commit()
{
    for tag in ${K8S_VERSIONS[@]}; do
        git checkout master
        git checkout -b $tag
        sed -e "s|__DOCKER_TAG__|$tag|g" branch/.travis.yml.sed > .travis.yml
        sed -e "s|__K8S_VERSION__|$tag|g" branch/Dockerfile.sed > Dockerfile
        sed -e "s|__DOCKER_TAG__|$tag|g" branch/README.md.sed > README.md
        rm -rf branch/ script.sh
        git add --all
        DATE=`date '+%Y-%m-%d %H:%M:%S'`
        git commit -m "kubectl $tag, submitted at $DATE"
    done
    git checkout master
}

function git_push()
{
    # git checkout master
    git remote add origin git@github.com:dockerce/docker-kubectl2.git

    # Push all except "master" branch
    for branch in ${K8S_VERSIONS[@]}; do
        git push -f origin $branch
    done
}

git_init
git_commit
git_push