#' RollContracts
#'
#' This function rolls contracts into 'Nearby', '1st Deferred', and '2nd Deferred'. It removes contracts
#' more distant than 2 Deferred. It takes as arguments, x, a list of data.tables and r, an integer
#' representing the date on which the nearby contract should be rolled. The data.tables  in the list
#' can contain raw trades and quotes data after reading in with bboread(), or it can be already aggregated in some
#' way. For example, if you calculate mean price per day and number of quotes as soon as you read in, you can still call
#' RollContracts() on this list.
#'
#' All September Maturities are deleted to avoid, new-crop vs old-crop delivery effects.
#'
#' @param x a list of data.tables with at least two columns named 'TradeDate' and 'DeliveryDate'
#'
#' @param r an integer that specifies the date in the month prior to expiration you want to roll. 20 is the default.
#'
#'
#' @return An list of data.tables with a column called 'Deferreds' that specifies if the contract is the Nearby, 1st Deferred, or 2nd Deferred.
#'
#' @examples
#' accum <- as.list(NULL)
#' accum[[1]] <- corn_110110
#' accum[[2]] <- corn_110110                 # accum is a list of two 'days' worth of BBO data
#' accum <- RollContracts(accum, r = 20)
#'

RollContracts <- function(accum, r = 20) {

  accum <- lapply(accum, separate, DeliveryDate, into=c("Year",          # Separate DeliveryDate Useful to identify
                          "Month"), sep = 2)                             # date on which to roll contracts

  accum <- lapply(accum, separate, TradeDate, into=c("YearMonth",        # Separate TradeDate Useful to identify
                                                "Day"), sep = 6)         # date on which to roll contracts


  accum <- lapply(accum, function(x) x[Month != "09",])                  # Removes September in the list


  #(Month != substr(x$YearMonth, 5, 6) |                              # Deletes Contracts trading in the Delivery Month
  accum <- lapply(accum, function(x, Roll = r) {                         # Roll Contracts
    x[(as.numeric(Month) == (as.numeric(substr(x$YearMonth, 5, 6))+1) & as.numeric(Day) < r) |
      (as.numeric(Month) > as.numeric(substr(x$YearMonth, 5, 6))+1) |    # Keeps all days in Months prior to expiration mess
      (as.numeric(Month) < as.numeric(substr(x$YearMonth, 5, 6)))]       # Need two lines for when crossing into new year.
  })                                                                     # Using first line only of the last logical condition
                                                                         # deletes nov and dec dates.

  accum <- lapply(accum, unite, TradeDate, one_of(c("YearMonth", "Day")), # Unite TradeDate
                  sep = "", remove = TRUE)

  accum <- lapply(accum, unite, DeliveryDate, one_of(c('Year', 'Month')), # Unite DeliveryDate
                  sep = "", remove = TRUE)

  accum <- lapply(accum, function(x) {                                    # Trims to only first three contracts
    x[DeliveryDate == unique(x$DeliveryDate)[1] |
        DeliveryDate == unique(x$DeliveryDate)[2] |
        DeliveryDate == unique(x$DeliveryDate)[3]]
  })

  accum <- lapply(accum, function(x) {                                    # Name Nearby and Deferreds
    x[DeliveryDate == unique(x$DeliveryDate)[1], Deferreds := "Nearby"]
    x[DeliveryDate == unique(x$DeliveryDate)[2], Deferreds := "1st Deferred"]
    x[DeliveryDate == unique(x$DeliveryDate)[3], Deferreds := "2st Deferred"]
  })
  return(accum)
}


