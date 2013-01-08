#' Rcpp Sugar -- in
#' 
#' This function implements the Rcpp sugar function \code{in}.
#' 
#' @param x a vector
#' @param y a vector
#' @usage x \%in\% y
#' @export
#' @rdname in
#' @examples
#' library( microbenchmark )
#' 
#' strings <- do.call( paste0, expand.grid( letters, letters, letters ) )
#' x <- sample(
#'   strings,
#'   size=1E6,
#'   replace=TRUE
#'   )
#'   
#' y <- sample(
#'   strings,
#'   size=1E6,
#'   replace=TRUE
#'   )
#'   
#' microbenchmark( times=20,
#'   x %in% y,
#'   base::"%in%"(x, y)
#'   )
#'   
#' stopifnot( all.equal( x %in% y, base::"%in%"(x, y) ) )
"sugar_%in%"  <- function(x, y) {
  
  type <- typeof(x)
  
  switch( type,
          numeric=.Call( "RcppSugar_in_numeric", x, y, PACKAGE="RcppSugar" ),
          double=.Call( "RcppSugar_in_integer", x, y, PACKAGE="RcppSugar" ),
          character=.Call( "RcppSugar_in_character", x, y, PACKAGE="RcppSugar" ),
          base::"%in%"(x, y)
  )
  
}
