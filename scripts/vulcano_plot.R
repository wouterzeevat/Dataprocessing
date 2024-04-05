library("DESeq2")
library("EnhancedVolcano")

args <- commandArgs(trailingOnly = TRUE)

load(args[1])

deseq.volcano <- function(res, datasetName) {
  return(EnhancedVolcano(res, x = 'log2FoldChange', y = 'padj',
                         lab=rownames(res),
                         title = datasetName,
                         subtitle = bquote(italic('FDR <= 0.05 and absolute FC >= 2')),
                         # Change text and icon sizes
                         labSize = 3, pointSize = 1.5, axisLabSize=10, titleLabSize=12,
                         subtitleLabSize=8, captionLabSize=10,
                         # Disable legend
                         legendPosition = "none",
                         # Set cutoffs
                         pCutoff = 0.05, FCcutoff = 2, col=c("#ACDEFF", "#4492FC", "#ACDEFF", "#4492FC")))
}

png(file = args[2],   # The directory you want to save the file in
    width = 800, # The width of the plot in inches
    height = 500) # The height of the plot in inches

deseq.volcano(res = result.1m_control_del, datasetName = "Control vs Del")

dev.off()

png(file = args[3],   # The directory you want to save the file in
    width = 800, # The width of the plot in inches
    height = 500) # The height of the plot in inches

deseq.volcano(res = result.1m_control_dup, datasetName = "Control vs Dup")

dev.off()

png(file = args[4],   # The directory you want to save the file in
    width = 800, # The width of the plot in inches
    height = 500) # The height of the plot in inches

deseq.volcano(res = result.1m_del_dup, datasetName = "Del vs Dup")

dev.off()
