#!/bin/bash

# Get last commit on main branch
LAST_COMMIT=$(git log -1 --format="%H" origin/main)
echo $LAST_COMMIT

# Revert the last commit
git revert $LAST_COMMIT --no-edit