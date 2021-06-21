#! /bin/bash

if [ $# -ne 2 ]
then
  echo "Usage: $0 <IntResList> <dir>" 1>&2
  exit 1;
fi


echo "
options(error=recover);
options(show.error.locations=TRUE);
library(ggplot2)
library(forcats)
dat<-read.table(\"$1\", header = T,sep=\"\t\");

png(\"$2/StrucIntCoEvo.png\", width = 6, height = 6, res= 600, units = 'in');

ggplot(dat,aes(x=fct_inorder(Dist),y=Perc)) + geom_bar(stat=\"identity\", fill=\"steelblue\", color=\"black\") + geom_text(aes(label=round(Perc, digits=2)), vjust=-0.3, size=4.5) + ylim(0, 100) + xlab(\"Inter-residue Distance\") + ylab(\"Percentage\") + theme(axis.text=element_text(size=12),axis.title=element_text(size=14,face=\"bold\"))

dev.off();

">StInt_Bar.R

chmod 777 StInt_Bar.R
Rscript --save StInt_Bar.R

