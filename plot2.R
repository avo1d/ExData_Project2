plot2 <- function() {
    require(data.table)
    
    ## This first line will likely take a few seconds. Be patient!
    NEI <- readRDS("summarySCC_PM25.rds")
    SCC <- readRDS("Source_Classification_Code.rds")
    
    # Convert NEI to data.table & subset data for Baltimore, fips == "24510"
    NEI.dt <- data.table(NEI)
    
    # Use list() to get sum of emissions by year subsetted by fips == "24510"
    y <- NEI.dt[NEI.dt$fips == "24510",][,list(Emissions=sum(Emissions)), by='year']    
    
    png(filename = "plot2.png", width = 480, height = 480)
    barplot(y$Emissions, 
            ylab="Emissions", 
            xlab="Year", 
            main="Total Emissions in Baltimore by Year",
            names.arg=c("1999","2002","2005","2008"), 
            ylim=c(0,4000), 
            axis.lty=1)        
    dev.off()
    
}