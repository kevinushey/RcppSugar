#include <Rcpp.h>

using namespace Rcpp;

RcppExport SEXP RcppSugar_abs_double( SEXP a_) {
	return wrap( abs( as< NumericVector >(a_) ) );
}

RcppExport SEXP RcppSugar_abs_integer( SEXP a_) {
	return wrap( abs( as< IntegerVector >(a_) ) );
}

