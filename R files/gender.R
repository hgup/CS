pdf_file <- "pdf/gender.pdf"
cairo_pdf(pdf_file, bg = "#eff2fb", width = 9, height = 6.5)

par(omi = c(0.65, 0.25, 0.75, 0.75)+0.2,
    mai = c(0.3,2,0.35,0),
    mgp = c(3,3,0),
    family = "Inter Light",
    las = 1)

library(readxl)
women <- read_excel("data_files/responses_from_women.xlsx")

attach(women)

x <- barplot( Percent, names.arg = F, horiz = T, border = NA,
              xlim = c(0,100), col = "#272727", cex.names = 0.85, axes = F)

max_per <- max(Percent)
highlight <- c()

# Labels
for (i in 1: length(Attitude)){
  if (Percent[i] == max_per) { highlight <- c(highlight,Percent[i]) }
  else { highlight <- c(highlight, 0) }
}

x_hi <- barplot( highlight, names.arg = F, horiz = T, border = NA,
              xlim = c(0,100), col = "#2B50AA", cex.names = 0.85, axes = F, add = T)

# Labels
for (i in 1: length(Attitude)){
  if (Percent[i] == max_per)
  {
    myfont = "Inter Regular"
    highlight <- c(highlight,Percent[i])
  }
  else
  {
    myfont = "Inter Thin"
    highlight <- c(highlight, 0)
  }
  text(4.5, x[i], Percent[i], xpd = F, adj = 0, col= 'white', cex = 0.8, family = "Inter Light")
  text(-1.5, x[i],paste(strwrap(Attitude[i],width = 40),collapse = '\n'), xpd = NA, adj = 1, cex = 0.65, family = myfont)
  
}

# Rects
for (i in 1:5){
  if (i %% 2 == 1)
    { myalpha <- 40 } else { myalpha <- 70}
  rect((i-1)*20,0,i*20,10, col = rgb(136,229,240,myalpha, maxColorValue = 255), border = NA)
}

# Arrows and stuff
arrows(50,-0.15,50,9.15, 0, xpd = NA, col="#379c92", lwd = 1.5)
arrows(50,-0.15,50,0.1, 0, xpd = NA, col="#17301c", lwd = 3)
arrows(50,8.90,50,9.15, 0, xpd = NA, col="#17301c", lwd = 3)
text(48,9.048, "Majority", font = 3,family= "Inter Thin", adj = 1, xpd = T, cex = 0.7)
text(52,9.05, "50%", font = 1,family= "Inter Regular", adj = 0, xpd = T, cex = 0.7)
text(100,9.05, "all values in %", font = 1,family= "Inter Thin", adj = 1, xpd = T, cex = 0.6)

mtext(c(0,20,40,60,80,100), at = c(0,20,40,60,80,100), 1, line = 0, cex = 0.80)

mtext("It is often said that attitudes towards gender roles are changing",3, font=4, line = 1.6,
      adj = 0, cex = 1.2, family = "Inter Black", outer = T)

mtext("Agree strongly/ agree",3, font = 2, adj = 0, cex = 1, family = "Inter Thin", outer = T)
mtext("Source: The voices in my head. Docs: https://hgup.github.io/cs",1, font = 3, adj = 1, cex = 0.6, family = "Inter Light", outer = T)


detach(women)

dev.off()

