if (!require("BiocManager", quietly = TRUE))
    install.packages("BiocManager")
BiocManager::install("GEOquery")
BiocManager::install("affy")
BiocManager::install("DESeq2")
BiocManager::install("EnhancedVolcano")
BiocManager::install("tximport")

library(pander)
library(scales)
library(pheatmap)
library('PoiClaClu')
library(readr)
library(jsonlite)
ashr
gplots
venndiagram
ggvenn

python3 -m pip install --upgrade Pillow


snakemake --dag | Out-File -FilePath workflow.dot -Encoding ascii
dot -Tpng workflow.dot -o workflow.png