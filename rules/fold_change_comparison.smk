rule fold_change_comparison:
    input: "processed/results_deseq.RData"
    output: "output/fold_change_1m_control_del.png",
            "output/fold_change_1m_control_dup.png",
            "output/fold_change_1m_dup_del.png"
    shell:
        'rscript scripts/fold_change_comparison.R {input} {output[0]} {output[1]} {output[2]}'