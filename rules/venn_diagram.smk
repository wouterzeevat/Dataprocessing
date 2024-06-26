rule venn_diagram:
    """
    Generates the venn diagram by calling the corresponding R script, it uses the result of deseq2
    """
    input: "processed/results_deseq.RData"
    output: "output/venn_diagram.png"
    shell:
        'rscript scripts/venn_diagram.R {input} {output}'