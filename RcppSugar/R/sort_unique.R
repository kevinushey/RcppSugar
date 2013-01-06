#' Rcpp Sugar -- sort_unique
#' 
#' This function implements the Rcpp sugar function \code{sort_unique}.
#' @param x a vector of storage mode: character, double, integer
#' @export
sort_unique <- function(x) {

	types <- typeof(x)
	
	switch( types, 
		character=.Call( "RcppSugar_sort_unique_character", x, PACKAGE="RcppSugar" ),
		double=.Call( "RcppSugar_sort_unique_double", x, PACKAGE="RcppSugar" ),
		integer=.Call( "RcppSugar_sort_unique_integer", x, PACKAGE="RcppSugar" ),
		base::sort( base::unique(x) )
	)

}
