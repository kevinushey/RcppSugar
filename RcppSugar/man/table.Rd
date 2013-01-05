\name{table}
\alias{table}
\title{Rcpp Sugar -- table}
\usage{
  table(x, ...)
}
\arguments{
  \item{x}{a vector.}

  \item{...}{additional arguments; if there are any other
  arguments \code{base::table} is called instead.}
}
\description{
  This function implements the Rcpp sugar function
  \code{table}. This is significantly faster than the
  base-R version! However, it is currently only implemented
  one-dimensional tables.
}
\examples{
library( microbenchmark )
x <- rbinom(1E6, size=10, p=0.2)
microbenchmark( times=5,
  table(x),
  base::table(x)
  )
}

