plot5 <- function() {
    require(data.table)
    
    ## This first line will likely take a few seconds. Be patient!
    NEI <- readRDS("summarySCC_PM25.rds")
    SCC <- readRDS("Source_Classification_Code.rds")
    
    # Subsetting Baltimore data
    NEI.dt.B <- data.table(NEI[NEI$fips=="24510",])
    
    # Subsetting type == "ON-ROAD" data (which corresponds to vehicle emissions)
    x <- NEI.dt.B[NEI.dt.B$type == "ON-ROAD"][, list(Emissions=sum(Emissions)), by="year"]

    # Plotting by geom_bar automatically gets total
    png(filename = "plot5.png", width = 480, height = 480)
    barplot(x$Emissions, 
            ylab="Emissions", 
            xlab="Year", 
            main="Motor Car Emissions in Baltimore",
            names.arg=c("1999","2002","2005","2008"), 
            ylim=c(0,400), 
            axis.lty=1)    
    dev.off()
}