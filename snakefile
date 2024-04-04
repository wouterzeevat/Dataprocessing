configfile: "config.YAML"

include: "rules/load_data.smk"
include: "rules/barplot.smk"
include: "rules/boxplot.smk"
include: "rules/density.smk"
include: "rules/heatmap.smk"
include: "rules/multidimentionalscaling.smk"
include: "rules/preprocessing.smk"
include: "rules/deseq_from_tsv_matrix.smk"

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
        "processed/dds_matrix.RDS"
    shell:
        "echo done"