#' Rcpp Sugar -- union
#' 
#' This function implements the Rcpp sugar function \code{union}. 
#' 
#' @param x a vector.
#' @param y a vector.
#' @examples
#' library("microbenchmark")
#' x <- sample(1E6, replace=TRUE); y <- sample(1E6, replace=TRUE)
#' microbenchmark( times=3,
#'   union(x, y),
#'   base::union(x, y)
#'   )
#' stopifnot( all.equal( sort(union(x,y)), sort(base::union(x,y)) ) )
#' 
#' x <- sample(1E6)[1:1E3]; y <- sample(1E6)[1:1E3]
#' microbenchmark( times=10,
#'   union(x, y),
#'   base::union(x, y)
#'   )
#'   
#' lots_of_letters <- do.call( paste, expand.grid( letters, letters, letters, letters ) )
#' len <- length(lots_of_letters)
#' x <- lots_of_letters[ sample(len) ]; y <- lots_of_letters[ sample(len) ]
#' microbenchmark( times=10,
#'   union(x, y),
#'   base::union(x, y)
#'   )
union <- function(x, y) {
  
  type <- typeof(x)
  
  switch( type,
          double=.Call("RcppSugar_union_numeric", x, y, PACKAGE="RcppSugar"),
          integer=.Call("RcppSugar_union_integer", x, y, PACKAGE="RcppSugar"),
          character=.Call("RcppSugar_union_character", x, y, PACKAGE="RcppSugar"),
          base::union(x, y)
  )
  
}