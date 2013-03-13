\name{str_split}
\alias{str_split}
\title{Split the Elements of a Character Vector}
\usage{
  str_split(x, split, fixed = FALSE)
}
\arguments{
  \item{x}{a character vector (a vector of 'strings')}

  \item{split}{a string to split over}

  \item{fixed}{logical. if \code{TRUE}, we split by regular
  expression; otherwise, we just directly match
  \code{split}.}
}
\description{
  Split the elements of a character vector \code{x} into
  substrings according to the matches to subtring
  \code{split} within them.
}
\note{
  Functionality is provided by the C++ boost library,
  through Rcpp.
}

