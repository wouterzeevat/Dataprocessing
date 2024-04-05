library("DESeq2")
library("gplots")
library("VennDiagram")
library("ggvenn")

args <- commandArgs(trailingOnly = TRUE)

load(args[1])

png(file = args[2],   # The directory you want to save the file in
    width = 800, # The width of the plot in inches
    height = 500) # The height of the plot in inches

pval_threshold <- 0.05
one.m.cde <- row.names(result.1m_control_del[which(result.1m_control_del$padj <= pval_threshold), ])
one.m.cdu <- row.names(result.1m_control_dup[which(result.1m_control_dup$padj <= pval_threshold), ])
one.m.dedu <- row.names(result.1m_del_dup[which(result.1m_del_dup$padj <= pval_threshold), ])
ggvenn(list("Control Del"=one.m.cde, "Control Dup"=one.m.cdu, "Del Dup"=one.m.dedu), fill_color = c("#ACDEFF", "#4492FC", "#91A5BD"), stroke_size = 0.0)

dev.off()