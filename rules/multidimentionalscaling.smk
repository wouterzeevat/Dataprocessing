rule multidimentionalscaling:
    input: "processed/data.RData"
    output: "output/multidimentionalscaling.png"
    shell:
        'rscript scripts/multidimentionalscaling.R {input} {output}'