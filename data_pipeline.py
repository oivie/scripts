# Process a batch of files, convert them, and handle missing data.
import os
import pandas as pd

input_dir = 'data/'
output_dir = 'processed/'

for file_name in os.listdir(input_dir):
    if file_name.endswith('.csv'):
        try:
            df = pd.read_csv(os.path.join(input_dir, file_name))
            df.fillna("N/A", inplace=True)  # Handle missing values
            df.to_json(os.path.join(output_dir, file_name.replace('.csv', '.json')), orient='records')
        except Exception as e:
            print(f"Failed to process {file_name}: {e}")
