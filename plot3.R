# load data on two dates of interest: 1 & 2 Feb 2007
# starts on line 66638 and goes to line 69517
# header
h <- read.table("../household_power_consumption.txt",sep=";",nrow=1,header=T)
# data
dat <- read.table("../household_power_consumption.txt", header=F,na.strings = "?",
                  sep = ";",nrow=2880,skip=66637,col.names=colnames(h),
                  stringsAsFactors = F)

# sort out timing
dat$DateTime <- strptime(paste(dat$Date,dat$Time),format="%d/%m/%Y %H:%M:%S")

# create plot
png("plot3.png",480,480,units="px",bg="transparent")
plot(dat$DateTime,dat$Sub_metering_1,type="l",col="black",
     xlab="",ylab="Energy sub metering")
lines(dat$DateTime,dat$Sub_metering_2,type="l",col="red")
lines(dat$DateTime,dat$Sub_metering_3,type="l",col="blue")
legend("topright",legend=colnames(h)[7:9],lty=c(1,1,1),col=c("black","red","blue"))
dev.off()
