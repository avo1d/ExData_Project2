plot3 <- function() {
    require(ggplot2)
    
    ## This first line will likely take a few seconds. Be patient!
    NEI <- readRDS("summarySCC_PM25.rds")
    SCC <- readRDS("Source_Classification_Code.rds")
    
    # Subsetting Baltimore data
    NEI.B <- NEI[NEI$fips=="24510",]
    
    
    # Plotting by geom_bar automatically gets total
    png(filename = "plot3.png", width = 480, height = 480)
    print(
        ggplot(NEI.B, aes(y=Emissions, x=year)) +
        geom_bar(stat="identity") + 
        facet_grid(.~type) + 
        scale_x_continuous(breaks=c(1999,2002,2005,2008)) +
        labs(title = "Emissions by Type in Baltimore", x = "Year", y = "Emissions")
    )
    dev.off()
}