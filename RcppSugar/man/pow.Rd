\name{pow}
\alias{pow}
\title{Rcpp Sugar -- pow}
\usage{
  pow(x, n)
}
\arguments{
  \item{x}{a vector of either numeric or integer type.}

  \item{y}{a single number of either numeric or integer
  type.}
}
\description{
  This function implements the Rcpp sugar function
  \code{pow}.
}
\examples{
library( microbenchmark )
x <- rnorm(1E8)
n <- 3L
microbenchmark( times=2,
  pow(x, n),
  x^n
  )

n <- as.numeric(n)
microbenchmark( times=2,
  pow(x, n),
  x^n
  )

x <- sample( 1:100L, size=1E8, replace=TRUE )
n <- 3L
microbenchmark( times=2,
  pow(x, n),
  x^n
  )

stopifnot( all.equal( pow(x, n), x^n ) )
## the Rcpp solution can actually be a bit faster with very large
## numeric vectors; however, it's much slower for small vectors.
}

