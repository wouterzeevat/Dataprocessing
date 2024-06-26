rule boxplot:
    """
    Generates the boxplot by calling the corresponding R script
    """
    input: "processed/data.RData"
    output: "output/boxplot.png"
    threads: 2
    shell:
        'rscript scripts/boxplot.R {input} {output}'