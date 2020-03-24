# experiment
R scripts for dealing with experiment data (e.g. randomization for animal study, calculate fold of changes for PCR results)


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
