#include <Rcpp.h>
#include <boost/algorithm/string/replace.hpp>

using namespace Rcpp;

RcppExport SEXP str_replace( SEXP x_, SEXP from_, SEXP to_ ) {
  
  std::vector< std::string > strings = as< std::vector< std::string > >(x_);
  std::string from = as<std::string>(from_);
  std::string to = as<std::string>(to_);
  
  int len = strings.size();
  for( int i=0; i < len; i++ ) {
    boost::algorithm::replace_all( strings[i], from, to );
  }
  
  return wrap(strings);
  
}
