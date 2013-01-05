\name{collapse}
\alias{collapse}
\title{Rcpp Sugar -- collapse}
\usage{
  collapse(x)
}
\arguments{
  \item{x}{a vector coercible to character}
}
\description{
  This function implements the Rcpp sugar function
  \code{collapse}.
}
\examples{
require(microbenchmark)
x <- sample( LETTERS, size=1E5, replace=TRUE )
microbenchmark( base::paste0(x), collapse(x), times=20 )
stopifnot( all.equal( base::paste0(x), collapse(x) ) )
}

