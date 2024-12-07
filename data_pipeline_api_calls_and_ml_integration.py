# Fetch large datasets from a REST API in batches, transform the data by applying business rules, and train a machine learning model using the transformed data.
# Save the model and the transformed dataset for deployment.

import requests
import pandas as pd
from sklearn.model_selection import train_test_split
from sklearn.ensemble import RandomForestClassifier
import joblib

# Constants
API_URL = "https://api.example.com/data"
BATCH_SIZE = 1000
MODEL_OUTPUT_PATH = "model.pkl"
DATA_OUTPUT_PATH = "transformed_data.csv"

# Function to fetch data from API in batches
def fetch_data(api_url, batch_size):
    all_data = []
    offset = 0
    while True:
        response = requests.get(f"{api_url}?limit={batch_size}&offset={offset}")
        if response.status_code != 200:
            print(f"Failed to fetch data: {response.status_code}")
            break
        
        batch = response.json()
        if not batch:  # No more data
            break
        
        all_data.extend(batch)
        offset += batch_size
        print(f"Fetched {len(all_data)} records so far...")
    return pd.DataFrame(all_data)

# Function to clean and transform data
def transform_data(df):
    # Drop columns with more than 50% missing data
    df = df.dropna(thresh=len(df) * 0.5, axis=1)

    # Fill missing numerical values with the median
    for col in df.select_dtypes(include=['float64', 'int64']).columns:
        df[col].fillna(df[col].median(), inplace=True)

    # Transform categorical columns to dummy variables
    df = pd.get_dummies(df, drop_first=True)
    
    return df

# Function to train an ML model
def train_model(df):
    # Split data
    X = df.drop("target", axis=1)  # Replace 'target' with the actual column name
    y = df["target"]
    X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2, random_state=42)

    # Train model
    model = RandomForestClassifier(n_estimators=100, random_state=42)
    model.fit(X_train, y_train)
    
    # Evaluate model
    accuracy = model.score(X_test, y_test)
    print(f"Model Accuracy: {accuracy:.2f}")
    
    return model

# Main script
if __name__ == "__main__":
    # Step 1: Fetch data
    print("Fetching data from API...")
    raw_data = fetch_data(API_URL, BATCH_SIZE)

    # Step 2: Transform data
    print("Transforming data...")
    transformed_data = transform_data(raw_data)

    # Step 3: Save transformed data
    print("Saving transformed data...")
    transformed_data.to_csv(DATA_OUTPUT_PATH, index=False)

    # Step 4: Train and save ML model
    print("Training ML model...")
    model = train_model(transformed_data)

    print("Saving ML model...")
    joblib.dump(model, MODEL_OUTPUT_PATH)
    print("Pipeline completed successfully!")
