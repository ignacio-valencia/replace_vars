#!/bin/sh -l

echo "Hello $1"
time=$(date)
echo "time=$time" >> $GITHUB_OUTPUT
gh version
echo "The repository name is $GITHUB_REPOSITORY"



export GH_HOST=GitHub.com

gh auth login --with-token $GITHUB_TOKEN

gh api \
-H "Accept: application/vnd.github+json" \
/repos/$GITHUB_REPOSITORY/actions/variables