library(GEOquery)

args <- commandArgs(trailingOnly = TRUE)

counts <- read.table(args[1], sep=',', header=TRUE, row.names = 1)
metadata <- getGEO(filename = args[2])
names(counts) <- metadata@phenoData@data$title
ipsc_control <- 1:12
ipsc_del <- 13:24
ipsc_dup <- 25:36
one_m_control <- 37:48
one_m_del <- 49:60
one_m_dup <- 61:72
three_m_control <- 73:84
three_m_del <- 85:96
three_m_dup <- 97:108

save(counts, metadata, ipsc_control, ipsc_del, ipsc_dup, one_m_control, one_m_del,one_m_dup, three_m_control, three_m_del, three_m_dup, file=args[3])
