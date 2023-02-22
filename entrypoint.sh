#!/bin/sh -l

echo "Hello $1"
time=$(date)
echo "time=$time" >> $GITHUB_OUTPUT
gh version
echo "The repository name is $GITHUB_REPOSITORY"



export GH_HOST=GitHub.com

export GH_ENTERPRISE_TOKEN=$GITHUB_TOKEN

gh auth login

gh api \
-H "Accept: application/vnd.github+json" \
/repos/$GITHUB_REPOSITORY/actions/variables