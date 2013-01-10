#include <Rcpp.h>
#include <boost/algorithm/string/replace.hpp>

using namespace std;
using namespace Rcpp;

RcppExport SEXP str_replace( SEXP x_, SEXP from_, SEXP to_ ) {
  
  vector< string > strings = as< vector< string > >(x_);
  string from = as<string>(from_);
  string to = as<string>(to_);
  
  int len = strings.size();
  for( int i=0; i < len; i++ ) {
    boost::algorithm::replace_all( strings[i], from, to );
  }
  
  return wrap(strings);
  
}