\name{corn_110110}
\alias{corn_110110}
\docType{data}
\title{
Best Bid Best Offer Data for Corn Futures Data from the CME Group
}
\description{
This top-of-the book data set for January 1, 2011 is the BBO data sample provided by the CME Datamine historical archive.
}
\usage{data("corn_110110")}
\format{
  A data table.
}
\details{
This exaple data set has already been processed as an .rda file. The raw data provided by the CME Group is a fixed width file. See examples.
}
\source{
 \url{http://www.cmegroup.com/market-data/datamine-historical-data.html}
}
\references{
%%  ~~ possibly secondary sources and usages ~~
}
\examples{
load(corn_110110)
head(corn_110110)
}
\keyword{datasets}
