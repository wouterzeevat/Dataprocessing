rule deseq_results:
    """
    Runs deseq through R by using the previously generated dds matrix. It is also possible to use "deseq.smk"
    """
    input: "processed/dds_matrix.RDS"
    output: "processed/results_deseq.RData"
    shell:
        'rscript scripts/deseq_results.R {input} {output}'