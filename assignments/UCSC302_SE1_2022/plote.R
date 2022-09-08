# Open a Pdf device: output to pdf/views.pdf
pdf_file <- "pdf/views.pdf"
cairo_pdf(pdf_file, bg = "grey98", width = 9, height = 6.5)


# Some default parameters
  # outer margins: 0.65, 0.25, 0.75, 0.75
  # margin size: 0.3,2,0.35,0
  # font: Inter Light
  # text orientation: horizontal
par(omi = c(0.5,2,0.6,0),
    mai = c(0.5,0.5,0.5,0.5),
    family = "Inter Light",
    las = 1)


# Reading the data using `readxl` library
library(readxl)
views_data <- read_excel("data.xlsx")

# detach after data is read
detach("package:readxl", unload = TRUE)


# load the data into a matrix/array class -> data
data <- rbind(
  views_data$Not_Sure,
  views_data$Agree_Strongly,
  views_data$Agree,
  views_data$Disagree,
  views_data$Disagree_Strongly)

# set a max value for x limits
d_max <- 150

#import colors
source("colors.r",encoding="UTF-8" ) 


# PLOTTING

# plot the NOT SURE
x <- barplot(-rep(d_max, 6), cex.names=1.1,horiz=T,
        border=par ("bg"), xlim=c(-d_max,d_max), col=colours[1],axes=T)
        
barplot (-(d_max-data[1, ]), horiz =T,
        border=par("bg"),col=par("bg"),axes=F, add=T)


# plot AGREE
barplot(-data[3:2,],horiz=T,
        border=NA, col=colours[3:2],axes=F, add=T)

# plot DISAGREE
barplot(data[4:5,], horiz=T,
        border=NA, col=colours[4:5],axes=F,add=T )


myfont = "Inter Light"

# Labels
for (i in 1: length(as.matrix(views_data[,1]))){
  text(-155, x[i],paste(strwrap(views_data[i,1],width = 40),collapse = '\n'), xpd = NA, adj = 1, cex = 0.65, family = myfont)
  
}

# Arrows and stuff

arrows(0,-0.1,0,8.6,lwd=2.5, length=0, xpd=T, col="Skyblue3")
px<-c(-98, -87,-41,15,65); tx<-c(-105, -60,-26,8,60); y<-rep(-1,5)
points(px, y, pch=15, cex=4, col=colours,xpd=T )
mtext (c(80, 60, 40, 20,0, 20, 40, 60) , at=c(-80, -60, -40, -20,0, 20, 40,60), line=0, cex=0.95)

# Titling
mtext("Opinion about Long Weekends",3, line=2.2, adj=0, cex=1.8, outer=T, family="Inter Black")
mtext( "Values in Numbers",3,line=1, adj=1, cex=0.95, font=3)
mtext("UCSC-301 Assignment",1,line=5.2,adj =1, cex=0.95, font=3)
mtext ("N=150",3, line=1, adj=0, cex=1.15, family="Inter", font=3)


# flush the changes in pdf/views.pdf
while (length(dev.list())){
    dev.off()
}
