library(pander)
library(scales)

args <- commandArgs(trailingOnly = TRUE)
dds <- readRDS(args[1])

png(file = args[2],   # The directory you want to save the file in
    width = 800, # The width of the plot in inches
    height = 500) # The height of the plot in inches

myColors <- hue_pal()(3)
boxplot(log2(counts + 1), outline=FALSE, las=2, col=rep(myColors, each=12), main='Boxplots of all data')

dev.off()