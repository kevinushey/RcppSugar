#include <Rcpp.h>
using namespace Rcpp;

RcppExport SEXP RcppSugar_ceil_double( SEXP a_) {
	return wrap( ceil( as< NumericVector >(a_) ) );
}

RcppExport SEXP RcppSugar_ceil_integer( SEXP a_) {
	return wrap( ceil( as< IntegerVector >(a_) ) );
}

