## Course Project 2 - Plot 3

## Question: Of the four types of sources indicated by the type (point,
## nonpoint, onroad, nonroad) variable, which of these four sources have
## seen decreases in emissions from 1999–2008 for Baltimore City? Which
## have seen increases in emissions from 1999–2008? Use the ggplot2 plotting
## system to make a plot answer this question.

  verbose <- FALSE     ## Don't display step messages
  
  require(ggplot2)

# Read datafiles
  source("load_data.R")

# Calculate total emissions by year
  Baltimore <- NEI[NEI$fips == "24510", ]
  emissions <- ddply(Baltimore, .(year, type), summarize, total = sum(Emissions))

# Calculate X axis breaks
  year.breaks <- unique(emissions$year)
  
# Generate plot
  qplot(year, total, data=emissions) +
    facet_grid(. ~ type) +
    scale_x_continuous(breaks=year.breaks) +
    geom_point(col="blue") +
    geom_line(col="blue") +
#    geom_smooth(method="lm", se=FALSE, col="steelblue") +
    ggtitle(expression("" * PM[2.5] * " emissions in Baltimore, MD, by type")) +
    xlab("Source: Environmental Protection Agency (EPA)") +
    ylab(expression("Total emissions (tons of " * PM[2.5] * ")"))

# Save plot
  ggsave(filename="plo3.png")
  
  
  if(verbose) message("MSG: plot3.png is ready")
  