#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title update dotfiles
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🤖

# Documentation:
# @raycast.author Matthieu

cd ~/dotfiles
git add .
git commit -m "update dotfiles"
git push

