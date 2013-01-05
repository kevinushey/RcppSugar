#' Rcpp Sugar -- pow
#' 
#' This function implements the Rcpp sugar function \code{pow}.
#' 
#' @param x a vector of either numeric or integer type.
#' @param y a single number of either numeric or integer type.
#' @export
#' @examples
#' library( microbenchmark )
#' x <- rnorm(1E8)
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
#' x <- sample( 1:100L, size=1E8, replace=TRUE )
#' n <- 3L
#' microbenchmark( times=2,
#'   pow(x, n),
#'   x^n
#'   )
#'   
#' stopifnot( all.equal( pow(x, n), x^n ) )
#' ## the Rcpp solution can actually be a bit faster with very large
#' ## numeric vectors; however, it's much slower for small vectors.
pow <- function(x, n) {
  
  modes <- paste( mode(x), mode(n), sep="_" )
  
  switch( modes,
          numeric_numeric = .Call( "RcppSugar_pow_numeric_numeric", x, n, PACKAGE="RcppSugar" ),
          numeric_integer = .Call( "RcppSugar_pow_numeric_integer", x, n, PACKAGE="RcppSugar" ),
          integer_numeric = .Call( "RcppSugar_pow_integer_numeric", x, n, PACKAGE="RcppSugar" ),
          integer_integer = .Call( "RcppSugar_pow_integer_integer", x, n, PACKAGE="RcppSugar" ),
          x^n
  )
  
}