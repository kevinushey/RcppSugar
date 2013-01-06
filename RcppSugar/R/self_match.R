#' Rcpp Sugar -- self_match
#' 
#' This function implements the Rcpp sugar function \code{self_match}.
#' @param x a vector of storage mode: character, double, integer
#' @export
self_match <- function(x) {

	types <- typeof(x)
	
	switch( types, 
		character=.Call( "RcppSugar_self_match_character", x, PACKAGE="RcppSugar" ),
		double=.Call( "RcppSugar_self_match_double", x, PACKAGE="RcppSugar" ),
		integer=.Call( "RcppSugar_self_match_integer", x, PACKAGE="RcppSugar" ),
		base::match( x, base::unique(x) )
	)

}
