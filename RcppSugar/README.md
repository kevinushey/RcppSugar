RcppSugar
=========
  
This package is a simple implementation of some of the Rcpp 'sugar' 
functions exported in the new versions of 
[Rcpp](http://cran.r-project.org/web/packages/Rcpp/index.html).

Install me using devtools:

    library("devtools")
    install_github("RcppSugar", "cdrv", subdir="RcppSugar")
    
Although the functions exported will mask the same functions
available in `base`, the functions will fall back to the base-R
implementation if the class of the object does not match an
available `RcppSugar` implementation.