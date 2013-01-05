#include <Rcpp.h>
using namespace Rcpp;

RcppExport SEXP RcppSugar_unique_integer( SEXP x_ ) {
  return wrap( unique( as<IntegerVector>(x_) ) );
}

RcppExport SEXP RcppSugar_unique_numeric( SEXP x_ ) {
  return wrap( unique( as<NumericVector>(x_) ) );
}

RcppExport SEXP RcppSugar_unique_character( SEXP x_ ) {
  return wrap( unique( as<CharacterVector>(x_) ) );
}