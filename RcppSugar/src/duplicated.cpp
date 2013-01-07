#include <Rcpp.h>
using namespace Rcpp;

RcppExport SEXP RcppSugar_duplicated_double( SEXP a_) {
	return wrap( duplicated( as< NumericVector >(a_) ) );
}

RcppExport SEXP RcppSugar_duplicated_integer( SEXP a_) {
	return wrap( duplicated( as< IntegerVector >(a_) ) );
}

RcppExport SEXP RcppSugar_duplicated_character( SEXP a_) {
	return wrap( duplicated( as< CharacterVector >(a_) ) );
}

