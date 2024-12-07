# Transform XML data into JSON while mapping fields from one schema to another.
import xml.etree.ElementTree as ET
import json

# Load XML data
xml_data = """<user><id>123</id><name>John Doe</name><email>john.doe@example.com</email></user>"""
root = ET.fromstring(xml_data)

# Map XML fields to JSON keys
mapping = {
    "id": "user_id",
    "name": "full_name",
    "email": "contact_email"
}

# Convert XML to dictionary with mapped keys
json_data = {
    mapping[child.tag]: child.text for child in root if child.tag in mapping
}

# Output JSON
print(json.dumps(json_data, indent=2))
