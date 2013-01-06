#' Rcpp Sugar -- table
#' 
#' This function implements the Rcpp sugar function \code{table}.
#' @param x a vector of storage mode: character, double, integer
#' @param ... additional arguments used for compatibility
#' @export
table <- function(x, ... ) {

	if( !is.null( match.call(expand.dots=FALSE)$`...` ) ) {
		return( base::table( x, ... ) )
	}
	
	types <- typeof(x)
	
	switch( types, 
		character=.Call( "RcppSugar_table_character", x, PACKAGE="RcppSugar" ),
		double=.Call( "RcppSugar_table_double", x, PACKAGE="RcppSugar" ),
		integer=.Call( "RcppSugar_table_integer", x, PACKAGE="RcppSugar" ),
		base::table( x, ... )
	)

}
