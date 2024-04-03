library('PoiClaClu')
library('DESeq2')

args <- commandArgs(trailingOnly = TRUE)
load(args[1])

png(file = args[2],   # The directory you want to save the file in
    width = 800, # The width of the plot in inches
    height = 500) # The height of the plot in inches

# Note: uses the raw-count data, PoissonDistance performs normalization
# set by the 'type' parameter (uses DESeq)
(ddsMat <- DESeqDataSetFromMatrix(countData = counts,
                                  colData = data.frame(samples = names(counts)),
                                  design = ~ 1))
dds <- assay(ddsMat)
poisd <- PoissonDistance( t(dds), type = "deseq")
# Extract the matrix with distances
samplePoisDistMatrix <- as.matrix(poisd$dd)
# Calculate the MDS and get the X- and Y-coordinates
mdsPoisData <- data.frame( cmdscale(samplePoisDistMatrix) )

# And set some better readable names for the columns
names(mdsPoisData) <- c('x_coord', 'y_coord')


# Separate the annotation factor (as the variable name is used as label)
groups <- factor(rep(1:9, each=12),
                 labels = c("IPSC_CONTROL", "IPSC_DEL", "IPSC_DUP", "1M_CONTROL", "1M_DEL", "1M_DUP", "3M_CONTROL", "3M_DEL", "3M_DUP"))
coldata <- names(counts)

# Create the plot using ggplot
library(ggplot2)
ggplot(mdsPoisData, aes(x_coord, y_coord, color = groups, label = coldata)) +
  geom_text(size = 4) +
  ggtitle('Multi Dimensional Scaling') +
  labs(x = "Poisson Distance", y = "Poisson Distance") +
  theme_bw()

dev.off()