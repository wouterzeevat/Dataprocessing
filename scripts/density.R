library(affy)
library(scales)

args <- commandArgs(trailingOnly = TRUE)
load(args[1])

png(file = args[2],   # The directory you want to save the file in
    width = 800, # The width of the plot in inches
    height = 500) # The height of the plot in inches

#myColors <- hue_pal()(3)
myColors <- hue_pal()(3)
## Plot the log2-transformed data with a 0.1 pseudocount
plotDensity(log2(counts + 0.1), col=rep(myColors, each=12),
            lty=c(1:ncol(counts)), xlab='Log2(count)',
            main='Expression Distribution')

## Add a legend and vertical line
abline(v=-1.5, lwd=1, col='red', lty=2)

dev.off()