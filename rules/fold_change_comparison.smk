rule fold_change_comparison:
    """
    Generates three different scatter plots that show all fold changes. Each plot is viewing a different
    group against another group. For example one plot shows the 1 month control group vs the del group.
    """
    input: "processed/results_deseq.RData"
    output: "output/fold_change_1m_control_del.png",
            "output/fold_change_1m_control_dup.png",
            "output/fold_change_1m_dup_del.png"
    shell:
        'rscript scripts/fold_change_comparison.R {input} {output[0]} {output[1]} {output[2]}'