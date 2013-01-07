#' Rcpp Sugar -- ceil
#' 
#' This function implements the Rcpp sugar function \code{ceil}.
#' @param x a vector of storage mode: double, integer
#' @export
ceil <- function(x) {

	types <- typeof(x)
	
	switch( types, 
		double=.Call( "RcppSugar_ceil_double", x, PACKAGE="RcppSugar" ),
		integer=.Call( "RcppSugar_ceil_integer", x, PACKAGE="RcppSugar" ),
		base::ceiling(x)
	)

}
