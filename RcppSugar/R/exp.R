#' Rcpp Sugar -- exp
#' 
#' This function implements the Rcpp sugar function \code{exp}.
#' @param x a vector of storage mode: double, integer
#' @export
sugar_exp <- function(x) {

	types <- typeof(x)
	
	switch( types, 
		double=.Call( "RcppSugar_exp_double", x, PACKAGE="RcppSugar" ),
		integer=.Call( "RcppSugar_exp_integer", x, PACKAGE="RcppSugar" ),
		base::exp(x)
	)

}
