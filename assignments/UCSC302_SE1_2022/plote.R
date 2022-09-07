# Open a Pdf device: output to pdf/views.pdf
pdf_file <- "pdf/views.pdf"
cairo_pdf(pdf_file, bg = "grey98", width = 9, height = 6.5)


# Some default parameters
  # outer margins: 0.65, 0.25, 0.75, 0.75
  # margin size: 0.3,2,0.35,0
  # font: Inter Light
  # text orientation: horizontal
par(omi = c(0.65, 0.25, 0.75, 0.75),
    mai = c(0.3,2,0.35,0),
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
barplot(-rep(d_max, 6), cex.names=1.1,horiz=T,
        border=par ("bg"), xlim=c(-d_max,d_max), col=colours[1],axes=T)
        
barplot (-(d_max-data[1, ]), horiz =T,
        border=par("bg"),col=par("bg"),axes=F, add=T)


# plot AGREE
barplot(-data[3:2,],horiz=T,
        border=NA, col=colours[3:2],axes=F, add=T)

# plot DISAGREE
barplot(data[4:5,], horiz=T,
        border=NA, col=colours[4:5],axes=F,add=T )



# flush the changes in pdf/views.pdf
while (length(dev.list())){
    dev.off()
}
