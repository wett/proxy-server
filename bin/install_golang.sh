#!/bin/bash

PROJECT_DIR=$HOME/proxy-server
GO_WORKSPACE=goWorkspace
VERSION=1.8.3
OS=linux
ARCH=amd64

sudo printf '\n'
if [ -d $PROJECT_DIR ]
then
    printf "$PROJECT_DIR directory already exists.\n"
else
    printf "mkdir $PROJECT_DIR\n"
    mkdir $PROJECT_DIR
fi

cd $PROJECT_DIR
printf "change directory to $PWD\n"

if  [ -d /usr/local/go ]
then
    printf "/usr/local/go exits"
    wget https://storage.googleapis.com/golang/go$VERSION.$OS-$ARCH.tar.gz
    sudo rm -rf /usr/local/go
    printf "removing /usr/local/go ...\n"

    sudo tar -C /usr/local -xzf go$VERSION.$OS-$ARCH.tar.gz
    printf "golang already re-exists /usr/local/go directory.\n"

else
    printf "OK, /usr/local/go not exits, installing golang to /usr/local/go ...\n"
    wget https://storage.googleapis.com/golang/go$VERSION.$OS-$ARCH.tar.gz
    sudo tar -C /usr/local -xzf go$VERSION.$OS-$ARCH.tar.gz
fi

sudo rm go$VERSION.$OS-$ARCH.tar.gz

if  [ -d $HOME/$GO_WORKSPACE ]
then
    printf "$GO_WORKSPACE directory already exists.\n"
else
    printf "creating go workspace directory..."
    mkdir $HOME/$GO_WORKSPACE
    printf "directory $HOME/$GO_WORKSPACE is created.\n"
fi

if [ -d /usr/local/go ]; then
    grep -v 'GOPATH\|go/bin' $HOME/.profile > $HOME/.profile.new
    cp $HOME/.profile $HOME/.profile.old
    mv $HOME/.profile.new $HOME/.profile

    printf "export PATH=\$PATH:/usr/local/go/bin\n" >> $HOME/.profile
    printf "export GOPATH=\$HOME/$GO_WORKSPACE\n" >> $HOME/.profile
    printf "export PATH=\$PATH:\$GOPATH/bin\n" >> $HOME/.profile
    source $HOME/.profile
fi

cat $HOME/.profile | grep 'GOPATH\|go/bin'

source $HOME/.profile
go version
