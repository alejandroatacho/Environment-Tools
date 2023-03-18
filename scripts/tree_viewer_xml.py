import xml.etree.ElementTree as ET
import os
import tkinter as tk
from tkinter import filedialog


def traverse_tree(node, level=0):
    indent = '  ' * level
    print(f"{indent}\033[1m{node.tag}\033[0m")

    if node.attrib:
        for name, value in node.attrib.items():
            print(f"{indent}  \033[33m@{name}:\033[0m {value}")

    if node.text:
        print(f"{indent}  {node.text.strip()}")

    for child in node:
        traverse_tree(child, level + 1)


# Ask the user to select an XML file
root = tk.Tk()
root.withdraw()  # Hide the main window
file_path = filedialog.askopenfilename(title="Select an XML file")

# Python code space


def run():
    tree = ET.parse(file_path)
    root = tree.getroot()  # root is the root element of the XML file

    print(root.tag, root.attrib, "root/parent has been found")
    print(f"\nPython code space has initiated successfully!\n")

    traverse_tree(root)

    ET.dump(tree)


# Run all the functions
if __name__ == '__main__':
    run()
    # This can be removed if running in a terminal
    input("Press any key to exit...")
