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
import json
from dicttoxml import dicttoxml
from xml.dom.minidom import parseString
""" @Hinamizawa url:https://github.com/alejandroatacho/Environment-Tools/blob/main/tools/scripts/cleanerAIO.py"""
#____________________________________________________________________________
#Hinamizawa User Variables                                                  |
debugMode = 0 #0 = single file debug, 1 = whole workflow debug cleaner      |
#___________________________________________________________________________|

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

if debugMode == 0:
    singleDebugRaw_file = 'webApp/debugger/singleDebug/singleDebugRaw.json'
    singleDebugResponse_file = 'webApp/debugger/singleDebug/singleDebugResponse.json'
    singleDebugResponse_xml_file = 'webApp/debugger/singleDebug/singleDebugResponse.xml'
    process_json_and_xml(singleDebugRaw_file, singleDebugResponse_file, singleDebugResponse_xml_file)

elif debugMode == 1:
    # File paths and processing for setup send
    raw_send_json_setup_file = 'webApp/debugger/input/raw_send_setup.json'
    api_send_json_setup_file = 'webApp/debugger/output/api_send_setup.json'
    api_send_xml_setup_file = 'webApp/debugger/output/api_send_setup.xml'
    process_json_and_xml(raw_send_json_setup_file, api_send_json_setup_file, api_send_xml_setup_file)

    # File paths and processing for setup response
    raw_response_json_setup_file = 'webApp/debugger/input/raw_setup_response.json'
    api_response_json_setup_file = 'webApp/debugger/output/api_setup_response.json'
    api_response_xml_setup_file = 'webApp/debugger/output/api_setup_response.xml'
    process_json_and_xml(raw_response_json_setup_file, api_response_json_setup_file, api_response_xml_setup_file)

    # File paths and processing for enrollment send
    raw_send_json_enrollment_file = 'webApp/debugger/input/raw_enrollment_send.json'
    api_send_json_enrollment_file = 'webApp/debugger/output/raw_enrollment_send.json'
    api_send_xml_enrollment_file = 'webApp/debugger/output/raw_enrollment_send.xml'
    process_json_and_xml(raw_send_json_enrollment_file, api_send_json_enrollment_file, api_send_xml_enrollment_file)

    # File paths and processing for enrollment response
    raw_response_json_enrollment_file = 'webApp/debugger/input/raw_enrollment_response.json'
    api_response_json_enrollment_file = 'webApp/debugger/output/raw_enrollment_response.json'
    api_response_xml_enrollment_file = 'webApp/debugger/output/raw_enrollment_response.xml'
    process_json_and_xml(raw_response_json_enrollment_file, api_response_json_enrollment_file, api_response_xml_enrollment_file)

    # File paths and processing for auth send
    raw_send_json_auth_file = 'webApp/debugger/input/raw_auth_send.json'
    api_send_json_auth_file = 'webApp/debugger/output/api_auth_send.json'
    api_send_xml_auth_file = 'webApp/debugger/output/api_auth_send.xml'
    process_json_and_xml(raw_send_json_auth_file, api_send_json_auth_file, api_send_xml_auth_file)

    # File paths and processing for auth response
    raw_response_json_auth_file = 'webApp/debugger/input/raw_auth_response.json'
    api_response_json_auth_file = 'webApp/debugger/output/api_auth_response.json'
    api_response_xml_auth_file = 'webApp/debugger/output/api_auth_response.xml'
    process_json_and_xml(raw_response_json_auth_file, api_response_json_auth_file, api_response_xml_auth_file)