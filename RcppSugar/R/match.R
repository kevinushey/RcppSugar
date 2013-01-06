#' Rcpp Sugar -- match
#' 
#' This function implements the Rcpp sugar function \code{match}.
#' @param x a vector of storage mode: character, double, integer
#' @param y a vector of storage mode: character, double, integer
#' @param ... additional arguments used for compatibility
#' @export
match <- function(x, y, ... ) {

	if( !is.null( match.call(expand.dots=FALSE)$`...` ) ) {
		return( base::match(x, y, ...) )
	}
	
	types <- paste( sep="_", 
		typeof( x ),
		typeof( y )
	)
	
	switch( types, 
		character_character=.Call( "RcppSugar_match_character_character", x, y, PACKAGE="RcppSugar" ),
		double_double=.Call( "RcppSugar_match_double_double", x, y, PACKAGE="RcppSugar" ),
		integer_integer=.Call( "RcppSugar_match_integer_integer", x, y, PACKAGE="RcppSugar" ),
		base::match(x, y, ...)
	)

}
