rule preprocessing:
    """
    Preprocesses the data, and creates multiple new data files that will later be used by deseq2
    """
    input: "processed/data.RData"
    output:
        "processed/preprocessed_data.RData",
        "output/fold_change.png",
        "processed/counts.tsv",
        "processed/coldata.tsv"
    threads: 10
    shell:
        'rscript scripts/preprocessing.R {input} {output[0]} {output[1]} {output[2]} {output[3]}'