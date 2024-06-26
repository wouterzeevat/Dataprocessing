rule output:
    """
    Generates the final PDF file, with all the graphs. This is done by using a python script
    """
    input:
        "output/barplot.png",
        "output/boxplot.png",
        "output/density.png",
        "output/heatmap.png",
        "output/multidimentionalscaling.png",
        "output/fold_change.png",
        "output/fold_change_1m_control_del.png",
        "output/fold_change_1m_control_dup.png",
        "output/fold_change_1m_dup_del.png",
        "output/vulcano_1m_control_del.png",
        "output/vulcano_1m_control_dup.png",
        "output/vulcano_1m_dup_del.png",
        "output/venn_diagram.png",
    output: "output/output.pdf"
    shell:
        "python3 scripts/output.py {output} {input}"