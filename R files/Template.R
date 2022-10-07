

pdf_file <- "pdf/.pdf"

cairo_pdf(bg = "grey98", pdf_file, width= 11, height = 11)


library(RColorBrewer)

# brewer.pal(length(pie.myData),<brwer.pal.info>)


#! LEGEND

par(xpd = T)
items <- c(
  "",
)
legend(1,0.5,items, border=F,
pch=15, col=c("black", "red", "yellow", "pink", "green"),
bty="n",cex=0.7, xpd=NA, ncol=3)
par(xpd = F)


while (length(dev.list())){
    dev.off()
}