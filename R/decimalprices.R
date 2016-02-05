#' Convert eighth of a cent grain prices to decimal
#'
#' @param x is a column of a datatable of Grain contract BBO raw data from CME Group's Datamine.
#' it should have 4 characters: hundreds, tens, ones, and 8th of a cent
#' since futures quotes are in cents per bushel and the ticks are 8ths of a cent
#' this function will only work for corn prices < $100/bushel. At this date, grain prices
#' above $100/ bushel are unimaginable.
#'
#' @return The column of the orginal datatable with the TrPrice column converted to numeric in decimal format.
#' @examples
#' head(corn_110110$TrPrice)
#' temp <- decimalprices(corn_110110$TrPrice)
#' head(temp)



decimalprices <- function(x) {


  n     <- nchar(x[1])

  if (n == 4){
  x     <- strsplit(as.character(x), "")
  h     <- sapply(x, "[[", 1) #Selects the hudreds place
  t     <- sapply(x, "[[", 2) #Selects the tens place
  o     <- sapply(x, "[[", 3) #Selects the ones place
  e     <- sapply(x, "[[", 4) #Selects the 8th of a cent place

  #Convert 8th of a cent to decimal
  e     <- as.numeric(e)/8
  price <- as.numeric(paste0(h,t,o))
  price <- price + e
  return(price)
  } else {
    x     <- strsplit(as.character(x), "")
    th    <- sapply(x, "[[", 1) # Selects the thousands place
    h     <- sapply(x, "[[", 2) # Selects the hudreds place
    t     <- sapply(x, "[[", 3) # Selects the tens place
    o     <- sapply(x, "[[", 4) # Selects the ones place
    e     <- sapply(x, "[[", 5) # Selects the 8th of a cent place

    #Convert 8th of a cent to decimal
    e     <- as.numeric(e)/8
    price <- as.numeric(paste0(h,t,o))
    price <- price + e
    return(price)
  }
}
