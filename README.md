# experiment
R scripts for dealing with experiment data (e.g. randomization for animal study, calculate fold of changes for PCR results)


## randomization
```
# load utility scripts
source("utility_scripts.R")

dta <- read.table("weight.txt",header = T,sep = "\t")
dta2 <- strat_randomization(dta=dta,index="weight",group_numb=6,group_name="Group",group_labs=c("a1","a2","a3","b1","b2","b3"))
# dta2 <- simple_randomization(dta=dta,group_numb=6,group_name="Group",group_labs="default",index="weight")
write.table(dta,"randomization_weight.txt",row.names = F,sep = "\t",quote = F)
```
