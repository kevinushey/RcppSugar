\name{str_replace}
\alias{str_replace}
\title{Replace Entries in a Vector of Strings}
\usage{
  str_replace(x, from, to)
}
\arguments{
  \item{x}{a character vector (a vector of 'strings')}

  \item{from}{a string}

  \item{to}{a string}
}
\description{
  In a vector of 'strings' \code{x}, replace all matches of
  the string \code{from} with \code{to}.
}
\note{
  Functionality is provided by the C++ boost library,
  through Rcpp.
}

