#' Convert eighth of a cent grain prices to decimal
#'
#' @param x is a column of a datatable of Grain contract BBO raw data from CME Group's Datamine.
#' Formatted as.character() from the start it will have 7 characters. Positions: 4 hundreds, 5 tens, 6 ones, and 7 8th of a cent
#' since futures quotes are in cents per bushel and the ticks are 8ths of a cent
#' this function will only work for corn prices < $100/bushel. At this date, grain prices
#' above $100/ bushel are unimaginable.
#'
#' This function is intended to be vectorized over a data.table object as in the example below.
#'
#' @return The column of the orginal datatable with the TrPrice column converted to numeric in decimal format.
#' @examples
#' accum <- as.list(Null)
#' accum[[1]] <- as.data.table(bboread('XCBT_C_FUT_110110.TXT'))
#' accum[[2]] <- as.data.table(bboread('XCBT_C_FUT_110110.TXT'))                 # accum is a list of two 'days' worth of BBO data
#' corn_110110 <- data.table::rbindlist(accum)
#' corn_110110[, Price := decimalprices(corn_110110$TrPrice)]
#'

decimalprices <- function(x) {
  price     <- as.numeric(substr(x, 4, 6))
  e         <- as.numeric(substr(x, 7, 7))/8
  price <- price +e
  return(price)
}
