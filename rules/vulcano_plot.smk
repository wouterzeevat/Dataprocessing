rule vulcano_plot:
    """
    Generates the vulcano plot by calling the corresponding R script, it uses the result of deseq2
    """
    input: "processed/results_deseq.RData"
    output: "output/vulcano_1m_control_del.png",
            "output/vulcano_1m_control_dup.png",
            "output/vulcano_1m_dup_del.png"
    shell:
        'rscript scripts/vulcano_plot.R {input} {output[0]} {output[1]} {output[2]}'