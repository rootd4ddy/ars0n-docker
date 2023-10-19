#!/bin/sh

# Set environment variables
export SLACK_TOKEN=""
export GITHUB_PAT=""
export SHODAN_API_KEY=""

# Run the non-interactive script
python install.py

# Start the web application (you can customize this as needed)
./run.sh
