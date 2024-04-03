rule barplot:
    input: "objects/data.RData"
    output: "output/barplot.png"
    shell:
        'rscript scripts/barplot.R {input} {output}'