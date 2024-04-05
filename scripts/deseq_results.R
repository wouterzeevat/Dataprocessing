library("DESeq2")

args <- commandArgs(trailingOnly = TRUE)

dds <- readRDS(args[1])
dds <- DESeq(dds, betaPrior = FALSE)

result.1m_control_del <- results(dds, contrast = c("group", "1M_CONTROL", "1M_DEL"), alpha = 0.05)
result.1m_control_dup <- results(dds, contrast = c("group", "1M_CONTROL", "1M_DUP"), alpha = 0.05)
result.1m_del_dup <- results(dds, contrast = c("group", "1M_DEL", "1M_DUP"), alpha = 0.05)

save(result.1m_control_del, result.1m_control_dup, result.1m_del_dup, file=args[2])
