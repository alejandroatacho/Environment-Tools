#!/bin/bash
# Path: run.sh
echo "Hello <3"
sleep 1
echo "
ℊ☈ℇℊ
┊┊┊┊╭━━╮╭━━╮┊╭━┓
┈╭━━┫▔╲┣╯━━┻╮┃╭┛♫
╭┫┈┈┃┈┈▏┊▋┊▋┃┃┃
┃┃┈┈┃┈╱╭╰╯╰╯╰┫┣━╮
╯┃┈┈╰━━╯╰━━━┳┫┣╮┃
┈┃╭┳╭━┫╭┳╭━━╯┃┃┃┃
┈┃┃┃┃┈┃┃┃┃┈╭╮┃╰╯┃
┈┗┛┗┛┈┗┛┗┛╭╮┈╰━━╯
"

PS3='Please pick your environment builder: '
options=("Website Builder" "Odoo Builder" "Delete Folder" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Website Builder")
            cd tools
            ./website_builder.sh
            if [ $? -eq 0 ]; then
                echo "Website builder completed successfully."
            else
                echo "Website builder failed."
            fi
            ;;
        "Delete Folder")
            cd tools
            ./auto_delete.sh
            if [ $? -eq 0 ]; then
                echo "Folders deleted successfully."
            else
                echo "Failed to delete folders."
            fi
            ;;
        "Odoo Builder")
            cd tools
            ./odoo_run.sh
            if [ $? -eq 0 ]; then
                echo "Odoo builder completed successfully."
            else
                echo "Odoo builder failed."
            fi
            ;;
        "Quit")
            break
            ;;
        *) echo "Invalid option.";;
    esac
done
