#' Rcpp Sugar -- abs
#' 
#' This function implements the Rcpp sugar function \code{abs}.
#' @param x a vector of storage mode: double, integer
#' @export
abs <- function(x) {

	types <- typeof(x)
	
	switch( types, 
		double=.Call( "RcppSugar_abs_double", x, PACKAGE="RcppSugar" ),
		integer=.Call( "RcppSugar_abs_integer", x, PACKAGE="RcppSugar" ),
		base::abs(x)
	)

}
