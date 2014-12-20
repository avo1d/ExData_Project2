plot1 <- function() {
    require(data.table)
   
    ## This first line will likely take a few seconds. Be patient!
    NEI <- readRDS("summarySCC_PM25.rds")
    SCC <- readRDS("Source_Classification_Code.rds")
    
    # Convert NEI to data.table
    NEI.dt <- data.table(NEI)
    
    # Use list() to get sum of emissions by year
    x <- NEI.dt[, list(Emissions=sum(Emissions)), by='year']
    png(filename = "plot1.png", width = 480, height = 480)
    barplot(x$Emissions, 
            ylab="Emissions", 
            xlab="Year", 
            main="Total Emissions by Year",
            names.arg=c("1999","2002","2005","2008"), 
            ylim=c(0,8000000), 
            axis.lty=1)        
    dev.off()
    
}