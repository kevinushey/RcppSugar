\name{\%in\%}
\alias{\%in\%}
\title{Rcpp Sugar -- in}
\usage{
  x \%in\% y
}
\arguments{
  \item{x}{a vector}

  \item{y}{a vector}
}
\description{
  This function implements the Rcpp sugar function
  \code{in}.
}
\examples{
library( microbenchmark )

strings <- do.call( paste0, expand.grid( letters, letters, letters ) )
x <- sample(
  strings,
  size=1E6,
  replace=TRUE
  )

y <- sample(
  strings,
  size=1E6,
  replace=TRUE
  )

microbenchmark( times=20,
  x \%in\% y,
  base::"\%in\%"(x, y)
  )

stopifnot( all.equal( x \%in\% y, base::"\%in\%"(x, y) ) )
}

