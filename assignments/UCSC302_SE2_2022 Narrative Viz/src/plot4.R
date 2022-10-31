# Intermittent Fasting

# colors
source("src/colors.R")

pdf_file<-"output/plot4.pdf"
svg_file<- "output/plot4.svg"

#cairo_pdf(bg=bgC, pdf_file,width=10,height=10)
svg(bg="transparent", svg_file,width=10,height=10)
par(omi=c(1,0.25,1,1)+0.2,mai=c(0,1,0,0.5)+0.3,cex.axis=1.3,cex.lab=1.4,
    xpd=T,family="Inter Light",las=1)
library(plotrix)
library(readxl)
# Import data and prepare chart
myRegions <- read_excel("data/processed/worldenergymix.xlsx")


myRegions$Region<-NULL
myLabelling<-c("Cognitive\nAbilities","Heart Issues","Oxidative\nStress","HGH** Levels","Life Span***")
# Create chart
radial.plot(myRegions,start=1.7,grid.left=T,labels= myLabelling,rp.type="p",main="",line.col=c(radC1,radC2),poly.col=c(radC1,radC2),show.grid=T,radial.lim=c(0,10),lwd=8)
legend("bottomleft",c("w/o Intermittent Fasting","w/ Intermittent Fasting"),pch=15,col=c(radC1,radC2),bty ="n",cex=1.4)
# Titling
mtext(line=3,"Benefits of Intermittent Fasting",cex=2.5, adj=0,family="Inter Black", col=myC1)

#mtext(line=1,"Values* on a scale of 1 to 10",cex=1.5,adj=0,font=3,family = "Inter Italic")
mtext(side=1,line=1,"*Values are normalized such that the value of 5 is average of that factor\n(e.g. Life Span:70 is given value 5)",cex=1.15,adj=0,font=1,outer=T)
#mtext(side=1,line=2,"**Human Growth Hormone (normalized as an index, the average level is given the value of 5)",cex=1.15,adj=0,font=1,outer=T)
#mtext(side=1,line=4,"Source: Healthline.org",cex=1.05,adj=1,font=3,outer=T)
dev.off()