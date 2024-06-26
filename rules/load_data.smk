configfile: "config.YAML"

rule load_data:
    """
    Loads in the matrix files and generates a RData file, to save the data for later usage such as
    preprocessing and generating graphs
    """
    output: "processed/data.RData"
    shell:
        'rscript scripts/load_data.R {config[files][input][counts]} {config[files][input][matrix]} {output}'