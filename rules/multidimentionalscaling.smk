rule multidimentionalscaling:
    """
    Creates a multidimentional scaling plot that visualizes the data outliers
    """
    input: "processed/data.RData"
    output: "output/multidimentionalscaling.png"
    threads: 8
    shell:
        'rscript scripts/multidimentionalscaling.R {input} {output}'