\name{corn_110110}
\alias{corn_110110}
\docType{data}
\title{
Best Bid Best Offer Data for Corn Futures Data from the CME Group
}
\description{
This top-of-the book data set for January 1, 2011 is the BBO data sample provided by the CME Datamine historical archive.
}
\usage{data("corn_110110")}
\format{
  A data table.
  \describe{
    \item{\code{x}}{a numeric vector}
    \item{\code{y}}{a numeric vector}
  }
}
\details{
This exaple data set has already been processed as an .rda file. The raw data provided by the CME Group is a fixed width file. Processing the fwf to a data table requires the following code:

\code{
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
}
}
\source{
%%  ~~ reference to a publication or URL from which the data were obtained ~~
}
\references{
%%  ~~ possibly secondary sources and usages ~~
}
\examples{
data(XCBT_C_FUT_110110)
## maybe str(XCBT_C_FUT_110110) ; plot(XCBT_C_FUT_110110) ...
}
\keyword{datasets}
