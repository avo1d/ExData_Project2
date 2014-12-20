plot4 <- function() {
    require(data.table)
    
    ## This first line will likely take a few seconds. Be patient!
    NEI <- readRDS("summarySCC_PM25.rds")
    SCC <- readRDS("Source_Classification_Code.rds")
    
    # Convert NEI to data.table & subset data for Baltimore, fips == "24510"
    NEI.dt <- data.table(NEI)
    
    # Searching for all Short.Name with Coal and then Comb
    SCC.coal <- SCC[grep("Coal", ignore.case = TRUE, SCC$Short.Name),]
    SCC.coal.comb <- as.character(SCC.coal[grep("Comb", ignore.case = TRUE, SCC.coal$Short.Name),1])
    
    # Subsetting NEI dataset for those matching Coal Combustion
    NEI.coal <- subset(NEI.dt, NEI.dt$SCC %in% SCC.coal.comb)
    
    # Use list() to get sum of emissions by year
    x <- NEI.coal[,list(Emissions=sum(Emissions)), by='year']   
    
    png(filename = "plot4.png", width = 480, height = 480)
    barplot(x$Emissions, 
            ylab="Emissions", 
            xlab="Year", 
            main="Total Emissions by Coal Combustion",
            names.arg=c("1999","2002","2005","2008"), 
            ylim=c(0,600000), 
            axis.lty=1)        
    dev.off()
    
}