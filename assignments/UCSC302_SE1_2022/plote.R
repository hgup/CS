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



# flush the changes in pdf/views.pdf
dev.off()