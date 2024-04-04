configfile: "config.YAML"

rule load_data:
    output: "processed/data.RData"
    shell:
        'rscript scripts/load_data.R {config[files][input][counts]} {config[files][input][matrix]} {output}'