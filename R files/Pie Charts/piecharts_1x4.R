pdf_file<-"pdf/piecharts_1x4.pdf"
cairo_pdf(bg="grey98", pdf_file, width=14, height=6)
library(plotrix)
library(RColorBrewer)

par (omi=c(0.5,0.5,1,0.5),mai=c(0,0,0,0),xpd=T,mfcol=c(1,4),
       family="Inter Light", las=1) 
# Import data
labelling <- c("Humanities and Social Sciences",
               "Life Sciences",
               "Natural Sciences",
               "Engineering")
colors <- c("YlOrBr", "Reds","Greens","Blues")

x <- c(418.7, 767.0, 436.1, 478.7)
y <- c(148.6, 271.4, 154.7, 185.8)

# Define charts and other elements

for(i in c(1:4)){
  plot(1:5, type="n", axes=F, xlab="", ylab="")
  values<-c(x[i]-y[i],y[i])
  myCircle<-floating.pie(3,3,values, border="white",
       radius=2.1*sqrt(x[i]/max(x)),
       col=brewer.pal(3,colors[i])[2:3])
  
  pie.labels(3,3,myCircle,values, bg=NA, border=NA,
             radius=x[i]/max(x),cex=2, col="white")
  if (i==1) pie.labels(3,3,myCircle,c("rejected","granted"),
             bg=NA,border=NA, radius=1.95, font=3)
  text(3,4.7, cex=2,adj=0.5,
       paste(format(round(100*y[i]/x[i],1),nsmall=1),"%",sep=" "))
  text(3,1.2, labelling[i],cex=2,adj=0.5)
}

mtext("DFG grants 2010",3,line=3,adj=0, family="Inter Black",
      outer=T, cex=2)
mtext("Individual grants by science sector, values in million. Euro. Percent values: approval ratio",3, line=0, adj=0,
      cex =1.35, font=2, outer=T)
mtext("Source: DFG Information Cards 2011, www.dfg.de",1, line=2,
      adj=1.0, cex=1.1, font=3, outer=T)

while (length(dev.list())){
    dev.off()
}