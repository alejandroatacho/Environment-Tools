#!/bin/bash

# Move to the parent directory
cd ./

# Greeting message
echo "Hello Cutie _(:3」∠)_ , $(whoami), $(hostname)"
echo "Deleting my SASS compiler mistakes!"
sleep 1

# Find and delete all CSS and .map files except styles.css, user_custom_rules_main.css, and their respective .map files
find . -type f \( -iname "*.css" -o -iname "*.map" \) ! \( -iname "styles.css" -o -iname "user_custom_rules_main.css" -o -iname "user_custom_rules_main.css.map" -o -iname "styles.css.map" \) -exec rm -f {} +

if [ $? -eq 0 ]; then
  echo "Done!, all your compiler mistakes have been deleted."
  sleep 1
  echo "Closing Terminal!"
  sleep 1
else
  echo "Failed to delete files or missing files exist."
  sleep 1
fi

# Exit script
exit
