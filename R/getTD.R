



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
