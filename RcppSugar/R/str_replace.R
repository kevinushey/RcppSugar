#' Replace Entries in a Vector of Strings
#' 
#' In a vector of 'strings' \code{x}, replace all matches of the string
#' \code{from} with \code{to}.
#' 
#' @note Functionality is provided by the C++ boost library, through Rcpp.
#' 
#' @export
#' @param x a character vector (a vector of 'strings')
#' @param from a string
#' @param to a string
str_replace <- function(x, from, to) {
  .Call( "str_replace", x, from, to, PACKAGE="RcppSugar" )
}