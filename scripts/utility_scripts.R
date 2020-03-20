# Load Required Packages
for (lib in c('ggplot2')) {
  suppressPackageStartupMessages(require(lib, character.only = TRUE))
}

##################################
## randomization
##################################
simple_randomization <- function(dta,group_numb=2,group_name="Group",group_labs="default",index="none"){
  # funtcion: do simple randomization and reture a dataframe with a new Group
  ## randomized groups
  dta$rand <- runif(nrow(dta), min = 0, max = 1)
  dta <- dta[order(dta$rand),]
  dta <- dta[,-which(names(dta)=="rand")]
  if (group_labs[1]=="default"){
    group_labs <- paste("group",1:group_numb,sep = "_")
  }
  dta[,group_name] <- rep(group_labs, times = ceiling(nrow(dta)/group_numb))[1:nrow(dta)]
  ## test eveness
  if (index!="none"){
    print(aov(dta[,index]~dta[,group_name]))
    print(kruskal.test(dta[,index]~dta[,group_name]))
    print(ggplot(dta,aes(x=dta[,group_name],y=dta[,index],color=dta[,group_name]))+geom_violin()+
            geom_boxplot(width=0.2)+theme_classic()+theme(legend.position='none')+xlab("")+ylab(index))
    
  }
  return(dta)
}

strat_randomization <- function(dta,index,group_numb=2,group_name="Group",group_labs="default"){
  # funtcion: do stratified block randomization and reture a dataframe with a new Group
  ## randomized groups
  dta <- dta[order(dta[,index]),]
  if (group_labs[1]=="default"){
    group_labs <- paste("group",1:group_numb,sep = "_")
  }
  g <- sample(group_labs, group_numb, replace = FALSE)
  for (i in 2:ceiling(nrow(dta)/group_numb)){
    g <- c(g,sample(group_labs, group_numb, replace = FALSE))
  }
  dta$Group <- g[1:nrow(dta)]
  ## test eveness
  print(aov(dta[,index]~dta[,group_name]))
  print(kruskal.test(dta[,index]~dta[,group_name]))
  print(ggplot(dta,aes(x=dta[,group_name],y=dta[,index],color=dta[,group_name]))+geom_violin()+
          geom_boxplot(width=0.2)+theme_classic()+theme(legend.position='none')+xlab("")+ylab(index))
  return(dta)
}

##################################
## PCR
##################################
