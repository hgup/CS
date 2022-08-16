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

attach(sort.ipsos) #Attach the database to use `Country` instead of `ipsos$Country`


# Create Chart
x <- barplot( Percent, names.arg = F, horiz = T, border = NA,
              xlim = c(0,100), col = "grey", cex.names = 0.85, axes = F)

# Label Chart

for (i in 1: length(Country))
{
  if (Country[i] %in% c("Germany", "Brasil"))
  {myFont <- "Inter Black"} else {myFont <- "Inter Light"}
  text(-8, x[i], Country[i], xpd = T, adj = 1, cex = 0.85, family= myFont)
  text(-3.5, x[i], Percent[i], xpd = T, adj = 1, cex = 0.85, family= myFont)
}

detach(sort.ipsos)
dev.off()


