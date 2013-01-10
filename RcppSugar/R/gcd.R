#' Rcpp Sugar -- Greatest Common Denominator
#' 
#' This function implements the \code{boost::math::gcd} function.
#' @param x a vector; same length as \code{y}.
#' @param y a vector; same length as \code{x}.
#' @export
gcd <- function(x, y) {
  stopifnot( length(x) == length(y) )
  .Call( "boost_gcd", x, y, PACKAGE="RcppSugar" )
}
