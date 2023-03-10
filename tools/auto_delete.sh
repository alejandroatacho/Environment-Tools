#!/bin/bash

# Delete folder
cd ..
echo "Deleting folders..."
sleep 1
rm -rf website_folder_rename_me odoo_module_rename_me 2> /dev/null
if [ $? -eq 0 ]; then
  echo "Done!"
else
  echo "Failed to delete folders or missing folders exist."
fi
exit
