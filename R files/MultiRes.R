
pdf_file <- "pdf/multiRes.pdf"
cairo_pdf(pdf_file, bg = "#eff2fb", width = 13, height = 10.5)

library(readxl)

data <- read_excel("datafiles/multi_res.xlsx")

#attach(data)

#detach(data)
par (omi=c(0.0,0.75,1.25,0.75) ,mai=c(1.6,3.75,0.5,0), lheight =1.15,
     family="Inter Light", las=1)

main <- NULL

datalen <- length(as.matrix(data[,1]))

for(i in 1: datalen){
  main <- rbind(main,as.matrix(data[i,2:length(data[i,])]))
}
myresponses<-c("n.a./don’t know", "agree strongly", "agree", "disagree", "disagree strongly")

myC1<-rgb(0,208, 226, maxColorValue=255)
myC2<-rgb(109,221, 225, maxColorValue=255)
myC3<-rgb(255,138, 238, maxColorValue=255)
myC4<-rgb(255,0, 210, maxColorValue=255 )
mycolours<-c("grey",myC1,myC2,myC3,myC4)

x <- barplot( t(main), horiz = T, border = NA,
              xlim = c(0,100), col = mycolours, cex.names = 0.85, axes = F)

# Labels
myfont = "Inter Light"
for (i in 1: datalen){
  text(-1.5, x[i],paste(strwrap(data[i,1],width = 42),collapse = '\n'), xpd = NA, adj = 1, cex = 1, family = myfont)
  
}
# Other elements
px<-c(2,8,35,68,98); py<-rep(9,5); tx<-c(-2,25,43,65,95); ty <- rep(9,5)
points(px, py, pch=15, cex=4, col=mycolours,xpd=T )
text(tx, ty, myresponses, adj=1, xpd=T, family="Inter Light", font=3)
mtext(c(0, 20, 40, 60, 80,100) , at=c(0, 20, 40, 60, 80,100) ,1, line=0, cex =0.90)

# Titling
mtext("It is often said that attitudes towards gender roles are changing", 3, line=2.2, adj=0, cex=1.8, outer=T, family="Inter Black")
mtext("All values in percent",1,line=2, adj=1, cex=0.95, font=2)
mtext("Source: European Values Study 2008 Germany, ZA4753. www.gesis.org. Design: Stefan Fichtel, ixtract",
      1, line = 4.5,adj =1, cex=0.95, font=3)
mtext ("N=2,075",1, line=2,adj=0, cex=1.15, family="Inter", font=3)


dev.off()


