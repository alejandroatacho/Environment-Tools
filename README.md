# Table Of Index

- [How to use](#how-to-use)
  - [Place the folder in your project](#1-place-the-folder-in-your-project)
  - [Run the main script](#2-run-the-main-script)
  - [Choose a script to run](#3-choose-a-script-to-run)
  - [Wait for the script to complete](#4-wait-for-the-script-to-complete)
  - [Review the results](#5-review-the-results)
- [Optional](#optional)
- [Features](#features)
- [To-Do List](#to-do-list)

# How to use

Follow these steps to set up and use the programming environment:

### 1. Place the folder in your project

Drop the entire folder containing the shell scripts and Python scripts into your project folder, along with the `.gitignore` file (make sure to read the `.gitignore`).

### 2. Run the main script

Open your terminal, cmd, or gitbash, navigate to the folder containing the scripts, and then either type `open run.sh` or `./run.sh` and press Enter.

### 3. Choose a script to run

The UI will display a list of available scripts. Each script has a number associated with it. Enter the number corresponding to the script you want to execute, and press Enter.

### 4. Wait for the script to complete

Depending on your choice, the corresponding shell script or Python script is executed. Wait for the script to finish its task.

### 5. Review the results

Check the output of the script and ensure that it completed successfully. If necessary, review any generated files or make adjustments to the script and rerun it.

Remember that you can always run `run.sh` again to choose a different script or run the same script with different options.

# Optional

`pip install -r requirements.txt`
<br/>
To install the libraries if you want to use the Python scripts as well (in your terminal, if you have Python on your system).

## Features

- Builds a website template.
- Automatically deletes specified files or directories made by these scripts.
- Sets up an Odoo project template.
- Deletes all Sass file output (CSS) in a directory except for styles.css (you can customize it as needed).
- Counts the number of lines of code in a directory.
- Searches for specified text in XML files.
- Visualizes the structure of an XML file (Tree Viewer).

### To-Do List

- [ ] Make the code_counter not count the tools folder.
- [ ] Add more languages & options.
- [ ] Add more frameworks with pre-built templates.
- [ ] Add delete tool folder after project completion if too many shell scripts are created in the future.

![alt text](/img_for_github/Akko_Kagari_Classic_Shell_Scripting.jpg)
