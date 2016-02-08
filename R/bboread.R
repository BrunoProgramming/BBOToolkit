#' Read in BBO data sets from CME Historical Datamine
#'
#' This function is simply a wrapper for the read_fwf function in the readr package. Inside the function, start and end positions
#' of the raw fixed width file are specified as documented at
#' http://www.cmegroup.com/confluence/display/EPICSANDBOX/Best+Bid+Best+Offer+ASCII+Layout
#' For performance, only the bare minimum columns are read in.
#'
#' @param x is a path to a .txt file from the CME Group's historical datamine.
#'
#' @return A datatable.
#' @examples
#'
#' DATA <- bboread('data-raw/XCBT_C_FUT_110110.TXT')
#' head(DATA)
#'
#'
#' #' DATA <- bboread('C:/Users/mallorym/BBOCORNDATA/2012Jan-2013Nov_txt/BBO_CBT_20120102-20131130_9552_00.txt')  # A 'large' file.
#' head(DATA)





bboread <- function(x) {

  start <- c(1, 9, 15, 28, 32, 45, 53, 65)
  end   <- c(8, 14, 22, 31, 36, 51, 53, 70)

  data <- readr::read_fwf(x, readr::fwf_positions(start, end, col_names = c("TradeDate", "TradeTime", "TradeSeqNum",
                                                                            "DeliveryDate", "TrQuantity", "TrPrice",
                                                                            "ASKBID", "EntryDate")),
                          col_types = cols(
                            TradeDate = col_character(),
                            TradeTime = col_character(),
                            TradeSeqNum = col_integer(),
                            DeliveryDate = col_character(),
                            TrQuantity = col_integer(),
                            TrPrice = col_character(),
                            ASKBID = col_character(),
                            EntryDate = col_character()
                            ## Put this back into function bboread

                          ))
  return(data)
}



