rule barplot:
    """
    Generates the barplot by calling the corresponding R script
    """
    input: "processed/data.RData"
    output: "output/barplot.png"
    threads: 2
    shell:
        'rscript scripts/barplot.R {input} {output}'