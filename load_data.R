## Course Project 2 - Common code
##
## Download the National Emissions Inventory (NEI), unzip PM2.5 Emissions Data
## (all Fine particulate matter -PM2.5- emissions data for 1999, 2002, 2005,
## and 2008) and the Source Classification Code Table (a mapping from the SCC
## digit strings int he Emissions table to the actual name of the PM2.5 source)

  require(plyr)   ## Load library plyr

# Define constants
  data.folder  <- "./data"
  zipfileURL   <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
  zip.file     <- paste(data.folder, "/", "exdata Fdata FNEI_data.zip", sep="")
  summary.file <- paste(data.folder, "/", "summarySCC_PM25.rds", sep="")
  source.file  <- paste(data.folder, "/", "Source_Classification_Code.rds", sep="")

# Create data directory
  if(!file.exists(data.folder)) {
    if(verbose) message("MSG: Creating data directory")
    dir.create(data.folder)
  }

# Download PM2.5 Emmisions Data and Source Classification Code Table
  if(!file.exists(zip.file)) {
    if(verbose) message("MSG: Downloading zip file")
    download.file(zipfileURL, destfile=zip.file)
    unzip(zip.file, exdir=data.folder)
  }
  
# Read datafiles
  if(!exists("NEI")) {
    if(verbose) message("MSG: Reading datafiles")
    NEI <- readRDS(summary.file)
    SCC <- readRDS(source.file)
  }
