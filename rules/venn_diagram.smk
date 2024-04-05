rule venn_diagram:
    input: "processed/results_deseq.RData"
    output: "output/venn_diagram.png"
    shell:
        'rscript scripts/venn_diagram.R {input} {output}'