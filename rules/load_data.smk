configfile: "config.YAML"

rule load_data:
    output: "objects/data.RData"
    shell:
        'rscript scripts/load_data.R {config[files][input][counts]} {config[files][input][matrix]} {output}'