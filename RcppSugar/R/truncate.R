#' Rcpp Sugar -- truncate
#' 
#' This function truncates a vector of strings \code{x} up to a width \code{n}.
#' 
#' @param x a vector of strings
#' @param n an integer; length of substrings
#' @export
sugar_truncate  <- function(x, n=80) {
  
  .Call("RcppSugar_truncate_character", x, n, PACKAGE="RcppSugar")
  
}
