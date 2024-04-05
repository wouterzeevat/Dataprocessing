rule deseq_from_tsv_matrix:
    input:
        counts="processed/counts.tsv",
        colData="processed/coldata.tsv",
    output:
        "processed/dds_matrix.RDS",
    threads: 1
    log:
        "logs/DESeqDataSet/txt_matrix.log",
    params:
        formula="~ 0 + group",  # Required R statistical formula
        # factor="condition", # Optionally used for relevel
        # reference_level="A", # Optionally used for relevel
        # tested_level="B", # Optionally used for relevel
        # min_counts=0, # Optionally used to filter low counts
        # extra="", # Optional parameters provided to import function
    wrapper:
        "v3.7.0/bio/deseq2/deseqdataset"