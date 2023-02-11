#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title update dotfiles
# @raycast.mode compact

# Optional parameters:
# @raycast.icon 🤖
# @raycast.argument1 { "type": "text", "placeholder": "commit message" }

# Documentation:
# @raycast.author Matthieu

cd ~/dotfiles
git add .
git commit -m "$1"
git push

