#!/bin/bash

# Delete folder
cd ..
echo "Deleting website_folder_rename_me folder..."
rm -r website_folder_rename_me
if [ $? -eq 0 ]; then
  echo "Done!"
else
  echo "Failed to delete website_folder_rename_me folder."
fi
exit
