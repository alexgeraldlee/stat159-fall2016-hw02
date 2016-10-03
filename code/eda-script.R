
library(readr)

advertising <- read.csv("../data/Advertising.csv")

#make histograms and store them in appropriate files
png('../images/histogram-tv.png')
hist(advertising$TV, main = "Histogram of TV Budget", 
     xlab = "TV Budget (in thousands of dollars)")
dev.off()

pdf('../images/histogram-tv.pdf')
hist(advertising$TV, main = "Histogram of TV Budget", 
     xlab = "TV Budget (in thousands of dollars)")
dev.off()

png('../images/histogram-sales.png')
hist(advertising$Sales, main = "Histogram of Sales", 
     xlab = "Sales (in thousands of units)")
dev.off()

pdf('../images/histogram-sales.pdf')
hist(advertising$Sales, main = "Histogram of Sales", 
     xlab = "Sales (in thousands of units)")
dev.off()


#get summary statistics
tv_summ <- summary(advertising$TV)
sales_summ <- summary(advertising$Sales)

#build eda-output.txt file
sink("../data/eda-output.txt", append = T)
cat(c("Summary Statistics for TV\n"),
    file = "../data/eda-output.txt", sep = "\n")
tv_summ

cat("\nSummary Statistics for Sales\n",
    file = "../data/eda-output.txt", sep = "\n", append = T)
sales_summ
sink()

