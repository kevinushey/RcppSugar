#include <Rcpp.h>
using namespace Rcpp;

RcppExport SEXP RcppSugar_unique_double( SEXP a_) {
	return wrap( unique( as< NumericVector >(a_) ) );
}

RcppExport SEXP RcppSugar_unique_integer( SEXP a_) {
	return wrap( unique( as< IntegerVector >(a_) ) );
}

RcppExport SEXP RcppSugar_unique_character( SEXP a_) {
	return wrap( unique( as< CharacterVector >(a_) ) );
}

