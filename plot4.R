## Course Project 2 - Plot 4

## Question: Across the United States, how have emissions from coal
## combustion-related sources changed from 1999 to €“2008?

  verbose <- FALSE     ## Don't display step messages

  require(ggplot2)

# Read datafiles
  source("load_data.R")

# Select coal combustion-related sources
  CCR <- SCC[grepl("[Cc]ombustion", SCC$SCC.Level.One), ]
  CCR <- CCR[grepl("[Cc]oal", CCR$SCC.Level.Three), ]

# Calculate total emissions by year
  NEI.coil.related <- NEI[NEI$SCC %in% CCR$SCC, ]
  emissions <- ddply(NEI.coil.related, .(year), summarize, total = sum(Emissions))
  
# Select year labels (X axis breaks)
  year.breaks <- unique(emissions$year)
  
# Generate plot
  qplot(year, total, data=emissions) +
    scale_x_continuous(breaks=year.breaks) +
    geom_point(col="blue") +
    geom_line(col="blue") +
#    geom_smooth(method="lm", se=FALSE, col="steelblue") +
    ggtitle("USA emissions from coal combustion-related sources") +
    xlab("Source: Environmental Protection Agency (EPA)") +
    ylab(expression("Total emissions (tons of " * PM[2.5] * ")"))
  
# Save plot
  ggsave(filename="plo4.png")
  
  
  if(verbose) message("MSG: plot4.png is ready")
  