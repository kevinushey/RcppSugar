#include <Rcpp.h>
using namespace Rcpp;

RcppExport SEXP RcppSugar_sort_unique_character( SEXP a_) {
	return wrap( sort_unique( as< CharacterVector >(a_) ) );
}

RcppExport SEXP RcppSugar_sort_unique_double( SEXP a_) {
	return wrap( sort_unique( as< NumericVector >(a_) ) );
}

RcppExport SEXP RcppSugar_sort_unique_integer( SEXP a_) {
	return wrap( sort_unique( as< IntegerVector >(a_) ) );
}

