#' Manipulate Time Strings ITime Format
#'
#' This function takes time in the format, "093000", to represent hours, minutes, and seconds. The value of the
#' function returns an ITime object. After reformatting the time to "09:30:00", the function passes the unambiguous string to
#' an as.ITime() function call.
#'
#' This function is intended to be vectorized over a data.table object. See examples below.
#'
#' @param x a one column of a data.table containing a time in the format, "093000", to represent "09:30:00" hours, minutes, and seconds.
#'
#' @return An ITime object.
#'
#' @examples
#'
#' datasample <- as.data.table(bboread('data-raw/XCBT_C_FUT_110110.TXT'))
#' datasample[, TradeTime .= timemanip(TradeTime)]
#' datasample
#'
#' datasample <- as.data.table(bboread('data-raw/XCBT_C_FUT_110110.TXT'))
#' datasample[, c("TradeDate", "TradeTime") := .(datemanip(TradeDate), timemanip(TradeTime))]
#' datasample




timemanip <- function(x) {
  x <- as.ITime(paste0(substr(x, 1, 2), ":", substr(x, 3, 4), ":", substr(x, 5, 6)))
  return(x)
}
