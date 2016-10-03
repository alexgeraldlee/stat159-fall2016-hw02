
library(readr)
advertising <- read.csv('../data/Advertising.csv')

#perform the lm() regression
ad_reg <- lm(formula = Sales ~ TV, data = advertising)

ad_summ <- summary(ad_reg)

save(ad_reg, ad_summ, file = '../data/Regression.RData')

png('../images/scatterplot-tv-sales.png')
plot(advertising$TV, advertising$Sales,
     main = "Scatterplot of TV Budget vs Sales",
     xlab = "TV Budget (in thousands of dollars)",
     ylab = "Sales (in thousands of units)")
abline(ad_reg, col = "blue")
dev.off()

pdf('../images/scatterplot-tv-sales.pdf')
plot(advertising$TV, advertising$Sales,
     main = "Scatterplot of TV Budget vs Sales",
     xlab = "TV Budget (in thousands of dollars)",
     ylab = "Sales (in thousands of units)")
abline(ad_reg, col = "blue")
dev.off()