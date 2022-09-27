

pdf_file <- "pdf/.pdf"

cairo_pdf(bg = "grey98", pdf_file, width= 11, height = 11)




while (length(dev.list())){
    dev.off()
}