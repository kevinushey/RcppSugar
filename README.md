RcppSugar
=========
  
This package is a simple implementation of some of the Rcpp 'sugar' 
functions exported in the new versions of 
[Rcpp](http://cran.r-project.org/web/packages/Rcpp/index.html). The functions
exported by this package are intended to give you a 'free' speed-up when called
on objects handlable by the corresponding sugar function; if we cannot handle
the supplied objects, we defer to the base-R implementation.

Install me using devtools. Note that your system will need appropriate compilers
(g++) to build this package; in particular, if you're a Windows user make sure 
you have [Rtools](http://cran.r-project.org/bin/windows/Rtools/) installed and in your
`PATH`.

    library("devtools")
    install_github("RcppSugar", "cdrv", subdir="RcppSugar")
    
Although the functions exported will mask the same functions
available in `base`, the functions will fall back to the base-R
implementation if the class of the object does not match an
available `RcppSugar` implementation.

This package is currently in a (very) beta version -- please let me know if
you encounter any strange bugs.