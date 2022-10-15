#!/usr/local/bin/Rscript

#  convert orthogroups.tsv output from orthofinder into presence/absence matrix
args <- commandArgs(trailingOnly = TRUE)

ortholog<-read.table(args[1], sep="\t", header=TRUE, fill=TRUE)

for (i in 1:nrow(ortholog)){
  for (j in 2:ncol(ortholog)){
    mylist<-strsplit(ortholog[i,j], ",")
    #print(length(mylist[[1]]))
    if (length(mylist[[1]])>=1){
      ortholog[i,j] <- "1"
    }
    else{
      ortholog[i,j] <-"0"
    }  
  }
}

write.table(ortholog, "ortholog.txt", row.names = FALSE)

# To subset the matrix
#apply(ortholog, 2, function(ortholog) any(ortholog==1))
#any(ortholog>0)

