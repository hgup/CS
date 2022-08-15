barplot(c(3,7),
    main = "This is the main Title",
    xlab = "X axis label",
    ylab = "Y axis label",
    sub = "Subtext for the bar graph",
    col.main = "red",
    col.lab = "green",
    col.sub = "black"
)

barplot(c(3,7),
    main = "Main Title",
    xlab = "X axis",
    ylab = "Y axis",
    sub = "Subtitle",
    font.main = 2,
    font.lab = 3,
    font.sub = 4)

barplot(c(3,7),
        main = "Main Title",
        xlab = "X axis",
        ylab = "Y axis",
        sub = "Subtitle",
        font.main = 2,
        font.lab = 3,
        font.sub = 4
)

x <- 1:10; y <- x**3
plot(x,y,
     main = "This is the main Title",
     xlab = "X axis label",
     ylab = "Y axis label",
)

plot(x,y, main = "", xlab="", ylab="",
     col.axis="blue")
title(main = "The Cubes", sub = "This is how we add titles using title()",
      xlab = "numbers", ylab = "their cubes",
      cex.main = 2,   font.main= 4, col.main= "red",
      cex.sub = 0.75, font.sub = 3, col.sub = "green",
      col.lab ="darkblue"
)

par(
  # Change the colors
  col.main="blue", col.lab="blue", col.sub="black",
  # Titles in italic and bold
  font.main=4, font.lab=4, font.sub=4,
  # Change font size
  cex.main=2, cex.lab=1.7, cex.sub=1.2
)

# To test the changes
barplot(c(2,5), main="Simple Barplot",
    	xlab="X axis ",
    	ylab="Y axis ",
    	sub="Sub title")


legend(2, 4, legend=c("Line 1", "Line 2"),
       col=c("red", "blue"), lty=1:2, cex=0.8,
       box.lty=2, box.lwd=2, box.col="green")

