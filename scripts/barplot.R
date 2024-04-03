library(scales)

args <- commandArgs(trailingOnly = TRUE)
load(args[1])

png(file = args[2],   # The directory you want to save the file in
    width = 800, # The width of the plot in inches
    height = 500) # The height of the plot in inches

myColors <- hue_pal()(3)
barplot(colSums(counts) / 1e6, col=rep(myColors, each=12), las=2, main='Read counts', ylab='sequence depth')
abline(h = mean(colSums(counts) / 1e6), col = "Black", lty = 5)

dev.off()