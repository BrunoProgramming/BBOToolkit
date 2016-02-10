#' Manipulate Date Strings in to Unambiguous Format
#'
#' This function takes dates that are formatted as a character string of the type, '20080114', where this is
#' January 14, 2008, and a time in the format, "09:30:00", to represent hours, minutes, and seconds. The value of the
#' function returns a POSIXlt object. After using reformatting the dates, the function passes the unambiguous string to
#' an as.POSIXlt() call that specifies "America/Chicago" as the time zone. This is important if using the function on a machine that is not in the Central Time
#' Zone because the default is set to system time.
#'
#' This function is intended to be vectorized over a data.table object.
#'
#' @param x a one column of a data.table containing a date in the format, "20080114", to represent January 14, 2008.
#'
#'
#' @return An POSIXlt date object.
#'
#' @examples
#'
#' datasample <- bboread('data-raw/XCBT_C_FUT_110110.TXT')
#' datemanip(datasample)
#'
#'


datemanip <- function(x) {
  x <- as.POSIXlt(paste0(substr(x[, 1, with=FALSE], 1, 4), "-", substr(x[, 1, with=FALSE], 5, 6), "-", substr(x[,1, with=FALSE], 7, 8),
                         " ",
                         substr(x[,2, with=FALSE], 1, 2), ":", substr(x[,2, with=FALSE], 3, 4), ":", substr(x[,2, with=FALSE], 5, 6)),
                         tz = "America/Chicago")
  return(x)
}
