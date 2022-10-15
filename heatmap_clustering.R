# Clustering on jaccard distance and plotting heatmap showing presence absence 

#library("pheatmap")

# Demo 
# Create test data
#x <- c(0, 0, 1, 1, 1, 1)
#y <- c(1, 0, 1, 1, 0, 1)
#z <- c(0, 1, 0, 1, 0, 0)
#a <- c(1, 1, 1, 0, 0, 1)
#mat<-(as.matrix(rbind(x, y,z,a)))
#distmat<-dist(mat, method = "binary")
#clust.res<-hclust(distmat,method="average") 
#tiff("example-plot.tiff", width = 4, height = 4, units= "in", res= 450)
#heatmap(mat, scale="none",  Colv = NA, Rowv = as.dendrogram(clust.res),hclustfun = hclust, main="gene content", labCol = "")
#dev.off()

# Using output from orthofinder and presence_absence.R
ortholog<-read.table("ortholog.txt", header=TRUE)
mat<-apply(ortholog[,2:9], 1:2, FUN=as.numeric)
tmat<-t(mat)
distmat<-dist(tmat, method = "binary")
clust.res<-hclust(distmat,method="average") 
tiff("presence_absence.tiff", width = 4, height = 4, units= "in", res= 450)
heatmap(tmat, scale="none",  Colv = NA, Rowv = as.dendrogram(clust.res),hclustfun = hclust, main="Presence absence genes", labCol = "")
dev.off()




