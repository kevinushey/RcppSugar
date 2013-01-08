#' Rcpp Sugar -- floor
#' 
#' This function implements the Rcpp sugar function \code{floor}.
#' @param x a vector of storage mode: double, integer
#' @export
sugar_floor <- function(x) {

	types <- typeof(x)
	
	switch( types, 
		double=.Call( "RcppSugar_floor_double", x, PACKAGE="RcppSugar" ),
		integer=.Call( "RcppSugar_floor_integer", x, PACKAGE="RcppSugar" ),
		base::floor(x)
	)

}
