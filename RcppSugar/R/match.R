#' Rcpp Sugar -- match
#' 
#' This function implements the Rcpp sugar function \code{match}.
#' 
#' @param x a vector
#' @param y a vector
#' @export
#' @examples
#' library(microbenchmark)
#' x <- as.integer(sample(1E5)); y <- as.integer(sample(1E5))
#' microbenchmark( base::match(x, y), match(x, y), times=20 )
#' stopifnot( all.equal( match(x, y), base::match(x, y) ) )
match <- function(x, y) {
  
  class <- "["( class(x), length(class(x)) )
  
  switch( class,
          character = .Call( "RcppSugar_match_character", x, y, PACKAGE="RcppSugar" ),
          numeric = .Call( "RcppSugar_match_numeric", x, y, PACKAGE="RcppSugar" ),
          integer = .Call( "RcppSugar_match_integer", x, y, PACKAGE="RcppSugar" ),
          base::match(x, y)
  )
  
}