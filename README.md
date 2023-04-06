# How to use

Just open run.sh or use ./run.sh in terminal and pick a number in the UI
When you run `run.sh`, it prompts you to select an option from the UI. Depending on the option you choose, the corresponding shell script or Python script is executed.
<p>pip install -r requirements.txt
<br/>
 To install the libraries if you want to use the python scripts too.
</p>
## Features

Use this shell script to setup your programming environment.

Drop this shell file and folder inside of your folder and run it.
The `sh_files` and `py_files` arrays contain the paths to various shell script and Python script files that are included in this project. The files are:

- Builds a website template
- Deletes specified files or directories automatically
- Sets up an Odoo project template
- Deletes all Sass files output (CSS) in a directory except for styles.css (You can edit it for your preference)
- Counts the number of lines of code in all directory
- Searches for specified text in XML files
- Visualizes the structure of an XML file (Tree Viewer)

### Example

If you run run.sh you will get a UI asking you if you're going to build a website or other options.
Pick your option and watch it set up a template so you can instantly start working.

### To-Do List

- [ ] Add more options
- [ ] Add more languages
- [ ] Add more frameworks
- [ ] Add delete tool folder after completion if too many shell scripts are made in the future.
- [ ] Add more features
