plot6 <- function() {
    require(ggplot2)
    
    ## This first line will likely take a few seconds. Be patient!
    NEI <- readRDS("summarySCC_PM25.rds")
    SCC <- readRDS("Source_Classification_Code.rds")
        
    # Subsetting data for LA County & Baltimore (fips == 06037 & 24510)
    NEI.BL <- NEI[NEI$fips %in% c("24510","06037"),]
    
    # Add Factor levels to $fips
    # Rename fips levels to LA County & Baltimore
    # Select only type == "ON-ROAD" which accounts for motor car emissions
    NEI.BL$fips<-factor(NEI.BL$fips) 
    levels(NEI.BL$fips) <- c("LA County", "Baltimore")
    x <- NEI.BL[NEI.BL$type == "ON-ROAD",]
    
    # ggplot with facets for fips (LA County vs Baltimore)
    png(filename = "plot6.png", width = 480, height = 480)
    print(
        ggplot(x, aes(y=Emissions, x=year)) + 
        geom_bar(stat="identity") + 
        facet_grid(.~fips) + 
        scale_x_continuous(breaks=c(1999,2002,2005,2008)) +
        labs(title = "Motor Car Emission in LA County & Baltimore", x = "Year", y = "Emissions")
    )
    dev.off()
}