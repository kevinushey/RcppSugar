#include <Rcpp.h>
using namespace Rcpp;

RcppExport SEXP RcppSugar_abs_numeric( SEXP x_ ) {
  return wrap( abs( as<NumericVector>(x_) ) );
}

RcppExport SEXP RcppSugar_abs_integer( SEXP x_ ) {
  return wrap( abs( as<IntegerVector>(x_) ) );
}