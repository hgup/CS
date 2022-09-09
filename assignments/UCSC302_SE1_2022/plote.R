# Open a Pdf device: output to pdf/views.pdf
pdf_file <- "pdf/views.pdf"
cairo_pdf(pdf_file, bg = "#191919", width = 13, height = 10.5)


# Some default parameters
  # outer margins: 0.25,0.75,1,0.75
  # margin size: 1.8,3.75,0.25,0
  # font: Inter Light
  # text orientation: horizontal
par(omi = c(0.25,0.75,1.5,0.75),
    mai = c(1.8,3.75,0.25,0),
    family = "Inter Light",
    lheight = 1.5,
    col = "white",
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
        border=par ("bg"), xlim=c(-d_max,d_max), col=colours[1],axes=F)
        
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
  text(-155, x[i], paste(strwrap(views_data[i,1],width = 50),collapse = '\n'), xpd = NA, adj = 1, cex = 1.1, family = myfont)
  
}

# Arrows and stuff
myresponses <- c("Not Sure","Agree Strongly", "Agree", "Disagree", "Disagree Strongly")

arrows(0,-0.1,0,8.6,lwd=2.5, length=0, xpd=T, col="Skyblue3")
px<-c(-160, -140,-40,40,120); tx<-c(-165, -85,-45,35,115)-2; y<-rep(-1,5)
points(px, y, pch=15, cex=4, col=colours,xpd=T )
mtext (c(120,100, 80, 60, 40, 20,0, 20, 40, 60, 80, 100,120) , at=c(-120,-100, -80, -60, -40, -20,0, 20, 40, 60, 80, 100, 120),1, line=1, cex=0.95)
text (tx, y,myresponses,adj=1,xpd=T, font=3, cex=1)


# Titling
mtext("Opinion about Long Weekends",3, line=2.2, adj=0, cex=2.5, outer=T, family="Inter Black")
mtext("Agree Vs Disagree",3, line=0, adj=0, cex=2.5/1.5, outer=T,font = 4, family="Inter Thin")
mtext( "Values in Numbers",3,line=1, adj=1, cex=0.95, font=3)
mtext("UCSC-301 Assignment. Code available @ https://github.com/hgup/cs/tree/main/assignments/UCSC302_SE1_2022",1,line=7,adj =1, cex=0.95, font=3)
mtext ("N=150",3, line=1, adj=0, cex=1.15, family="Inter", font=3)


# flush the changes in pdf/views.pdf
while (length(dev.list())){
    dev.off()
}
