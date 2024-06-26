rule heatmap:
    """
    Generates the heatmap by calling the corresponding R script
    """
    input: "processed/data.RData"
    output: "output/heatmap.png"
    shell:
        'rscript scripts/heatmap.R {input} {output}'