rule deseq2_wald:
    input:
        dds="processed/dds_matrix.RDS",
    output:
        deseq2_result_dir=directory("output/results"),  # Create the output directory
        normalized_counts_table="counts.tsv",
        normalized_counts_rds="counts.RDS",
        group_file="output/results/group1M_CONTROL.tsv",
    params:
        deseq_extra="",
        shrink_extra="",
        results_extra="",
        contrast=[],
    threads: 1
    log:
        "logs/deseq2.log",
    wrapper:
        "v3.7.0/bio/deseq2/wald"
