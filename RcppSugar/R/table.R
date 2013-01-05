#' Rcpp Sugar -- table
#' 
#' This function implements the Rcpp sugar function \code{table}. This is
#' significantly faster than the base-R version! However, it is currently only
#' implemented one-dimensional tables.
#' 
#' @param x a vector.
#' @param ... additional arguments; if there are any other arguments \code{base::table}
#' is called instead.
#' @export
#' @examples
#' library( microbenchmark )
#' x <- rbinom(1E6, size=10, p=0.2)
#' microbenchmark( times=5,
#'   table(x),
#'   base::table(x)
#'   )
table <- function(x, ...) {
  
  if( !is.null( match.call(expand.dots=FALSE)$`...` ) ) {
    return( base::table(x, ...) )
  }
  
  class <- class(x)
  
  switch( class,
          numeric=.Call("RcppSugar_table_numeric", x, PACKAGE="RcppSugar"),
          integer=.Call("RcppSugar_table_integer", x, PACKAGE="RcppSugar"),
          character=.Call("RcppSugar_table_character", x, PACKAGE="RcppSugar"),
          base::table(x, ...)
          )
  
}