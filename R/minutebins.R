#' Time to Minute-Bin Factors
#'
#' This function takes time in an ITime object and creates a factor representing time-length bins. For example,
#' 09:36:56 will be given a factor 09:30:00 if 10-minute length bins are desired.
#'
#' This function is intended to be vectorized over a data.table object. See examples below.
#'
#' @param x a one column of a data.table containing a time in the ITime, "09:30:00" represents hours, minutes, and seconds.
#'
#' @param minutes length of the desired time bins. Must divide hours in to equal bins
#'
#' @return An ITime object.
#'
#' @examples
#'
#' datasample <- as.data.table(bboread('data-raw/XCBT_C_FUT_110110.TXT'))
#' datasample[, c("TradeDate", "TradeTime") := .(datemanip(datasample[, 1, with=FALSE]), timemanip(datasample[, 2, with=FALSE]))]
#' datasample
#' datasample[, bins := minutebins(datasample[, 2, with=FALSE], 10)]
#' datasample




minutebins <- function(x, minutes) {
  bins <- paste(as.character(hour(datasample$TradeTime)), ":", as.character(floor(minute(datasample$TradeTime)/minutes)*minutes))
  return(bins)
}
