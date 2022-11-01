# sites: https://dash.plotly.com/r/installation ; https://plotly.com/r/gantt/
#install.packages("remotes")
#remotes::install_github("plotly/dashR", upgrade = "always")

install.packages('reticulate')
reticulate::install_miniconda()
reticulate::conda_install('r-reticulate', 'python-kaleido')
reticulate::conda_install('r-reticulate', 'plotly', channel = 'plotly')
reticulate::use_miniconda('r-reticulate')


#pdf_file <- "output/gantt/plot1.pdf"
#cairo_pdf(pdf_file,width = 11,height =8, bg= "grey98")

library(plotly)

# Read in data
df <- read.csv("data/raw/gantt-tasks.csv", stringsAsFactors = F)

# Convert to dates
df$Start <- as.Date(df$Start, format = "%m/%d/%Y")

# Sample client name
client = "Sample Client"

# Choose colors based on number of resources
cols <- RColorBrewer::brewer.pal(length(unique(df$Resource)), name = "Set3")
df$color <- factor(df$Resource, labels = cols)

# Initialize empty plot
fig <- plot_ly()

# Each task is a separate trace
# Each trace is essentially a thick line plot
# x-axis ticks are dates and handled automatically

for(i in 1:(nrow(df) - 1)){
  fig <- add_trace(fig,
     x = c(df$Start[i], df$Start[i] + df$Duration[i]),  # x0, x1
     y = c(i, i),  # y0, y1
     mode = "lines",
     line = list(color = df$color[i], width = 20),
     showlegend = F,
     hoverinfo = "text",
     
     # Create custom hover text
     
     text = paste("Task: ", df$Task[i], "<br>",
                  "Duration: ", df$Duration[i], "days<br>",
                  "Resource: ", df$Resource[i]),
     
     evaluate = T  # needed to avoid lazy loading
  )
}

kaleido(fig, "output/gantt/plot1.pdf")
