pdf_file <- "pdf/myfirstpie.pdf"

cairo_pdf(bg = "grey98", pdf_file, width= 11, height = 11)

par(omi=c(2,0.5,1,.25), mai=c(0,1.75,0,2),
    family = "Inter Light",las = 1)
#! omi = c(2(for the text in the lower margin),0.5,1(for the title),0.25(aesthetic offset, compared to 0.5 on the left))

library(RColorBrewer)

pie.myData <- c(5.8,27.0,0.2,21.1,12.8, 33.1)

en_types <- c("Nuclear energy:","Coal***:","Others***:","Gas:", "Renewable\nenergies****:","Oil:") 


# We name our object
names(pie.myData) <- paste(en_types, pie.myData, "%", sep = " ")

# create pie
pie(pie.myData, col = brewer.pal(length(pie.myData),"Oranges"),
    border = 0, cex = 1.75, radius = 0.9, init.angle = 90)

#! check brewer.pal.info

# creating Titles
mtext("Global energy mix (including sea and air transport)",3,
      line = 1, cex = 2.2, family = "Inter Black", adj = 0,
      outer = T, )
mtext("Shares of energy sources in the primary energy suppy* in percent, 2008",3,
      line = -1.75, cex = 1.7, family = "Inter Thin", font = 3, adj = 0,
      outer = T)

mtext("* Primary energy sources = primary energy production + imports - exports +/- stock changes",1,
      line = 0, cex = 1.02, family = "Inter Thin", adj = 0,
      outer = T)
mtext("** Including peat",1,
      line = 1.1, cex = 1.02, family = "Inter Thin", adj = 0,
      outer = T)
mtext("*** Bio matter, biodegradable waste (excluding industrial waste), water power, geothermal energy, solar, wind, and marine power. ",1,
      line = 2.2, cex = 1.02, family = "Inter Thin", adj = 0,
      outer = T)
mtext("*** Industrial waste and flammable waste that can serve as energy sources and are non-biodegradable",1,
      line = 3.3, cex = 1.02, family = "Inter Thin", adj = 0,
      outer = T)


mtext("Source: Germen Federal Agency for Civic Education: keyword 'Enegiemix' [energy mix], www.bpb.de",1,
      line = 7, cex = 1.25, family = "Inter Thin",font = 3, adj = 1,
      outer = T)




#! 3 is italics
#! more the line higher the text, counting starts from inwards
#! use *outer* margins if available


while (length(dev.list())){
    dev.off()
}






