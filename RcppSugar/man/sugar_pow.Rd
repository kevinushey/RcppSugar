\name{sugar_pow}
\alias{sugar_pow}
\title{Rcpp Sugar -- pow}
\usage{
  sugar_pow(x, n)
}
\arguments{
  \item{x}{a vector of either numeric or integer type.}

  \item{n}{a single number of either numeric or integer
  type.}
}
\description{
  This function implements the Rcpp sugar function
  \code{pow}.
}
\examples{
library( microbenchmark )
x <- rnorm(1E5)
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

x <- sample( 1:100L, size=1E5, replace=TRUE )
n <- 3L
microbenchmark( times=2,
  pow(x, n),
  x^n
  )

stopifnot( all.equal( pow(x, n), x^n ) )
}

