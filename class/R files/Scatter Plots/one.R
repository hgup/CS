pdf_file<-"pdf/scatterplots_quadrants.pdf"
cairo_pdf(bg="grey98", pdf_file,width=11.69,height=9)
par(mar=c(4,4,0.5,2),omi=c(0.5,0.5,1,0),family="Lato Light",las =1)
library(RColorBrewer)
# Import data and prepare chart
mydata<-read.csv(file="dataFiles/BetterLifeIndex_Data_2011V6.csv", head=F,
                 sep=",",dec=",")
attach(mydata)
#myX<-as.numeric(V16)
#myY<-as.numeric(V15)
#myX_des<-"Self–reported Health (Scale from 0 to 100)"
#myY_des<-"Life Expectancy"
## Define chart and other elements
#plot(type="n",xlab=myX_des,ylab=myY_des,myX, myY,xlim=c(30,90), ylim=c(72,83),axes=F)
#axis(1,col=par("bg"),col.ticks="grey81",lwd.ticks=0.5,tck= -0.025)
#axis(2,col=par("bg"),col.ticks="grey81",lwd.ticks=0.5,tck= -0.025)
#myC1<-brewer.pal(5,"PiYG")[5]
#myC2<-brewer.pal(5,"PiYG")[4]
#myC3<-brewer.pal(5,"PiYG")[1]
#myC4<-brewer.pal(5,"PiYG")[2]
#myP1<-subset(mydata[c("V2","V16","V15")],myX > mean(myX) & myY > mean(myY))
#myP2<-subset(mydata[c("V2","V16","V15")],myX < mean(myX) & myY > mean(myY))
#myP3<-subset(mydata[c("V2","V16","V15")],myX < mean(myX) & myY > mean(myY))
#myP4<-subset(mydata[c("V2","V16","V15")],myX > mean(myX) & myY > mean(myY))
#myN1<-nrow(myP1)
#myN2<-nrow(myP2)
#myN3<-nrow(myP3)
#myN4<-nrow(myP4)
#symbols(myP1[,2:3],bg=myC1,circles=rep(1,myN1),inches=0.3,add=T, xpd=T,fg="white")
#symbols(myP2[,2:3],bg=myC2,circles=rep(1,myN2),inches=0.3,add=T, xpd=T,fg="white")
detach(mydata)