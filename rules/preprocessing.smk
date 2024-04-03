rule preprocessing:
    input: "objects/data.RData"
    output:
        "objects/preprocessed_data.RData",
        "output/fold_changed.png"
    shell:
        'rscript scripts/preprocessing.R {input} {output[0]} {output[1]}'