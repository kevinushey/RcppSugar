\name{union}
\alias{union}
\title{Rcpp Sugar -- union}
\usage{
  union(x, y)
}
\arguments{
  \item{x}{a vector.}

  \item{y}{a vector.}
}
\description{
  This function implements the Rcpp sugar function
  \code{union}.
}
\examples{
library("microbenchmark")
x <- sample(1E6, replace=TRUE); y <- sample(1E6, replace=TRUE)
microbenchmark( times=3,
  union(x, y),
  base::union(x, y)
  )
stopifnot( all.equal( sort(union(x,y)), sort(base::union(x,y)) ) )

x <- sample(1E6)[1:1E3]; y <- sample(1E6)[1:1E3]
microbenchmark( times=10,
  union(x, y),
  base::union(x, y)
  )

lots_of_letters <- do.call( paste, expand.grid( letters, letters, letters, letters ) )
len <- length(lots_of_letters)
x <- lots_of_letters[ sample(len) ]; y <- lots_of_letters[ sample(len) ]
microbenchmark( times=10,
  union(x, y),
  base::union(x, y)
  )
}

