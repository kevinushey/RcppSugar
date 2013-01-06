#' Rcpp Sugar -- pow
#' 
#' This function implements the Rcpp sugar function \code{pow}.
#' 
#' @param x a vector of either numeric or integer type.
#' @param n a single number of either numeric or integer type.
#' @export
#' @examples
#' library( microbenchmark )
#' x <- rnorm(1E5)
#' n <- 3L
#' microbenchmark( times=2,
#'   pow(x, n),
#'   x^n
#'   )
#'   
#' n <- as.numeric(n)
#' microbenchmark( times=2,
#'   pow(x, n),
#'   x^n
#'   )
#'   
#' x <- sample( 1:100L, size=1E5, replace=TRUE )
#' n <- 3L
#' microbenchmark( times=2,
#'   pow(x, n),
#'   x^n
#'   )
#'   
#' stopifnot( all.equal( pow(x, n), x^n ) )
pow <- function(x, n) {
  
  types <- paste( typeof(x), typeof(n), sep="_" )
  
  switch( types,
          double_double = .Call( "RcppSugar_pow_numeric_numeric", x, n, PACKAGE="RcppSugar" ),
          double_integer = .Call( "RcppSugar_pow_numeric_integer", x, n, PACKAGE="RcppSugar" ),
          integer_double = .Call( "RcppSugar_pow_integer_numeric", x, n, PACKAGE="RcppSugar" ),
          integer_integer = .Call( "RcppSugar_pow_integer_integer", x, n, PACKAGE="RcppSugar" ),
          x^n
  )
  
}