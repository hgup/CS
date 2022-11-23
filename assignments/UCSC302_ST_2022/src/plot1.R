library(readxl)
data <- read_excel("data/raw/DDW_B18sc_3400_NIC_FINAL_STATE_PUDUCHERRY-2011.xls")
tC <- subset(data, data$`NIC Name`== "Total" & data$`India/States` == "STATE - PUDUCHERRY")
tC <- tC[10:17]

pdf_file <- "output/plot1.pdf"

cairo_pdf(bg = "grey98", pdf_file, width= 11, height = 9)

par(omi=c(1,0.5,1,.25), mai=c(0,1.75,0,2)+0.5,
    family = "Inter Light",las = 1)
#! omi = c(2(for the text in the lower margin),0.5,1(for the title),0.25(aesthetic offset, compared to 0.5 on the left))

library(RColorBrewer)

pie.myData <- tC

en_types <- names(tC)
pie.myData <- as.matrix(tC)


# We name our object
names(pie.myData) <- paste(en_types,"\n", format(pie.myData/sum(pie.myData)*100,digits = 2), "%", sep = "")

# create pie
pie(pie.myData, col = brewer.pal(length(pie.myData),"Blues"), border = 0, cex = 1, radius = 0.9, init.angle = 80)

#! check brewer.pal.info

# creating Titles
mtext("Workers in State Puducherry",3,
      line = 1, cex = 2.2, family = "Inter Black", adj = 0,
      outer = T, )
mtext("Distribution of total workers based on Marginal and Main",3,
      line = -1.75, cex = 1.7, family = "Inter Thin", font = 3, adj = 0,
      outer = T)

mtext("Source: www.nic.gov.in",1,
      line = 1, cex = 1.25, family = "Inter Thin",font = 3, adj = 1,
      outer = T)




#! 3 is italics
#! more the line higher the text, counting starts from inwards
#! use *outer* margins if available


while (length(dev.list())){
    dev.off()
}





