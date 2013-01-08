#include <Rcpp.h>
using namespace Rcpp;
using namespace std;

RcppExport SEXP RcppSugar_collapse_character( SEXP a_) {
	return wrap( collapse( as< CharacterVector >(a_) ) );
}