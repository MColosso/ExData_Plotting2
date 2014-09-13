## Course Project 2 - Plot 5

## Question: How have emissions from motor vehicle sources changed from
## 1999 to €“2008 in Baltimore City?

  verbose <- FALSE     ## Don't display step messages

  require(ggplot2)

# Read datafiles
  source("load_data.R")

# Select motor vehicle sources
  CCR <- SCC[grepl("[Vv]ehicle", SCC$SCC.Level.Two), ]
  
# Calculate total emissions by year
  NEI.vehicle <- NEI[NEI$SCC %in% CCR$SCC & NEI$fips == "24510", ]
  emissions <- ddply(NEI.vehicle, .(year), summarize, total = sum(Emissions))
  
# Select year labels (X axis breaks)
  year.breaks <- unique(emissions$year)
  
# Generate plot
  qplot(year, total, data=emissions) +
    scale_x_continuous(breaks=year.breaks) +
    geom_point(col="blue") +
    geom_line(col="blue") +
  #  geom_smooth(method="lm", se=FALSE, col="steelblue") +
    ggtitle("Emissions from motor vehicle sources in Baltimore, MD") +
    xlab("Source: Environmental Protection Agency (EPA)") +
    ylab(expression("Total emissions (tons of " * PM[2.5] * ")"))
  
# Save plot
  ggsave(filename="plo5.png")
  
  if(verbose) message("MSG: plot5.png is ready")
