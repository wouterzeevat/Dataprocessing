rule boxplot:
    input: "processed/data.RData"
    output: "output/boxplot.png"
    shell:
        'rscript scripts/boxplot.R {input} {output}'