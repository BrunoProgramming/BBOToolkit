



corn_110110 <- read_fwf('data-raw/XCBT_C_FUT_110110.TXT', fwf_widths(c(8,6,8,1,3,1,4,5,7,1,7,1,1,1,1,1,1,2,1,1,1,1,1,6 ),
                        col_names = c("TradeDate", "TradeTime", "TradeSeq#", "SessionInd",
                                          "TickerSym", "FOIInd", "DeliveryDate", "TrQuantity",
                                          "Strike Price", "StrikePrDecLoc", "TrPrice", "TRPRDecLoc", "ASKBID",
                                          "IndicativeQuote", "MarketQuote", "CloseOpen",
                                          "OpenException", "PostClose", "CancelCode", "InsertedPrice",
                                          "FastLast", "Cabinet", "Book", "EntryDate")),

                        col_types = cols("i", "c", "i", "c",
                                         "c", "c", "i", "i",
                                         "i", "i", "i", "i", "c",
                                         "c", "c", "c",
                                         "c", "c", "c", "c",
                                         "c", "c", "c", "i"))


save(corn_110110, file = "data/corn_110110.rda")



# Path to 2012-2013 in larger file format. Two years in one file.
#'C:/Users/mallorym/BBOCORNDATA/2012Jan-2013Nov_txt/BBO_CBT_20120102-20131130_9552_00.txt'
