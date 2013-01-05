#' Rcpp Sugar -- abs
#' 
#' This function implements the Rcpp sugar function \code{abs}.
#' 
#' @param x a numeric vector
#' @export
#' @examples
#' library(microbenchmark)
#' x <- rnorm(1E6)*1E6; y <- as.integer( trunc(x) )
#' microbenchmark( times=20,
#'   abs(x),
#'   base::abs(x),
#'   abs(y),
#'   base::abs(y)
#'   )
#'   
#' stopifnot( all.equal( abs(x), base::abs(x) ) )
#' stopifnot( all.equal( abs(y), base::abs(y) ) )
abs <- function(x) {
  
  class <- "["( class(x), length(class(x)) )
  
  switch( class,
          numeric=.Call( "RcppSugar_abs_numeric", x, PACKAGE="RcppSugar" ),
          integer=.Call( "RcppSugar_abs_integer", x, PACKAGE="RcppSugar" ),
          base::abs( x )
          )
  
}