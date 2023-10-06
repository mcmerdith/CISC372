#!/bin/bash

USERNAME=merematt
HOSTNAME=cisc372.cis.udel.edu
REMOTE_DIR=remote_runner

echo "Updating remote filesystem"
rsync -avuzh --exclude "*.out" * "$USERNAME@$HOSTNAME:~/$REMOTE_DIR/."

echo "Executing remote command '$*'"
ssh "$USERNAME@$HOSTNAME" "mkdir -p $REMOTE_DIR; cd $REMOTE_DIR; $*"

