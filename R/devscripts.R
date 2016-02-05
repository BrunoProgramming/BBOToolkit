# Script contains intermediate development of bbotools.

library(data.table)
library(timeDate)
corn_large <- bboread('C:/Users/mallorym/BBOCORNDATA/2012Jan-2013Nov_txt/BBO_CBT_20120102-20131130_9552_00.txt')

corn_large <- as.data.table(corn_large)
setkey(corn_large, TradeDate)

corn_large[, "TradeDate" := as.IDate(as.character(corn_large$TradeDate), format = "%Y%m%d")]
as.IDate("20131129", format = "%Y%m%d")

table <- corn_large[, .N, by=.(TradeDate,ASKBID)]
