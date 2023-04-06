#!/bin/bash
# Path: run.sh
printf "Hello, %s <3, %s\nDate: %s\nCurrent Dir: %s\nOS: %s\n" "$(whoami)" "$(hostname)" "$(date)" "$(pwd)" "$(uname -s)"
printf "=============================================\n"
printf "    Welcome to My Personal Scripts\n"
printf "=============================================\n"

printf "Please ensure you have installed the required packages with (optional):\n"
printf "\033[1;36m%s\033[0m\n\n" "pip install -r requirements.txt"
sleep 1
printf "\033[1;33m%s\033[0m\n" "============================================="
printf "\033[1;33m%-25s %s\033[0m\n" "UI: Pick a number"
printf "\033[1;33m%s\033[0m\n" "============================================="


SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"

sh_files=(
  "tools/websites/website_builder.sh"
  "tools/scripts/auto_delete.sh"
  "tools/odoo/odoo_template.sh"
  "tools/scripts/delete_sass_mistakes.sh"
  "tools/scripts/code_counter.sh"
  "tools/scripts/structure_folder.sh"
)

py_files=(
  "tools/scripts/hunt_my_xml_path.py"
  "tools/scripts/tree_viewer_xml.py"
)

options=("${sh_files[@]}" "${py_files[@]}" "Quit")

PS3='Please pick a script number to run: '
select opt in "${options[@]}"
do
    if [ "$opt" = "Quit" ]; then
        break
    fi

    if [[ " ${sh_files[*]} " == *" ${opt} "* ]]; then
        "${SCRIPT_DIR}/${opt}"
        status=$?
    elif [[ " ${py_files[*]} " == *" ${opt} "* ]]; then
        python3 "${SCRIPT_DIR}/${opt}"
        status=$?
    else
        echo "Invalid option."
        continue
    fi

    if [ $status -eq 0 ]; then
        echo "${opt} completed successfully."
    else
        echo "${opt} failed."
    fi
done
