# load_data.py
import os 
from google.cloud import storage

# Creating an Environmental Variable for the service key configuration
os.environ['GOOGLE_APPLICATION_CREDENTIALS'] = 'ServiceKey_GoogleCloud.json'

# Creating a storage client
storage_client = storage.Client()

'''
Upload Files
'''
def upload_to_bucket(blob_name, file_path, bucket_name):
    try:

        # Access bucket
        bucket = storage_client.get_bucket(bucket_name)

        # Create a blob from the bucket
        blob = bucket.blob(blob_name=blob_name)

        # Upload file
        blob.upload_from_filename(file_path)
        return True

    except Exception as e:
        print(e)
        return False


# Specify the path to the CSV files
movies_path = 'movies.csv'
ratings_path = 'ratings.csv'

# Upload CSV files to Bucket
upload_to_bucket(blob_name='first_project/movies', file_path=movies_path, bucket_name='movies_data_bucket')
upload_to_bucket(blob_name='first_project/ratings', file_path=ratings_path, bucket_name='movies_data_bucket')
