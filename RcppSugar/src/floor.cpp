#include <Rcpp.h>
using namespace Rcpp;

RcppExport SEXP RcppSugar_floor_double( SEXP a_) {
	return wrap( floor( as< NumericVector >(a_) ) );
}

RcppExport SEXP RcppSugar_floor_integer( SEXP a_) {
	return wrap( floor( as< IntegerVector >(a_) ) );
}

