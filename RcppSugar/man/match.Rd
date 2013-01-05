\name{match}
\alias{match}
\title{Rcpp Sugar -- match}
\usage{
  match(x, y)
}
\arguments{
  \item{x}{a vector}

  \item{y}{a vector}
}
\description{
  This function implements the Rcpp sugar function
  \code{match}.
}
\examples{
library(microbenchmark)
x <- as.integer(sample(1E5)); y <- as.integer(sample(1E5))
microbenchmark( base::match(x, y), match(x, y), times=20 )
stopifnot( all.equal( match(x, y), base::match(x, y) ) )
}

