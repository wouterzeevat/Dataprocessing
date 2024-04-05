rule deseq_results:
    input: "processed/dds_matrix.RDS"
    output: "processed/results_deseq.RData"
    shell:
        'rscript scripts/deseq_results.R {input} {output}'