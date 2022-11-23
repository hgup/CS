library(readxl)
my_data <- read_excel("data/raw/DDW_B18sc_3400_NIC_FINAL_STATE_PUDUCHERRY-2011.xls")

pdf_file<-"output/plot3.pdf"
cairo_pdf(bg="grey98", pdf_file, width=14, height=6.5)

library(plotrix)
library(RColorBrewer)

par (omi=c(0.5,0.5,1,0.5),mai=c(0,0,0,0.1)+0.2,xpd=T,mfcol=c(1,4),
     family="Inter Light", las=1) 
# Import data
labelling <- c("State Puducherry", "District Yanam", "District Puducherry", "District Karaikal")
colors <- c("Blues", "Reds","Greens","YlGn")

# Get the data

total_data <- subset(my_data, subset = my_data$`NIC Name` == "Total" & !(my_data$`District Code` %in% "`636"))

x <- c(t(total_data[9]))
y <- c(t(total_data[10]))

# Define charts and other elements

for(i in c(1:4)){
  plot(1:4, type="n", axes=F, xlab="", ylab="")
  values<-c(x[i]-y[i],y[i])
  myCircle<-floating.pie(2.6,3,values, border="white",
                         radius=1.7*sqrt(x[i]/max(x)),
                         col=brewer.pal(3,colors[i])[2:3])
  
  pie.labels(2.8,3,myCircle,values, bg=NA, border=NA, radius=x[i]/max(x)+0.4,cex=2.1, col="#000000")
  if (i==1) pie.labels(2.5,3,myCircle,c("women","men"),
                       bg=NA,border=NA,cex = 2, radius=1.85, font=3)
  text(3,4.7, cex=2,adj=0.5, col = "#000000",
       paste(format(round(100*y[i]/x[i],1),nsmall=1),"%",sep=" "))
  text(3,1.2, labelling[i],cex=2,adj=0.5 ,col = "#000000")
}

mtext("Total Workers in State Puducherry",3,line=3,adj=0, family="Inter Black",
      outer=T, cex=2)
mtext("The Significant districts",3, line=0, adj=0,
      cex =1.35, font=2, outer=T)
mtext("Source: www.nic.in",1, line=2,
      adj=1.0, cex=1.1, font=3, outer=T)

while (length(dev.list())){
  dev.off()
}