args <- commandArgs(trailingOnly = TRUE)
load(args[1])

# Perform a naive FPM normalization
# Note: log transformation includes a pseudocount of 1
counts.fpm <- log2( (counts / (colSums(counts) / 1e6)) + 1 )

groups <- factor(rep(1:9, each=12),
                 labels = c("IPSC_CONTROL", "IPSC_DEL", "IPSC_DUP", "1M_CONTROL", "1M_DEL", "1M_DUP", "3M_CONTROL", "3M_DEL", "3M_DUP"))
coldata <- names(counts)

design <- model.matrix(~0 + groups)
colnames(design) <- levels(groups)
#The data will now be normalized by calculating the FPM.

counts.filtered <-  counts.fpm[rowSums(counts.fpm != 0) > 0, ]
counts <-  counts[rowSums(counts.fpm != 0) > 0, ]

#I decided to remove the rows where all colums are 0.
### 4.2 the fold change value

counts.filtered$mean_ipsc_control <- rowMeans(counts.filtered[,ipsc_control])
counts.filtered$mean_ipsc_dup <- rowMeans(counts.filtered[,ipsc_dup])
counts.filtered$fold_change <- counts.filtered$mean_ipsc_dup - counts.filtered$mean_ipsc_control

png(file = args[3],   # The directory you want to save the file in
    width = 800, # The width of the plot in inches
    height = 500) # The height of the plot in inches

hist(counts.filtered$fold_change, breaks = 60, main="Log fold changes (IPSC control vs IPSC duplication")
abline(v=-1, col="red")
abline(v=1, col="red")

dev.off()

save(counts, metadata, ipsc_control, ipsc_del, ipsc_dup, one_m_control, one_m_del,one_m_dup, three_m_control, three_m_del, three_m_dup, file=args[2])
write.table(counts, file=args[4], quote=FALSE, sep='\t', col.names = NA)
write.table(data.frame(group = groups), file=args[5], quote=FALSE, sep='\t', col.names = NA)

