#' Rcpp Sugar -- collapse
#' 
#' This function implements the Rcpp sugar function \code{collapse}.
#' @param x a vector of storage mode: character
#' @export
sugar_collapse <- function(x, collapse=NULL) {

  if( is.null(collapse) ) {
    .Call( "RcppSugar_collapse_character", x, PACKAGE="RcppSugar" )
  } 

}
