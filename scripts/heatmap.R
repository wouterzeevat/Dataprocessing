library(pheatmap)
library(DESeq2)

args <- commandArgs(trailingOnly = TRUE)
load(args[1])

png(file = args[2],   # The directory you want to save the file in
    width = 800, # The width of the plot in inches
    height = 500) # The height of the plot in inches

(ddsMat <- DESeqDataSetFromMatrix(countData = counts,
                                  colData = data.frame(samples = names(counts)),
                                  design = ~ 1))

rld.dds <- vst(ddsMat)
# 'Extract' normalized values
rld <- assay(rld.dds)
sampledists <- dist( t( rld ))

# Convert the 'dist' object into a matrix for creating a heatmap
sampleDistMatrix <- as.matrix(sampledists)

# The annotation is an extra layer that will be plotted above the heatmap columns
annotation <- data.frame(Time = factor(rep(1:3, each = 36),
                                          labels = c("IPSC", "1M", "3M")),
                         Type = factor(rep(rep(1:3, each = 12), 3),
                                          labels = c("Control", "Del", "Dup")))

# Set the rownames of the annotation dataframe  to the sample names (required)
rownames(annotation) <- names(counts)

pheatmap(sampleDistMatrix, show_colnames = FALSE,
         annotation_col = annotation,
         clustering_distance_rows = sampledists,
         clustering_distance_cols = sampledists,
         main = "Euclidean Sample Distances")

dev.off()