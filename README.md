# Intro-to-Data-Science-IMDb-Project

1. Clone the repository:  https://github.com/TCheewa/Intro-to-Data-Science-IMDb-Project.git
2. Download three IMDb datasets from : https://developer.imdb.com/non-commercial-datasets/
- title.akas.tsv	
- title.basics.tsv	
- title.ratings.tsv
3. and place them in the `data/` directory.
4. Run the scripts in sequence:
```bash
Rscript src/preprocessing.R
Rscript src/correlation_analysis.R
Rscript src/clustering.R
Rscript src/linear_regression.R
