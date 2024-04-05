configfile: "config.YAML"

include: "rules/load_data.smk"
include: "rules/barplot.smk"
include: "rules/boxplot.smk"
include: "rules/density.smk"
include: "rules/heatmap.smk"
include: "rules/multidimentionalscaling.smk"
include: "rules/preprocessing.smk"
include: "rules/deseq_from_tsv_matrix.smk"
#include: "rules/deseq.smk" # Doesnt do anything except create useful deseq files! REPLACED WITH rules/deseq_results.smk
include: "rules/deseq_results.smk"
include: "rules/fold_change_comparison.smk"
include: "rules/vulcano_plot.smk"
include: "rules/venn_diagram.smk"

rule all:
    input:
        "processed/data.RData",
        "output/barplot.png",
        "output/boxplot.png",
        "output/density.png",
        "output/heatmap.png",
        "output/multidimentionalscaling.png",
        "output/fold_change.png",
        "processed/preprocessed_data.RData",
        "processed/counts.tsv",
        "processed/coldata.tsv",
        "processed/dds_matrix.RDS",
        "processed/results_deseq.RData",
#        "output/results/group1M_CONTROL.tsv",
        "output/fold_change_1m_control_del.png",
        "output/fold_change_1m_control_dup.png",
        "output/fold_change_1m_dup_del.png",
        "output/vulcano_1m_control_del.png",
        "output/vulcano_1m_control_dup.png",
        "output/vulcano_1m_dup_del.png",
        "output/venn_diagram.png"
    shell:
        "echo done"