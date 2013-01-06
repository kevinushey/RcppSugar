#include <Rcpp.h>
using namespace Rcpp;

RcppExport SEXP RcppSugar_match_character_character( SEXP a_, SEXP b_) {
	return wrap( match( as< CharacterVector >(a_), as< CharacterVector >(b_) ) );
}

RcppExport SEXP RcppSugar_match_double_double( SEXP a_, SEXP b_) {
	return wrap( match( as< NumericVector >(a_), as< NumericVector >(b_) ) );
}

RcppExport SEXP RcppSugar_match_integer_integer( SEXP a_, SEXP b_) {
	return wrap( match( as< IntegerVector >(a_), as< IntegerVector >(b_) ) );
}

