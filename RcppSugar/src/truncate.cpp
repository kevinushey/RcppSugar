#include <Rcpp.h>
using namespace Rcpp;
using namespace std;

RcppExport SEXP RcppSugar_truncate_character( SEXP a_, SEXP width_ ) {
  
  vector< string > strings = as< vector< string > >(a_);
  int width = as<int>(width_);
  vector< string > out;
  
  int len = strings.size();
  for( int i=0; i < len; i++ ) {
    out[i] = strings[i].substr(0, width);
  }
  
  return wrap(strings);  
  
}