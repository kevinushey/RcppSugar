#include <Rcpp.h>
using namespace Rcpp;

RcppExport SEXP RcppSugar_exp_double( SEXP a_) {
	return wrap( exp( as< NumericVector >(a_) ) );
}

RcppExport SEXP RcppSugar_exp_integer( SEXP a_) {
	return wrap( exp( as< IntegerVector >(a_) ) );
}

