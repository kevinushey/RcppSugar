#include <Rcpp.h>
using namespace Rcpp;

RcppExport SEXP RcppSugar_table_numeric( SEXP x_ ) {
  return wrap( table( as<NumericVector>(x_) ) );
}

RcppExport SEXP RcppSugar_table_integer( SEXP x_ ) {
  return wrap( table( as<IntegerVector>(x_) ) );
}

RcppExport SEXP RcppSugar_table_character( SEXP x_ ) {
  return wrap( table( as<CharacterVector>(x_) ) );
}