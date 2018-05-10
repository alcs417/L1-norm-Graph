rm(list=ls(all=T))

library(parallel)

root <- "D:/RProjects/disease_miRNAs"

setwd(root)

source("L1_graph.R")

inputData <- "miR_disease.RData"

load(inputData)

miR_sim_matrix <- as.matrix(miR_sim_matrix)
disease_sim_matrix <- as.matrix(disease_sim_matrix)

con_condition <- 1e-6
factor <- 0.5

miR_info <- LP_norm1(miR_sim_matrix, miR_disease_matrix, con_condition)
disease_info <- LP_norm1(disease_sim_matrix, t(miR_disease_matrix), con_condition)
finalQ <- miR_info$Q * factor + t(disease_info$Q) * (1 - factor)

predRes <- lapply(1:ncol(miR_disease_matrix), function(curCol){

	disease_name <- colnames(miR_disease_matrix)[curCol]

	negativeIndices <- which(miR_disease_matrix[,curCol,drop=T]==0)
		
	curRes <- data.frame(miRNA=row.names(miR_disease_matrix)[negativeIndices], disease=disease_name, 
							score=finalQ[negativeIndices,curCol,drop=T], stringsAsFactors=F)
							
	curRes <- curRes[order(curRes$score, decreasing=T),]
	
	outFile <- sprintf("%s_predition_results.txt", disease_name)
	
	write.table(curRes, file=outFile, quote=F, sep="\t", row.names=F, col.names=F)
	
})













