#include <Rcpp.h>
using namespace Rcpp;

RcppExport SEXP RcppSugar_pow_numeric_numeric( SEXP x_, SEXP n_ ) {
  
  NumericVector x(x_);
  double n = as<double>(n_);
  
  return wrap( pow( x, n ) );

}

RcppExport SEXP RcppSugar_pow_numeric_integer( SEXP x_, SEXP n_ ) {
  
  NumericVector x(x_);
  int n = as<int>(n_);
  
  return wrap( pow( x, n ) );

}

RcppExport SEXP RcppSugar_pow_integer_numeric( SEXP x_, SEXP n_ ) {
  
  IntegerVector x(x_);
  double n = as<double>(n_);
  
  return wrap( pow( x, n ) );

}

RcppExport SEXP RcppSugar_pow_integer_integer( SEXP x_, SEXP n_ ) {
  
  IntegerVector x(x_);
  int n = as<int>(n_);
  
  return wrap( pow( x, n ) );

}