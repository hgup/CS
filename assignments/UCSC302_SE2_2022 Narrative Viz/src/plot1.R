
# Open a Pdf device: output to pdf/views.pdf
pdf_file <- "output/plot1.pdf"
cairo_pdf(pdf_file, bg = "#f7f7f7", width = 13, height = 10.5)

# svg
svg_file <- "output/plot1.svg"
svg(svg_file, bg = "#f7f7f7", width = 13, height = 10.5)


# Some default parameters
  # outer margins: 0.25,0.75,1,0.75
  # margin size: 1.8,3.75,0.25,0
  # font: Inter Light
  # text orientation: horizontal
par(omi = c(0.25,0.75,1.5,0.75)+c(0,0.4,0,0),
    mai = c(1.8,3.45,0.75,0),
    family = "Inter Light",
    lheight = 1.5,
    col = "black",
    las = 1,cex=1.2)


# Reading the data using `readxl` library
library(readr)
datafile <- read_csv("data/processed/waking_up.csv")

# detach after data is read
detach("package:readr", unload = TRUE)


# load the data into a matrix/array class -> data
data <- rbind(
  floor(datafile$N),
  floor(datafile$AS),
  floor(datafile$A),
  floor(datafile$D),
  floor(datafile$DS))

# set a max value for x limits
d_max <- 650

#define colors

myC1<- "#3B6572" #main
myC2<- "#365B6D" #secondary_main
myC3<- "#BEDAD3" #light
myC4<- "#A7C8BE" #

myC5<- myC2 #font
myC6<- myC2
colours<-c("#5AAA95",myC1, myC2,myC3,myC4)



# PLOTTING

# plot the NOT SURE
x <- barplot(-rep(d_max, 4), cex.names=1.1,horiz=T,
        border=par ("bg"), xlim=c(-d_max,d_max), col=colours[1],axes=F)
        
barplot (-(d_max-data[1, ]), horiz =T,
        border=par("bg"),col=par("bg"),axes=F, add=T)

# plot AGREE
barplot(-data[3:2,],horiz=T,
        border=NA, col=colours[3:2],axes=F, add=T)
text (-data[3,]-data[2,]-10, x,data[3,]+data[2,],adj=1,xpd=T,family = "Inter Regular", font=1, cex=1.1, col=myC5)

# plot DISAGREE
barplot(data[4:5,], horiz=T,
        border=NA, col=colours[4:5],axes=F,add=T )
text (data[4,]+data[5,]+10, x,data[4,]+data[5,],adj=0,xpd=T,family = "Inter Regular", font=1, cex=1.1, col=myC6)


# Labels
for (i in 1: length(as.matrix(datafile[,1]))){
  text(-d_max-10, x[i], paste(strwrap(datafile[i,2],width = 45),collapse = '\n'), xpd = NA, adj = 1, cex = 1.1, family = "Inter Light")
  
}

# Arrows and stuff
arrows(0,-0.1,0,8.6,lwd=2.5, length=0, xpd=T, col="white")

# Creating the Legend
myresponses <- c("Not Sure","Agree Strongly", "Agree", "Disagree", "Disagree Strongly")
px<-c(-350, -300,-150,0,150)*3;y<-rep(-1,5)
points(px, y+0.2,  pch=15, cex=4, col=colours,xpd=T )
mtext (seq(-600,600,100) , at=seq(-600,600,100),1, line=1, cex=1)
text (px-c(40,-280,-140,40,40), y +0.2,myresponses,adj=1,xpd=T, font=3, cex=1)


# Titling
mtext("When I wake up early in the morning I...",3,col=myC2, line=2.2, adj=0, cex=2.5, outer=T, family="Inter Black")
mtext("A survey about mornings for 578 students was conducted",3, line=0, adj=0, cex=2.5/1.5, outer=T,font = 4, family="Inter Thin")
mtext( "Values in Numbers              ",3,line=1, adj=1, cex=1.4, font=3)
mtext (paste("N=",d_max),3, line=1, adj=0, cex=1.35, family="Inter", font=3)


# flush the changes in pdf/views.pdf
while (length(dev.list())){
    dev.off()
}