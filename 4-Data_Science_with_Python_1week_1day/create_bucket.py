# create_bucket.py

import os 
from google.cloud import storage

# Creating an Environmental Variable for the service key configuration
os.environ['GOOGLE_APPLICATION_CREDENTIALS'] = 'ServiceKey_GoogleCloud.json'

# Creating a storage client
storage_client = storage.Client()


'''
Create a New Bucket
'''

bucket_name = 'movies_data_bucket'
bucket = storage_client.bucket(bucket_name=bucket_name)
bucket.location = 'US'

bucket = storage_client.create_bucket(bucket)

'''
Print Bucket Details
'''
print(vars(bucket))