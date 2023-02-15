#!/bin/bash

# Replace YOUR_BOT_TOKEN with your Telegram bot token
BOT_TOKEN="YOUR_BOT_TOKEN"

# Replace YOUR_MESSAGE with the message you want to send
MESSAGE="YOUR_MESSAGE"

# Read the list of user IDs from a file
USER_IDS_FILE="user_ids.txt"

# Loop through the user IDs and send the message to each user
while read USER_ID; do
  curl -s -X POST https://api.telegram.org/bot${BOT_TOKEN}/sendMessage \
    -d chat_id=${USER_ID} \
    -d text="${MESSAGE}" \
    -d parse_mode="Markdown"
done < "${USER_IDS_FILE}"
