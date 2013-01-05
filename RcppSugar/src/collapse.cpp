#include <Rcpp.h>
using namespace Rcpp;

RcppExport SEXP RcppSugar_collapse( SEXP a_ ) {
  
  return wrap( collapse( as<CharacterVector>(a_) ) );
  
}