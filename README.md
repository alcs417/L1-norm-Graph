# L1-norm-Graph
A novel semi-supervised method for miRNA-disease association prediction

Method Description:
We proposed a novel semi-supervised model to predict miRNA-disease associations via l_1-norm graph. Specifically, we recalculated the miRNA functional similarities as well as the disease semantic similarities based on the latest version of MeSH descriptors and HMDD. We then updated the similarity matrices and association matrix iteratively in both miRNA space and disease space. The optimized association matrices from each space were combined together as the final output.

Method Requirements:
As our method was developed in R, we require users to have R-3.4.2 (or higher) installed on their operating systems. Users can also install the R package "parallel" to run our script in parallel on Linux/Unix/MacOS.

Usage:
We have provided all the datasets used in our paper under the "datasets/" folder. 
To run our method, simply open the "main_process.R" script in R programming environment or other R IDE tools and press "Run" button. Another option is to run our script using the command line format: Rscript main_process.R.
