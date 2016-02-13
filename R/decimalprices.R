#' Convert eighth of a cent grain prices to decimal
#'
#' @param x is a column of a datatable of Grain contract BBO raw data from CME Group's Datamine.
#' Formatted as.character() from the start it will have 7 characters. Positions: 4 hundreds, 5 tens, 6 ones, and 7 8th of a cent
#' since futures quotes are in cents per bushel and the ticks are 8ths of a cent
#' this function will only work for corn prices < $100/bushel. At this date, grain prices
#' above $100/ bushel are unimaginable.
#'
#' @return The column of the orginal datatable with the TrPrice column converted to numeric in decimal format.
#' @examples
#' corn_110110 <- as.data.table(bboread('data-raw/XCBT_C_FUT_110110.TXT'))
#'
#' corn_110110[, Price := decimalprices(corn_110110[, 6, with=FALSE])]
#'

decimalprices <- function(x) {
  price     <- as.numeric(substr(x, 4, 6))
  e         <- as.numeric(substr(x, 7, 7))/8
  price <- price +e
  return(price)
}
