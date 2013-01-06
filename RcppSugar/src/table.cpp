#include <Rcpp.h>
using namespace Rcpp;

RcppExport SEXP RcppSugar_table_character( SEXP a_) {
	return wrap( table( as< CharacterVector >(a_) ) );
}

RcppExport SEXP RcppSugar_table_double( SEXP a_) {
	return wrap( table( as< NumericVector >(a_) ) );
}

RcppExport SEXP RcppSugar_table_integer( SEXP a_) {
	return wrap( table( as< IntegerVector >(a_) ) );
}

