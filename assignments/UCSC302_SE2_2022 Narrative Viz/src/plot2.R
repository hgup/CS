pdf_file <- "output/plot2.pdf"
cairo_pdf(bg = "#f7f7f7", pdf_file, width= 11, height = 11)


#svg_file <- "output/plot2.svg"
#svg(bg = "#f7f7f7", svg_file, width= 11, height = 11)

par(omi=c(0,0,0,0)+1.3, mai = c(0,0,1,0.2)+0.2,
    family = "Inter Light",las = 1)

# Col and name
sports <- c("Badminton","Basketball","Cricket","Football","Table Tennis","Tennis","Volleyball","None")
source(file = "src/colors.R")


library(readr)
data <- read_csv("data/processed/sports_played.csv")
pie.myData <- t(data[,3])
pie.myData <- c(pie.myData,409 - sum(pie.myData))

names(pie.myData) <-  paste(sports,"\n", format(pie.myData/sum(pie.myData)*100,digits = 1), "%", sep = "")
# We name our object

# create pie
pie(pie.myData, col = pieC,
    border = 0, cex = 1.35, radius = 0.9, init.angle = 90)

mtext("Sports played in PSN campus",3,
      line = 1, cex = 2.2, family = "Inter Black", adj = 0,
      outer = T,col = myC2 )
mtext("409 students were asked about their main sport",3,
      line = -1.75, cex = 1.7, family = "Inter Thin", font = 3, adj = 0,
      outer = T)

while (length(dev.list())){
    dev.off()
}





