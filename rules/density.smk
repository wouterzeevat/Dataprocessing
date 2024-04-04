rule density:
    input: "processed/data.RData"
    output: "output/density.png"
    shell:
        'rscript scripts/density.R {input} {output}'