configfile: "config.YAML"

include: "rules/load_data.smk"
include: "rules/barplot.smk"
include: "rules/boxplot.smk"
include: "rules/density.smk"
include: "rules/heatmap.smk"
include: "rules/multidimentionalscaling.smk"
include: "rules/preprocessing.smk"

rule all:
    input:
        "objects/data.RData",
        "output/barplot.png",
        "output/boxplot.png",
        "output/density.png",
        "output/heatmap.png",
        "output/multidimentionalscaling.png",
        "objects/preprocessed_data.RData"
    shell:
        "echo done"