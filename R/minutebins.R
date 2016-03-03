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
#' datasample <- as.data.table(bboread('XCBT_C_FUT_110110.TXT'))
#' datasample[, bins := minutebins(datasample)]




minutebins <- function(x, minutes= 10) {
  x <- separate(x, TradeTime, into = c("Hour", "Minute", "Second"), sep = c(2, 4) )
  #bins <- paste(Hour, ":", as.character(floor(as.numeric(Minute)/minutes)*minutes))
  bins <- paste(x$Hour, ":", as.character(floor(as.numeric(x$Minute)/minutes)*minutes))
  return(bins)
}
