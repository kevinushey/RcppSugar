#' Rcpp Sugar -- Lowest Common Multiple
#' 
#' This function implements the \code{boost::math::lcm} function.
#' @param x a vector; same length as \code{y}.
#' @param y a vector; same length as \code{x}.
#' @export
lcm <- function(x, y) {
  stopifnot( length(x) == length(y) )
  .Call( "boost_lcm", x, y, PACKAGE="RcppSugar" )
}
