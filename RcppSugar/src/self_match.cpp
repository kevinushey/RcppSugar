#include <Rcpp.h>
using namespace Rcpp;

RcppExport SEXP RcppSugar_self_match_character( SEXP a_) {
	return wrap( self_match( as< CharacterVector >(a_) ) );
}

RcppExport SEXP RcppSugar_self_match_double( SEXP a_) {
	return wrap( self_match( as< NumericVector >(a_) ) );
}

RcppExport SEXP RcppSugar_self_match_integer( SEXP a_) {
	return wrap( self_match( as< IntegerVector >(a_) ) );
}

