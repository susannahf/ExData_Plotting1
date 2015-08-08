# load data on two dates of interest: 1 & 2 Feb 2007
# starts on line 66638 and goes to line 69517
# header
h <- read.table("../household_power_consumption.txt",sep=";",nrow=1,header=T)
# data
dat <- read.table("../household_power_consumption.txt", header=F,na.strings = "?",
                  sep = ";",nrow=2880,skip=66637,col.names=colnames(h))

# draw histogram
png("plot1.png",480,480,units="px",bg="transparent")
hist(dat$Global_active_power,col="red",main="Global Active Power",
     xlab="Global Active Power (kilowatts)")
dev.off()