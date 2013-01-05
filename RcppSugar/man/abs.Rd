\name{abs}
\alias{abs}
\title{Rcpp Sugar -- abs}
\usage{
  abs(x)
}
\arguments{
  \item{x}{a numeric vector}
}
\description{
  This function implements the Rcpp sugar function
  \code{abs}.
}
\examples{
library(microbenchmark)
x <- rnorm(1E6)*1E6; y <- as.integer( trunc(x) )
microbenchmark( times=20,
  abs(x),
  base::abs(x),
  abs(y),
  base::abs(y)
  )

stopifnot( all.equal( abs(x), base::abs(x) ) )
stopifnot( all.equal( abs(y), base::abs(y) ) )
}

