#' Rcpp Sugar -- unique
#' 
#' This function implements the Rcpp sugar function \code{unique}.
#' 
#' @param x a vector
#' @export
#' @examples
#' library( microbenchmark )
#' x <- sample( do.call( paste, expand.grid( LETTERS, LETTERS ) ), size=1E6, replace=TRUE )
#' microbenchmark( times=20,
#'   unique(x),
#'   base::unique(x)
#'   )
#'   
#' stopifnot( all.equal( sort(unique(x)), sort(base::unique(x)) ) )
unique <- function(x) {
  
  class <- "["( class(x), length(class(x)) )
  
  switch( class,
          numeric=.Call( "RcppSugar_unique_numeric", x, PACKAGE="RcppSugar" ),
          integer=.Call( "RcppSugar_unique_integer", x, PACKAGE="RcppSugar" ),
          character=.Call( "RcppSugar_unique_character", x, PACKAGE="RcppSugar" ),
          base::unique( x )
  )
  
}