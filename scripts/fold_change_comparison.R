library("DESeq2")

args <- commandArgs(trailingOnly = TRUE)

load(args[1])

png(file = args[2],   # The directory you want to save the file in
    width = 800, # The width of the plot in inches
    height = 500) # The height of the plot in inches

DESeq2::plotMA(result.1m_control_del, main="Fold change 1 month control vs delete")

dev.off()

png(file = args[3],   # The directory you want to save the file in
    width = 800, # The width of the plot in inches
    height = 500) # The height of the plot in inches

DESeq2::plotMA(result.1m_control_dup, main="Fold change 1 month control vs duplicate")

dev.off()

png(file = args[4],   # The directory you want to save the file in
    width = 800, # The width of the plot in inches
    height = 500) # The height of the plot in inches

DESeq2::plotMA(result.1m_del_dup, main="Fold change 1 month delete vs duplicate")

dev.off()