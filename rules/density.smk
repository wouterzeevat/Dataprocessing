rule density:
    """
    Generates the density plot by calling the corresponding R script
    """
    input: "processed/data.RData"
    output: "output/density.png"
    threads: 2
    shell:
        'rscript scripts/density.R {input} {output}'