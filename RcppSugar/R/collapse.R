#' Rcpp Sugar -- collapse
#' 
#' This function implements the Rcpp sugar function \code{collapse}.
#' 
#' @param x a vector coercible to character
#' @export
#' @examples
#' require(microbenchmark)
#' x <- sample( LETTERS, size=1E5, replace=TRUE )
#' microbenchmark( base::paste0(x), collapse(x), times=20 )
#' stopifnot( all.equal( base::paste0(x), collapse(x) ) )
collapse <- function(x) {
  
  .Call( "RcppSugar_collapse", as.character(x), PACKAGE="RcppSugar" )
  
}