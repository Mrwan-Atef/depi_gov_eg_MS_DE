import pandas as pd
from os import read
import numpy as np

# Create a DatFrame for Movie Ratings
ratings = pd.read_csv('ml-100k/u.data', delimiter='\t', header=None, names=['user_id','item_id', 'rating' ,'timestamp'])


# Create a DataFrame for Movie Names
with open('ml-100k/u.item', 'r', encoding="ISO-8859-1") as read_file:
    
    counter = 0
    movies_df = pd.DataFrame(columns=['item_id', 'movie_name', 'release_timestamp'])

    # Iterate thorugh the lines in the file
    for line in read_file:

        # From each line extract the first three values
        fields = line.split('|')
        item_id, movie_name, release_timestamp = fields[0], fields[1], fields[2]
        movie_name = movie_name[0:len(movie_name) - len(' (1234)')]

        # Aggerate line data
        line_data = [int(item_id), str(movie_name), release_timestamp]

        # Create a temp dataframe and append it to movies_df
        temp_df = pd.DataFrame(data=[line_data], columns=['item_id', 'movie_name', 'release_timestamp'])
        movies_df = pd.concat([temp_df, movies_df], ignore_index=True)

        counter += 1

    # Sort Values by item id
    movies_df.sort_values(by='item_id', ascending=True, inplace=True)

# Close file
read_file.close()

# Export to CSV
ratings.to_csv('ratings.csv', index=False)
movies_df.to_csv('movies.csv', index=False)