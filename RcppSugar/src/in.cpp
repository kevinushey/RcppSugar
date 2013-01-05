#include <Rcpp.h>
using namespace Rcpp;

RcppExport SEXP RcppSugar_in_integer( SEXP x_, SEXP y_ ) {
  
  return wrap( in( as<IntegerVector>(x_), as<IntegerVector>(y_) ) );
  
}

RcppExport SEXP RcppSugar_in_numeric( SEXP x_, SEXP y_ ) {
  
  return wrap( in( as<NumericVector>(x_), as<NumericVector>(y_) ) );
  
}

RcppExport SEXP RcppSugar_in_character( SEXP x_, SEXP y_ ) {
  
  return wrap( in( as<CharacterVector>(x_), as<CharacterVector>(y_) ) );
  
}