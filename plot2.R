## Course Project 2 - Plot 2

## Question: Have total emissions from PM2.5 decreased in the Baltimore City,
## Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system
## to make a plot answering this question.

verbose <- FALSE     ## Don't display step messages

# Read datafiles
  source("load_data.R")

# Calculate total emissions by year
  Baltimore <- NEI[NEI$fips == "24510", ]
  emissions <- ddply(Baltimore, .(year), summarize, total = sum(Emissions))
  
# Generate plot, correcting X axis display
  png(filename="plo2.png")
  
  plot(x=1:nrow(emissions), y=emissions$total, type="b", pch=19, lwd=2, col="blue",
       main=expression("" * PM[2.5] * " emissions in Baltimore, MD"),
       sub="Source: Environmental Protection Agency (EPA)",
       xlab="", ylab=expression("Total emissions (tons of " * PM[2.5] * ")"),
       axes=FALSE)
  axis(1, at=1:nrow(emissions), labels=emissions$year)  ## X axis
  axis(2)                                               ## Y axis
  box()                                                 ## Close margins
  
  dev.off()
  
  if(verbose) message("MSG: plot2.png is ready")
