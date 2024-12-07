# Fetch data from a REST API and save the results into a CSV file.
import requests
import csv

# API URL
api_url = "https://api.example.com/data"

# Fetch data
response = requests.get(api_url)
data = response.json()

# Save data to CSV
with open('data.csv', mode='w', newline='') as file:
    writer = csv.writer(file)
    writer.writerow(data[0].keys())  # Write header
    for item in data:
        writer.writerow(item.values())
