#!/bin/sh

set -e

sudo yum install -y tmux docker \
    /etc/init.d/docker start \
    chkconfig docker on

