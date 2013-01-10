#' Split the Elements of a Character Vector
#' 
#' Split the elements of a character vector \code{x} into substrings
#' according to the matches to subtring \code{split} within them.
#' 
#' @note Functionality is provided by the C++ boost library, through Rcpp.
#' 
#' @export
#' @param x a character vector (a vector of 'strings')
#' @param split a string to split over
#' @param fixed logical. if \code{TRUE}, we split by regular expression;
#' otherwise, we just directly match \code{split}.
str_split <- function(x, split, fixed=FALSE) {
  .Call( "str_split", x, split, fixed, PACKAGE="Kmisc" )
}