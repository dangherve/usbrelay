#!/bin/bash
set -e
git remote add upstream https://github.com/darrylb123/usbrelay.git
git fetch upstream
git rebase upstream/master
git remote set-url origin git@github.com:dangherve/usbrelay.git
git push --force --set-upstream origin master
