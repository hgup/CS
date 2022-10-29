
# READING THE DATA
library(readr)
breakfast <- read_csv("data/processed/breakfast.csv")

# DATA PROCESSING
data <- t(breakfast[,3])
names(data) <- t(breakfast[,2])
myData <- sort(data,decreasing = T)


# OUTPUT OPTIONS
#pdf_file <- "output/plot3.pdf"
#cairo_pdf(bg = "grey98", pdf_file, width= 11, height = 11)

svg_file <- "output/plot3.svg"
svg(bg = "transparent", svg_file, width= 11, height = 11)
par(omi=c(2,0.5,1,.25), mai=c(0.5,1.2,1,1.2), cex=1.4,
    family = "Inter Light",las = 1)

# COLORS
source(file="src/colors.R")


# PLOT
x <- barplot(myData, col = pieC,ylim= c(0,330),
    border = 0,las= 1,cex.axis=1.3, cex.names = 1.1, axes = F)
axis(2,at=seq(0,300,50))

# EXTRA PLOT LABELS
text(x, y = myData + 5, myData)


#-------------------------------:TITLING:-------------------------------
# TOP
mtext("How do you feel in the morning?",3, line = 1, cex = 2.2, family = "Inter Black", adj = 0,
      outer = T)
mtext("We surveyed students on a random working day",3,
      line = -1.75, cex = 1.7, family = "Inter Thin", font = 3, adj = 0,
      outer = T)

# OTHER
mtext( "Values in Numbers (out of 409)",3,line=-1, adj=1, cex=1, font=3, family = "Inter Light")

# BOTTOM
mtext("* There are bad days sometimes when you reach late for breakfast.",1,
      line = 3, cex = 1.2, family = "Inter Light", adj = 0,
      outer = T)


#---------------------------:END:------------------------

# A NEAT HACK TO TURN OFF ALL LOADED DEVICES.
while (length(dev.list())){
    dev.off()
}