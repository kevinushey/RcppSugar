\name{unique}
\alias{unique}
\title{Rcpp Sugar -- unique}
\usage{
  unique(x)
}
\arguments{
  \item{x}{a vector}
}
\description{
  This function implements the Rcpp sugar function
  \code{unique}.
}
\examples{
library( microbenchmark )
x <- sample( do.call( paste, expand.grid( LETTERS, LETTERS ) ), size=1E6, replace=TRUE )
microbenchmark( times=20,
  unique(x),
  base::unique(x)
  )
}

