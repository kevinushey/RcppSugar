#include <Rcpp.h>
#include <boost/math/common_factor.hpp>
using namespace Rcpp;

RcppExport SEXP boost_lcm( SEXP x_, SEXP y_ ) {
  
  IntegerVector x = as<IntegerVector>(x_);
  IntegerVector y = as<IntegerVector>(y_);
  
  IntegerVector out(x.size());
  
  for( int i=0; i < x.size(); i++ ) {
    out[i] = boost::math::lcm(x[i], y[i]);
  }
  
  return out;
  
}