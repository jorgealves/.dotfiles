#!/bin/bash

# Description of the script.
# Auto adds all my ssh keys into shell

# Kill existing ssh-agent if running
if pgrep -u "$USER" ssh-agent > /dev/null; then
    echo "Killing existing ssh-agent..."
    pkill -u "$USER" ssh-agent
fi

# Start a new ssh-agent
echo "Starting a new ssh-agent..."
eval "$(ssh-agent -s)"

# Dynamically add keys from ~/.ssh directory
echo "Adding keys to ssh-agent..."
for key in ~/.ssh/id_*; do
    if [[ -f "$key" && "$key" != *.pub ]]; then
        echo "Adding $key"
        ssh-add "$key"
    fi
done

# Optional: Test SSH configuration by listing keys
echo "Keys currently loaded in ssh-agent:"
ssh-add -l
