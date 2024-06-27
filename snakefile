configfile: "config.yaml"

include: "rules/load_data.smk"
include: "rules/barplot.smk"
include: "rules/boxplot.smk"
include: "rules/density.smk"
include: "rules/heatmap.smk"
include: "rules/multidimentionalscaling.smk"
include: "rules/preprocessing.smk"
include: "rules/deseq_from_tsv_matrix.smk"
#include: "rules/deseq.smk" # Doesnt do anything except create useful deseq files! REPLACED WITH rules/deseq_results.smk
include: "rules/deseq_with_r.smk"
include: "rules/fold_change_comparison.smk"
include: "rules/vulcano_plot.smk"
include: "rules/venn_diagram.smk"
include: "rules/output.smk"

rule all:
    input:
        "output/output.pdf"
    shell:
        "echo done"