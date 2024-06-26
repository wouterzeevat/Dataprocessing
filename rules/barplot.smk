rule barplot:
    """
    Generates the barplot by calling the corresponding R script
    """
    input: "processed/data.RData"
    output: "output/barplot.png"
    shell:
        'rscript scripts/barplot.R {input} {output}'