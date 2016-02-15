#' Manipulate Date Strings IDate Format
#'
#' This function takes dates that are formatted as a character string of the type, '20080114', where this is
#' January 14, 2008 The value of the function returns an IDate object.
#'
#' This function is intended to be vectorized over a data.table object.
#'
#' @param x a one column of a data.table containing a date in the format, "20080114", to represent January 14, 2008.
#'
#'
#' @return An IDate object.
#'
#' @examples
#'
#' datasample <- as.data.table(bboread('data-raw/XCBT_C_FUT_110110.TXT'))
#' datasample[, TradeDate := datemanip(datasample[, 1, with=FALSE])]
#' datasample
#'
#' datasample <- as.data.table(bboread('data-raw/XCBT_C_FUT_110110.TXT'))
#' datasample[, c("TradeDate", "TradeTime") := .(datemanip(datasample[, 1, with=FALSE]), timemanip(datasample[, 2, with=FALSE]))]
#' datasample


datemanip <- function(x) {

    x[, 1] <- as.IDate(paste0(substr(x[, 1, with=FALSE], 1, 4), "-", substr(x[, 1, with=FALSE], 5, 6), "-", substr(x[,1, with=FALSE], 7, 8)))
    return(x)
}


