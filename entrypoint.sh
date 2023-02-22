#!/bin/sh -l

echo "Hello $1"
time=$(date)
echo "time=$time" >> $GITHUB_OUTPUT
gh version
echo "The repository name is $GITHUB_REPOSITORY"
