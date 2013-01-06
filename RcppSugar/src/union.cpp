#include <Rcpp.h>
using namespace Rcpp;

RcppExport SEXP RcppSugar_union_integer( SEXP x_, SEXP y_ ) {
  
  return wrap( union_( as<IntegerVector>(x_), as<IntegerVector>(y_) ) );
  
}

RcppExport SEXP RcppSugar_union_numeric( SEXP x_, SEXP y_ ) {
  
  return wrap( union_( as<NumericVector>(x_), as<NumericVector>(y_) ) );
  
}

RcppExport SEXP RcppSugar_union_character( SEXP x_, SEXP y_ ) {
  
  return wrap( union_( as<CharacterVector>(x_), as<CharacterVector>(y_) ) );
  
}