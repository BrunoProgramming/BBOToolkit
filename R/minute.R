#' Minutes
#'
#' This function takes time in a time object and returns the minutes value as an integer. As documented by Hadley
#'
#' \url{https://gist.github.com/hadley/10238}
#'
#' @param x a one column of a data.table containing a time in the ITime, "09:30:00" represents hours, minutes, and seconds.
#'
#'
#' @return An integer.
#'
#' @examples
#' datasample <- as.data.table(bboread('data-raw/XCBT_C_FUT_110110.TXT'))
#' datasample[, c("TradeDate", "TradeTime") := .(datemanip(datasample[, 1, with=FALSE]), timemanip(datasample[, 2, with=FALSE]))]
#' datasample
#' minute(datasample$TradeTime)

minute <- function(x) as.POSIXlt(x)$min
