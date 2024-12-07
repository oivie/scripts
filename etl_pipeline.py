# Load data from a CSV file, transform it by applying business rules, and save it as a JSON file.
import csv
import json

# Load CSV
transformed_data = []
with open('input.csv', mode='r') as file:
    reader = csv.DictReader(file)
    for row in reader:
        # Transformation logic
        transformed_row = {
            "id": row["id"],
            "name": row["name"].upper(),  # Convert names to uppercase
            "email": row["email"]
        }
        transformed_data.append(transformed_row)

# Save as JSON
with open('output.json', mode='w') as file:
    json.dump(transformed_data, file, indent=2)
