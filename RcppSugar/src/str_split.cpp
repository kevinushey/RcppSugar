#include <Rcpp.h>
#include <boost/regex.hpp>
#include <boost/algorithm/string/classification.hpp>
#include <boost/algorithm/string/regex.hpp>
#include <boost/algorithm/string.hpp>

using namespace Rcpp;
using namespace std;

RcppExport SEXP str_split( SEXP x_, SEXP split_, SEXP fixed_ ) {
  
  string x = as<string>(x_);
  char const* split = as<char const*>(split_);
  vector< string > out;
  bool fixed = as<bool>(fixed_);
  
  if( fixed ) {
    boost::iter_split( out, x, boost::first_finder(split, boost::is_iequal()));
  } else {
    boost::split_regex( out, x, boost::regex(split) );
  }
  
  return wrap(out);
  
}