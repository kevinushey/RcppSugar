#include <R.h>
#include <Rdefines.h>
#include <Rcpp.h>
#include <boost/math/common_factor.hpp>
using namespace Rcpp;

RcppExport SEXP boost_gcd( SEXP x_, SEXP y_ ) {
  
  IntegerVector x = as<IntegerVector>(x_);
  IntegerVector y = as<IntegerVector>(y_);
  
  IntegerVector out(x.size());
  
  for( int i=0; i < x.size(); i++ ) {
    out[i] = boost::math::gcd(x[i], y[i]);
  }
  
  return out;
  
}
