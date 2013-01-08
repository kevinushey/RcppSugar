#' Rcpp Sugar -- unique
#' 
#' This function implements the Rcpp sugar function \code{unique}.
#' @param x a vector of storage mode: double, integer, character
#' @param ... additional arguments used for compatibility
#' @export
sugar_unique <- function(x, ... ) {

	if( !is.null( match.call(expand.dots=FALSE)$`...` ) ) {
		return( base::unique(x, ...) )
	}
	
	types <- typeof(x)
	
	switch( types, 
		double=.Call( "RcppSugar_unique_double", x, PACKAGE="RcppSugar" ),
		integer=.Call( "RcppSugar_unique_integer", x, PACKAGE="RcppSugar" ),
		character=.Call( "RcppSugar_unique_character", x, PACKAGE="RcppSugar" ),
		base::unique(x, ...)
	)

}
