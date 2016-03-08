#' Get Trade Direction
#'
#' This function assigns each transaction with a +1 for market orders to buy and -1 for market orders to sell
#' according to the Lee and Ready (1991) algorithm. Implementation of this algorithm is the same as the
#' `getTradeDirection()` function in the `highfrequency` package.
#'
#' @param tqdata A data.table that contains bids, asks, and transaction prices. BBO data has been subsetted so
#' only transactions are in the tqdata data.table
#'
#' @return tqdata A data.table with a new column that has +1 for transactions identified as market orders to
#' buy and -1 for transaction identified as market orders to sell.
#'
#' @examples
#' DATA   <- as.data.table(bboread('XCBT_C_FUT_110110.TXT'))
#' DT     <- dcast.data.table(DATA, TradeDate + TradeTime + TradeSeqNum + DeliveryDate + EntryDate + bins ~ ASKBID,
#'                            value.var = c("TrQuantity", "Price"))
#' DT[, BAS := (Price_A - Price_B)]
#' tqdata <- DT[!is.na(Price_NA)  ]
#' tqdata <- tqdata[, c("diff1", "diff2") := .(diff(Price_NA, lag = 1), diff(Price_NA, lag = 2))]
#' tqdata[, td := getTD(tqdata)]
#' tqdata
#'




getTD = function(tqdata,...){

  ##Function returns a vector with the inferred trade direction:
  ##NOTE: the value of the first (and second) observation should be ignored if price=midpoint for the first (second) observation.
  bid = as.numeric(tqdata$Price_B);
  offer = as.numeric(tqdata$Price_A);
  midpoints = (bid + offer)/2;
  price = as.numeric(tqdata$Price_NA);

  buy1 = price > midpoints; #definitely a buy
  equal = price == midpoints;
  dif1 = c(TRUE,0 < price[2:length(price)]-price[1:(length(price)-1)]);#for trades=midpoints: if uptick=>buy
  equal1 = c(TRUE,0 == price[2:length(price)]-price[1:(length(price)-1)]);#for trades=midpoints: zero-uptick=>buy
  dif2 = c(TRUE,TRUE,0 < price[3:length(price)]-price[1:(length(price)-2)]);

  buy = buy1 | (dif1 & equal) | (equal1 & dif2 & equal);

  buy[buy==TRUE]=1;
  buy[buy==FALSE]=-1;

  return(buy);
}
