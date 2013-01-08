#' Rcpp Sugar -- duplicated
#' 
#' This function implements the Rcpp sugar function \code{duplicated}.
#' @param x a vector of storage mode: double, integer, character
#' @param ... additional arguments used for compatibility
#' @export
sugar_duplicated <- function(x, ... ) {

	if( !is.null( match.call(expand.dots=FALSE)$`...` ) ) {
		return( base::duplicated(x, ...) )
	}
	
	types <- typeof(x)
	
	switch( types, 
		double=.Call( "RcppSugar_duplicated_double", x, PACKAGE="RcppSugar" ),
		integer=.Call( "RcppSugar_duplicated_integer", x, PACKAGE="RcppSugar" ),
		character=.Call( "RcppSugar_duplicated_character", x, PACKAGE="RcppSugar" ),
		base::duplicated(x, ...)
	)

}
