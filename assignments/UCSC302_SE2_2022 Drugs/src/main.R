# The data provided, gives us the following information
# - type of med
# - power of the med
# - pack size

# since power is not a good measure of comparison (as different drugs
# do different things), and pack size is also irrelevant.
# Thus, we will use only the `type of med`.

# GOAL: To see the distribution of type of most life saving drugs.

# IDIOM: A barplot showing the various mediums in a sorted order.

#----------------------------------:CODE:-------------------------------
# READING THE DATA
library(readxl)
data <- read_excel("data/CGHS_life_saving_drugs.xls", col_types = c("text", "text"))

# DATA PROCESSING
myData <- sort(table(data[,2]),decreasing = T) # distribution of med type
percData <- myData / sum(myData) * 100


# OUTPUT OPTIONS
pdf_file <- "output/final.pdf"
cairo_pdf(bg = "grey98", pdf_file, width= 11, height = 11)
par(omi=c(2,0.5,1,.25), mai=c(0.5,1.2,1,1.2),
    family = "Inter Light",las = 1)

# COLORS AND NAMES
library(RColorBrewer)
medType <- c(
  "CAP" = "Capsules",
  "INJ" = "Injections",
  "NA" = "Others*",
  "PATCH" = "Patch",
  "PFS" = "PFS**",
  "SYP" = "Syrup",
  "TAB" = "Tablet"
  )
names(myData) <- medType[names(myData)]
greens = rev(brewer.pal(length(myData),"Greens"))
greens[7] = greens[6]


# PLOT
x <- barplot(myData, col = greens,ylim= c(0,180),
    border = 0,las= 1,cex.axis=1.3, cex.names = 1.1, axes = F)
axis(2,at=seq(0,180,30))

# EXTRA PLOT LABELS
text(x, y = myData + 5, myData)


#-------------------------------:TITLING:-------------------------------
# TOP
mtext("Life Saving Drugs",3,
      line = 1, cex = 2.2, family = "Inter Black", adj = 0,
      outer = T, )
mtext("The Medium in which they are available",3,
      line = -1.75, cex = 1.7, family = "Inter Thin", font = 3, adj = 0,
      outer = T)

# OTHER
mtext( "Values in Numbers",3,line=-1, adj=1, cex=1, font=3, family = "Inter Light")

# BOTTOM
mtext("* OTHERS include medical apparatus like adapters, bags, solutions(not for direct consumption),
especially for treating CAPD. Read more at https://capdots.com",1,
      line = 3, cex = 1.02, family = "Inter Light", adj = 0,
      outer = T)
mtext("** Progression-free survival",1,
      line = 5, cex = 1.02, family = "Inter Light", adj = 0,
      outer = T)
mtext("Source: Central Government Health Scheme, https://cghs.nic.in",1,
      line = 7, cex = 1.25, family = "Inter Thin",font = 3, adj = 1,
      outer = T)

#---------------------------:END:------------------------

# A NEAT HACK TO TURN OFF ALL LOADED DEVICES.
while (length(dev.list())){
    dev.off()
}
