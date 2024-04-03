rule boxplot:
    input: "objects/data.RData"
    output: "output/boxplot.png"
    shell:
        'rscript scripts/boxplot.R {input} {output}'