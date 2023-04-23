#!/usr/bin/osascript

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Go to Mail
# @raycast.mode silent

# Optional parameters:
# @raycast.icon 🤖

# Documentation:
# @raycast.description Go to the Mail tab in Arc browser
# @raycast.author Matthieu

tell application "System Events"
    set frontmost of process "Arc" to true
end tell

tell application "Arc" to activate

delay 0.5

tell application "System Events"
    tell process "Arc"
        keystroke "é" using {command down}
    end tell
end tell



