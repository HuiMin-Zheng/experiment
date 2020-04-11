# experiment
R scripts for dealing with experiment data (e.g. randomization for animal study, calculate fold of changes for PCR results)

## check and install all required R packages
```
# Install required packages if they were not installed
## install packages from CRAN
pkgs <- c("rcompanion","dunn.test","reshape2","pROC","ggplot2","optparse","vegan","doBy","psych","FSA","pheatmap")

for (pkg in pkgs){
  ## try install form CRAN
  if(!require(pkg, character.only = TRUE)) install.packages(pkg,dependencies = T)
  ## try install from Bioconductor
  if (!requireNamespace("BiocManager", quietly = TRUE)) install.packages("BiocManager")
  if(!require(pkg, character.only = TRUE)) BiocManager::install(pkgs)
}

## install packages (or the development versions) from github or other sources
#if (!requireNamespace("devtools")) install.packages("devtools")
#devtools::install_github("xrobin/pROC") # install from github
#install.packages("path/to/pkg/package_name.tar.gz", repos = NULL, type = "source") #install from source

```

## randomization
```
# 1. load utility scripts
source("utility_scripts.R")

# 2. read file
dta <- read.table("weight.txt",header = T,sep = "\t")

# 3.1 do stratified randomization
dta2 <- strat_randomization(dta=dta,index="weight",group_numb=6,group_name="Group",group_labs=c("a1","a2","a3","b1","b2","b3"))
 
# 3.2 or do simple randomization
dta2 <- simple_randomization(dta=dta,group_numb=6,group_name="Group",group_labs="default",index="weight")

# 4. output file
write.table(dta,"randomization_weight.txt",row.names = F,sep = "\t",quote = F)
```
