#' Rcpp Sugar -- collapse
#' 
#' This function implements the Rcpp sugar function \code{collapse}.
#' @param x a vector of storage mode: character
#' @export
collapse <- function(x) {

	types <- typeof(x)
	
	switch( types, 
		character=.Call( "RcppSugar_collapse_character", x, PACKAGE="RcppSugar" ),
		base::paste(x, collapse="")
	)

}
