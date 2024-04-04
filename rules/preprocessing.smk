rule preprocessing:
    input: "processed/data.RData"
    output:
        "processed/preprocessed_data.RData",
        "output/fold_change.png",
        "processed/counts.tsv",
        "processed/coldata.tsv"
    shell:
        'rscript scripts/preprocessing.R {input} {output[0]} {output[1]} {output[2]} {output[3]}'