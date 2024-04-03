rule multidimentionalscaling:
    input: "objects/data.RData"
    output: "output/multidimentionalscaling.png"
    shell:
        'rscript scripts/multidimentionalscaling.R {input} {output}'