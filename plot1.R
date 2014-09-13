## Course Project 2 - Plot 1

## Question: Have total emissions from PM2.5 decreased in the United States
## from 1999 to 2008? Using the base plotting system, make a plot showing the
## total PM2.5 emission from all sources for each of the years 1999, 2002,
## 2005, and 2008.

verbose <- FALSE     ## Don't display step messages

# Read datafiles
  source("load_data.R")

# Calculate total emissions by year
  emissions <- ddply(NEI, .(year), summarize, total = sum(Emissions))

# Generate plot, correcting X axis display
  png(filename="plo1.png")

  plot(x=1:nrow(emissions), y=emissions$total, type="b", pch=19, lwd=2, col="blue",
       main=expression("" * PM[2.5] * " emissions in USA"),
       sub="Source: Environmental Protection Agency (EPA)",
       xlab="", ylab=expression("Total emissions (tons of " * PM[2.5] * ")"),
       axes=FALSE)
  axis(1, at=1:nrow(emissions), labels=emissions$year)  ## X axis
  axis(2)                                               ## Y axis
  box()                                                 ## Close margins

  dev.off()

  if(verbose) message("MSG: plot1.png is ready")
