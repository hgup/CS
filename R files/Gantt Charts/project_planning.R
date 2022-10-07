


pdf_file <- "pdf/project_planning.pdf"

cairo_pdf(bg = "grey98", pdf_file, width= 12, height = 8.3)

par (lend=1, omi=c(0.25,1,1,0.25),mai=c(1,1.85,0.25,2.75), family="Inter Light", las=1)



library(RColorBrewer)
brewed <- brewer.pal(6,"Pastel1")
c0 <- brewed[1]
c1 <- brewed[2]
c2 <- brewed[3]
c3 <- brewed[4]
c4 <- brewed[5]
c5 <- brewed[6]
myColour<-c(c0,c1,c1,c1,c0,c0,c2,c2,c2,c2,c0,c0,c3,c3,c3,c0,c0,
            c4,c4,c4,c0,c0,c5)

library(readxl)
mySchedule <- read_excel("datafiles/project_planning.xlsx")
n <- nrow(mySchedule)

myScheduleData <- subset(mySchedule, nchar(as.character(mySchedule$from))>0)

dates <- as.Date(as.matrix(myScheduleData[,c('from','to')]))

myBegin <- min(dates)
myEnd <- max(dates)
attach(mySchedule)
plot(from,1:n, type="n", axes = F, xlim = c(myBegin,myEnd), ylim = c(n,1))
for (i in 1:n)
{
  MyGroup <- nchar(as.character(Group[i]))
  if(MyGroup > 0 | is.na(MyGroup)){
    text(myBegin - 2, i, Group[i], adj = 1, xpd = T, cex = 1.25)
  }
  else if (nchar(as.character (what[i]))>0){
    X1<-as.Date(mySchedule[i,'from' ])
    x2<-as.Date(mySchedule[i,'to' ])
    x3<-x1+( (x2-x1)*mySchedule[i,'done' ]/100)
    x<-c(x1, x2)
    x_done <- c(x1,x3)
    y <- c(i,i)
    segments(myBegin, i , myEnd, i , col = 'grey')
    lines(x,y,lwd = 20, col = myColour[i])
    points(myEnd + 90, i, cex = (mySchedule[i,'Persons']*mySchedule[i,'Duran'])**0.5,
           pch = 19, col = rgb(110,110,110,50,maxColorValue = 255),xpd = T)
    if (x3-x1 > 1){ lines(x_done, y, lwd = 20, col = myColour_done)}
    if (mySchedule[i,'PAG'] > 0)
  {
    x4 <- as.Date(mySchedule[i,'AG_from'])
    x5 <- as.Date(mySchedule[i,'AG_to'])
    x_ag <- c(x4,x5)
    rect(x4,i - 0.75, x5, i + 0.75, lwd = 2)
  }
  text(myBegin - 2, i, what[i], adj = 1, xpd = T, cex = 0.75)
  text(myEnd + 25, i, paste(done[i], "%", sep = " "), adj = 1, xpd = T, cex = 0.75)
  text(myEnd + 35, i,
      paste(format(x1,format = "%d/%m/%y"),"-",format(x1,format = "%d/%m/%y"),sep = " "),
      adj = 0, xpd = T, cex = 0.75)
  }
  else # MileStone
  {
    x3 <- as.Date(mySchedule[i,'when'])
    myHalf <- (myEnd-myBegin)/2
    if (x3 - x1 < myHalf)
  {
    points(as.Date(mySchedule[i,'when']) + 5, i, Milestone[i],adj = 0,xpd= T, cex = 0.75)
    text(as.Date(mySchedule[i,'when' ])-5,1,Milestone[i], adj=1, xpd=T, cex=0.7)
  }
  }
}
axis(3, at=c(myBegin, myEnd), labels=c( format (myBegin, format="%d/%m/%Y"),
format (myEnd, format="%d/%n/%Y")))
myToday<-as.Date("15.08.2012", "%d.%m.%Y")
abline(v=myToday)
mtext ("today",1,line=0, at=myToday )
# Titling
mtext("Project plan",3, line=2,adj=0,cex=2.25, family="Lato Black" ,outer=T)
mtext(paste("planning status: ",format(myToday, format="%d/%n/%y"),sep=""),
      1,line=4, at=myEnd+20, cex=1.25, font=3)
rect(myBegin-36, n+5, myBegin, n+4, xpd=T, lwd=2)
text(myBegin-35, n+4.5, "Box: Client",xpd=T, adj=0)
detach(mySchedule)

while (length(dev.list())){
    dev.off()
}