pdf_file <- "pdf/believe.pdf"
cairo_pdf(pdf_file, bg = "grey98", width = 9, height = 6.5)

par(omi = c(0.65, 0.25, 0.75, 0.75),
    mai = c(0.3,2,0.35,0),
    mgp = c(3,3,0),
    family = "Lato Light",
    las = 1)

# install.packages("gdata", dependencies = TRUE, repos = "http://cran.studio.com")
# library(gdata)

# Import data and prepare chart
library(readxl)
ipsos <- read_excel("data_files/ipsos.xlsx")
sort.ipsos <- ipsos[order(ipsos$Percent),]
attach(sort.ipsos)


# Create Chart
x <- barplot( Percent, names.arg = F, horiz = T, border = NA,
              xlim = c(0,100), col = "grey", cex.names = 0.85, axes = F)

# Label Chart

for (i in 1: length(Country))
{
  if (Contry[i] %in% c("Germany", "Brasil"))
}
dev.off()
