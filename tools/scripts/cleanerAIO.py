import json
from dicttoxml import dicttoxml
from xml.dom.minidom import parseString
""" @Hinamizawa
This module provides utility functions to load, format, and convert JSON data to XML.

It defines file paths for raw and processed JSON, and an XML output file. It includes
functions to load JSON data from a file, format the JSON response with indentation and
sorted keys, write content to a file, and convert JSON data to XML format before writing
it to a file.

The module executes a sequence of loading raw JSON data, formatting it, writing the
formatted JSON to a file, and then converting the JSON to XML and writing the XML to
another file.

Functions:
    load_json_file(file_path): Load JSON data from the given file path.
    format_json_response(response): Format JSON data with indentation and sorted keys.
    write_to_file(file_path, content): Write the given content to the file path.
    json_to_xml(json_file_path, xml_file_path): Convert JSON data to XML and write to a file.
"""
# Function to load JSON data from a file
def load_json_file(file_path):
    try:
        with open(file_path, 'r') as file:
            return json.load(file)
    except Exception as e:
        return f"Error loading JSON file: {e}"

# Function to format JSON response
def format_json_response(response):
    try:
        return json.dumps(response, indent=4, sort_keys=True)
    except TypeError:
        return "Invalid JSON response"

# Function to write content to a file
def write_to_file(file_path, content):
    try:
        with open(file_path, 'w') as file:
            file.write(content)
        return "File written successfully"
    except Exception as e:
        return f"Error writing to file: {e}"

# Function to convert JSON to XML and write to a file
def json_to_xml(json_file_path, xml_file_path):
    try:
        with open(json_file_path, 'r') as json_file:
            json_data = json.load(json_file)

        xml_data = dicttoxml(json_data, custom_root='root', attr_type=False)
        dom = parseString(xml_data)
        pretty_xml_as_string = dom.toprettyxml()

        with open(xml_file_path, 'w') as xml_file:
            xml_file.write(pretty_xml_as_string)
        return "Conversion completed successfully."

    except Exception as e:
        return f"An error occurred in the conversion: {e}"

# Function to process JSON and XML conversion for a given set of files
def process_json_and_xml(json_input_file, json_output_file, xml_output_file):
    response = load_json_file(json_input_file)
    if isinstance(response, str):
        print(response)
    else:
        formatted_response = format_json_response(response)
        result = write_to_file(json_output_file, formatted_response)
        print(result)

        # Convert JSON to XML and write
        result_xml = json_to_xml(json_output_file, xml_output_file)
        print(result_xml)

# File paths for the first JSON/XML pair
raw_send_json_file = 'webApp/debugger/raw.json'
api_send_json_file = 'webApp/debugger/output/api_send.json'
api_send_xml_file = 'webApp/debugger/output/api_send.xml'

# File paths for the second JSON/XML pair
raw_response_json_file = 'webApp/debugger/raw_response.json'
api_response_json_file = 'webApp/debugger/output/api_response.json'
api_response_xml_file = 'webApp/debugger/output/api_response.xml'

# Process the first JSON/XML pair
process_json_and_xml(raw_send_json_file, api_send_json_file, api_send_xml_file)

# Process the second JSON/XML pair
process_json_and_xml(raw_response_json_file, api_response_json_file, api_response_xml_file)
