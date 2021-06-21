#! /bin/bash

if [ $# -ne 5 ]
then
  echo "Usage: $0 <CoVarS> <Zscores> <SeqLen1> <SeqLen2> <Dir>" 1>&2
  exit 1;
fi


echo "
options(error=recover);
options(show.error.locations=TRUE);
#options(error=traceback);

library(plot3D);
corv<-read.table(\"$1\", header = F,sep=\"\t\");
CB<-matrix(nrow = $3, ncol = $4);
for(k in 1:length(corv\$V1)){ re<-corv\$V1[k]; le<-corv\$V2[k]; cc<-corv\$V3[k];  CB[re,le]<- cc;};
zorv<-read.table(\"$2\", header = F,sep=\"\t\");
ZB<-matrix(nrow = $3, ncol = $4);
for(k in 1:length(zorv\$V1)){ re<-zorv\$V1[k]; le<-zorv\$V2[k]; cc<-zorv\$V3[k];  ZB[re,le]<- cc;};

xv<-seq(1,$3,by=1);
yv<-seq(1,$4,by=1);

png(\"$5/SeqCoVarplot.png\", width = 6, height = 6, res= 600, units = 'in');

image2D( CB, xv, yv , xlab = \"Residue No. (Reference Sequence)\", ylab = \"Residue No. (Reference Sequence)\" , main = \"Co-variation Scores for co-evolving positions\");

dev.off();

png(\"$5/SeqZplot.png\", width = 6, height = 6, res= 600, units = 'in');
image2D( ZB, xv, yv , xlab = \"Residue No. (Reference Sequence)\", ylab = \"Residue No. (Reference Sequence)\" , main = \"Z-scores for co-evolving positions\");

dev.off();
">Surf_Draw.R

chmod 777 Surf_Draw.R
Rscript --save Surf_Draw.R

#chmod 777 SeqCoVarplot.png
#chmod 777 SeqZplot.png
