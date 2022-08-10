#To Learn
#1) Creation of data
#2)Plotting and its breakdown in terms of parameters and sequence of commands. 
#3) How to create a file on disk to plot and how to write and save the plot to  that file
#4) Explot the zoom and export tabs on the plot window in the left bottom of the environment

###################################################################
#open an image file, be it pdf, png, jpeg, ps, bmp or a windows metafile
#give an appropriate path
pdf(".\\sample_data.pdf")

#png("myRplot.png")
#jpeg("myRplot.jpg")
#postscript("myRplot.ps")
#bmp("myRplot.bmp")
#win.metafile("myRplot.wmf")

#this is a simple plot ... curious case

age <- c(1, 5, 10, 15, 20, 25, 30, 35,40,45,50,55,60,65,70)
weight <- c(3,10,25,35,45,55,60,65,70,75,55,50,40,30,20)
length(weight)
length(age)

#different ways we can plot
plot(weight,type = "o")
plot(age,weight,type = "o")
plot(age,weight)
#linear regression model lm() ... abline() just draws line
abline(lm(age ~ weight))
#one more way of looking at it
plot(weight,type = "o",col = "blue", xlab = "Index", ylab = "Weight and age", 
     main = "Weight age variation")
lines(age, type = "o", col = "green")


########################################################
#barplotting
marks <- c(42, 37, 35, 44, 33, 31, 39)
barplot(marks)
# we can add some additional information
barplot(marks,
        main = "Progress report",
        xlab = "Marks",
        ylab = "Subject",
        names.arg = c("Eng", "Hin", "Math", "Sci", "Soc", "Games", "Cul"),
        col = "green",
        horiz = TRUE)


datavismarks <- c(44,44,44,34,35,36,37,32,32,32,35,36,37)
table(datavismarks)
barplot(table(datavismarks),
        main="Datavis marks of 13 students",
        xlab="Marks",
        ylab="Frequency",
        border="blue",
        col="red",
        density=10
)

#####################################################
#histogram
# You can open a file for writing before the plot
#png(file = "firsthistogram.png")

# Create the histogram.
hist(datavismarks,xlab = "Marks",col = "green",border = "red", xlim = c(0,50), ylim = c(0,4))

# After plotting, use this command to finish writing and save file.
dev.off() 
#after this command is executed, go and open the file on disk.
######################################################
