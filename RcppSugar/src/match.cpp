#include <Rcpp.h>
using namespace Rcpp;

RcppExport SEXP RcppSugar_match_numeric( SEXP a_, SEXP b_ ) {
  
  NumericVector a = as<NumericVector>(a_);
  NumericVector b = as<NumericVector>(b_);
  
  return wrap( match( a, b ) );
  
}

RcppExport SEXP RcppSugar_match_integer( SEXP a_, SEXP b_ ) {
  
  IntegerVector a = as<IntegerVector>(a_);
  IntegerVector b = as<IntegerVector>(b_);
  
  return wrap( match( a, b ) );
  
}

RcppExport SEXP RcppSugar_match_character( SEXP a_, SEXP b_ ) {
  
  CharacterVector a = as<CharacterVector>(a_);
  CharacterVector b = as<CharacterVector>(b_);
  
  return wrap( match( a, b ) );
  
}