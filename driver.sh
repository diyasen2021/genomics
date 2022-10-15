#!/bin/bash

# This workflow will produce a heatmap and a cluster analysis from a binary matrix containing gene presence absence data

# Step1: Call presence_absence.R to convert orthogroups.tsv output from orthofinder into presence/absence matrix. 
# $1 should be orthogroups.tsv from orthofinder. Output is orthologs.txt
Rscript presence_absence.R $1

# Step2: Create heatmap and clustered dendrogram. Will take orthologs.txt and produce presence_absence.tiff image
Rscript heatmap_clustering.R 
