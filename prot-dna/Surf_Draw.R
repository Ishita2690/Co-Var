
options(error=recover);
options(show.error.locations=TRUE);
#options(error=traceback);

library(plot3D);
corv<-read.table("/srv/www/htdocs/ishi/covar/download/exec/prot-dna/example/ProtAl-coevoscores-Srt-Five-Z-1-corrscore_plot", header = F,sep="\t");
CB<-matrix(nrow = 44, ncol = 201);
for(k in 1:length(corv$V1)){ re<-corv$V1[k]; le<-corv$V2[k]; cc<-corv$V3[k];  CB[re,le]<- cc;};
zorv<-read.table("/srv/www/htdocs/ishi/covar/download/exec/prot-dna/example/ProtAl-coevoscores-Srt-Five-Z-1-zscorplot_plot", header = F,sep="\t");
ZB<-matrix(nrow = 44, ncol = 201);
for(k in 1:length(zorv$V1)){ re<-zorv$V1[k]; le<-zorv$V2[k]; cc<-zorv$V3[k];  ZB[re,le]<- cc;};

xv<-seq(1,44,by=1);
yv<-seq(1,201,by=1);

png("example/SeqCoVarplot.png", width = 6, height = 6, res= 600, units = 'in');

image2D( CB, xv, yv , xlab = "Residue No. (Reference Sequence /srv/www/htdocs/ishi/covar/download/exec/prot)", ylab = "Residue No. (Reference Sequence /srv/www/htdocs/ishi/covar/download/exec/prot)" , main = "Co-variation Scores for co-evolving positions");

dev.off();

png("example/SeqZplot.png", width = 6, height = 6, res= 600, units = 'in');
image2D( ZB, xv, yv , xlab = "Residue No. (Reference Sequence /srv/www/htdocs/ishi/covar/download/exec/prot)", ylab = "Residue No. (Reference Sequence /srv/www/htdocs/ishi/covar/download/exec/prot)" , main = "Z-scores for co-evolving positions");

dev.off();

