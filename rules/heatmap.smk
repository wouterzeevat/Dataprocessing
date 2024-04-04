rule heatmap:
    input: "processed/data.RData"
    output: "output/heatmap.png"
    shell:
        'rscript scripts/heatmap.R {input} {output}'