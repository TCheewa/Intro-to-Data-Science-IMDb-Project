# This Project focusing on leveraging IMDb’s datasets to find the relationship between confidence scores that come from average ratings based on the number of user votes, movie runtimes, and average ratings of movies, aiming to fill gaps in understanding influencing factors of audience perception. 

# Instruction to run Project

1. Download three IMDb datasets from : https://developer.imdb.com/non-commercial-datasets/
- title.akas.tsv	
- title.basics.tsv	
- title.ratings.tsv
2. and place them in the `Your Project/` directory.
3. Run the scripts in sequence:
```bash
Rscript preprocessing.R
Rscript correlation_analysis.R
Rscript clustering.R
Rscript linear_regression.R
