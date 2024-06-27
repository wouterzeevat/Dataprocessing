# Early brain development disrupted by 16p11.2 copy number variants in autism
Insertions or deletions of the 16p11.2 region is often associated with neurodevelopmental disorders. Deletion of this region often leads to the autism spectrum disorder. In this research, the authors wanted to know if brain organoids faithfully recapitulate the fetal development at the transcriptional level. They did this by looking for correlations between these genes and different groups. (insertion, deletion and a controle group). By comparing these 3 groups with eachother it's easy to find correlations or patterns. The result mostly contains figures of compared data concluding that brain organoids do recapitulate fetal development at the transcriptional level. This was already concluded in a previous study.

# The results
The goal of this snakemake project is to make this more efficent. The final output is a pdf file that consists of every graph made within this project.
This contains graphs that show outliers and runs deseq2. The results of this will also be displaying within the pdf and hopefully show the desired result. Which is
a clear conclusion to whether the 16p11.2 region is associated with neurodevolopmental disorders.
The final result of this project will be shown at the bottom of this readme!

## Configuration
Change the config.yaml parameters to the files you would like the project to use.
- counts: This needs to be a csv file with all count data
- matrix:  This needs to be a matrix file containing all sample headers and information

## Workflow
![img](workflow/workflow.png)

## Install
First, install conda and create a conda env. Install snakemake in it.
```commandline
conda create -n env_name
conda activate env_name
conda install -c bioconda -c conda-forge snakemake
```
Then load the repository and locate to it.
```commandline
cd project-location
```
Also make sure python and R are installed (versions below here). 
Lastly, install all the R, python and biocmanager packages!

```commandline
python3 -m pip install --upgrade Pillow
R
install.packages(c("pander", "scales", "pheatmap", "'PoiClaClu'", "readr", "jsonlite",
 "ashr", "gplots", "venndiagram", "ggvenn", "BiocManager"))
 
 library(BiocManager)
 install(c("GEOquery", "affy", "DESeq2", "EnhancedVolcano", "tximport"))
```

## Run the project
Firstly, make sure the slurm config is set correctly
```commandline
snakemake --profile slurm 
```
Run the project by doing:
```commandline
snakemake -c all
snakemake -c all -C counts="countdata.csv" matrix="matrix.txt"

```
You can also change the input data by manually changing the config.yaml
## Dependencies
- R = 4.2
- Python3
- Snakemake

## snakemake wrappers
- Deseq2 snakemake wrapper

#### R packages
- r-pander
- r-scales
- r-pheatmap
- r-'PoiClaClu'
- r-readr
- r-jsonlite
- r-ashr
- r-gplots
- r-venndiagram
- r-ggvenn
- r-BiocManager

### Biocmanager packages
- GEOquery
- affy
- DESeq2
- EnhancedVolcano
- tximport

#### python packages
- Pillow


### Create workflow visualisation
- SHELL: snakemake --dag | Out-File -FilePath workflow.dot -Encoding ascii
- SHELL: dot -Tpng workflow.dot -o workflow.png

![Final PDF result file](output.pdf)