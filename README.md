# L1-norm Graph
A novel semi-supervised method for miRNA-disease association prediction based on L1-norm graph

**Method Description**:  
We proposed a novel semi-supervised model to predict miRNA-disease associations via l_1-norm graph. Specifically, we recalculated the miRNA functional similarities as well as the disease semantic similarities based on the latest version of MeSH descriptors and HMDD. We then updated the similarity matrices and association matrix iteratively in both miRNA space and disease space. The optimized association matrices from each space were combined together as the final output.

**Method Requirements**:  
As our method was developed in R, we require users to have R-3.4.2 (or higher) installed on their operating systems. Users can also install the R package "parallel" to run our script in parallel on Linux/Unix/MacOS.

**Usage**:  
To run our method, simply open the "run_prediction.R" script in R programming environment or other R IDE tools (e.g. RStudio) and press "Run" button. Another option is to run our script using the command line format: Rscript run_prediction.R. Please make sure that both the input data "miR_disease.RData" as well as the R script "L1_graph.R" are under the same directory as that of "run_prediction.R". The output prediciton files will also be under this directory. Besides, please change the working directory to your own local directory by setting the "root" variable in the "run_prediciton.R" script properly. 

The format of the output file will be something like:  
miRNA disease	score  
hsa-mir-155	Colorectal Neopalsms	0.047717174  
hsa-mir-146a	Colorectal Neopalsms	0.042424729  
hsa-mir-221	Colorectal Neopalsms	0.040243107  
hsa-mir-16-1	Colorectal Neopalsms	0.040058726  
hsa-mir-19a	Colorectal Neopalsms	0.037830119  
hsa-mir-19b-1	Colorectal Neopalsms	0.036203632  
hsa-let-7a-3	Colorectal Neopalsms	0.036152471  
......

**Contact**:   
For any questions regarding our work, please feel free to contact us: alcs417@sdnu.edu.cn. 
