## Course Project 2 - Plot 6

## Question: Compare emissions from motor vehicle sources in Baltimore City
## with emissions from motor vehicle sources in Los Angeles County, California
## (fips == "06037"). Which city has seen greater changes over time in motor
## vehicle emissions?

  verbose <- FALSE     ## Don't display step messages

  require(ggplot2)

# Read datafiles
  source("load_data.R")

# Select motor vehicle sources
  CCR <- SCC[grepl("[Vv]ehicle", SCC$SCC.Level.Two), ]
  
# Calculate total emissions by year
  NEI.vehicle <- NEI[NEI$SCC %in% CCR$SCC & (NEI$fips == "24510" | NEI$fips == "06037"), ]
  emissions <- ddply(NEI.vehicle, .(year, fips), summarize, total = sum(Emissions))

# Transform facet labels
  emissions[emissions$fips == "24510", ]$fips <- "Baltimore"
  emissions[emissions$fips == "06037", ]$fips <- "Los Angeles"
  
# Select year labels (X axis breaks)
  year.breaks <- unique(emissions$year)
  
# Generate plot
  qplot(year, total, data=emissions) +
    facet_grid(. ~ fips) +
    scale_x_continuous(breaks=year.breaks) +
    geom_point(col="blue") +
    geom_line(col="blue") +
#    geom_smooth(method="lm", se=FALSE, col="steelblue") +
    ggtitle("Emissions from motor vehicle sources in Baltimore and Los Angeles") +
    xlab("Source: Environmental Protection Agency (EPA)") +
    ylab(expression("Total emissions (tons of " * PM[2.5] * ")"))
  
# Save plot
  ggsave(filename="plo6.png")
  
  if(verbose) message("MSG: plot6.png is ready")
