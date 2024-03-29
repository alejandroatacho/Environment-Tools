#!/bin/bash
# Path: run.sh
echo "Hello, $(whoami) <3, $(hostname)"
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
options=("Website Builder" "Odoo Folder Builder" "Delete Folder" "Follow Me" "Quit")
select opt in "${options[@]}"
do
    case $opt in
        "Website Builder")
            cd tools/websites
            ./website_builder.sh
            if [ $? -eq 0 ]; then
                echo "Website builder completed successfully."
            else
                echo "Website builder failed."
            fi
            ;;
        "Delete Folder")
            cd tools/scripts
            ./auto_delete.sh
            if [ $? -eq 0 ]; then
                echo "Folders deleted successfully."
            else
                echo "Failed to delete folders."
            fi
            ;;
        "Odoo Folder Builder")
            PS3='Please pick your Odoo version: '
            options=("Odoo v14" "Odoo v16")
            select odoo_version in "${options[@]}"
            do
                case $odoo_version in
                    "Odoo v14")
                        cd tools/odoo
                        ./odoo_v14.sh
                        if [ $? -eq 0 ]; then
                            echo "Odoo v14 folder builder completed successfully."
                        else
                            echo "Odoo v14 folder builder failed."
                        fi
                        break
                        ;;
                    "Odoo v16")
                        cd tools/odoo
                        ./odoo_template.sh
                        if [ $? -eq 0 ]; then
                            echo "Odoo v16 folder builder completed successfully."
                        else
                            echo "Odoo v16 folder builder failed."
                        fi
                        break
                        ;;
                    *) echo "Invalid option.";;
                esac
            done
            ;;
             "Follow Me")
            cd tools/scripts
            ./support_me.sh
            if [ $? -eq 0 ]; then
                echo "Thanks!"
            else
                echo "I failed you!."
            fi
            ;;
        "Quit")
            break
            ;;
        *) echo "Invalid option.";;
    esac
done
