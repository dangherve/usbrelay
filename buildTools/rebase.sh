#!/bin/bash
set -e
git remote add upstream https://github.com/darrylb123/usbrelay.git
git fetch upstream
git rebase upstream/master
git remote set-url origin git@github.com:dangherve/usbrelay.git
git push --force --set-upstream origin master
git branch --all | grep origin | cut -d '/' -f 3- | while IFS= read -r branchOrigin; do
    git branch --all | grep upstream | cut -d '/' -f 3- | while IFS= read -r branchUpstream; do
        if [ "$branchOrigin" = "$branchUpstream" ]; then
            git checkout -B $branchOrigin origin/$branchOrigin
            git rebase upstream/$branchOrigin
            git push --force
            break
        fi
    done
done
