RcppSugar
=========
  
This package is a simple implementation of some of the Rcpp 'sugar' 
functions exported in the new versions of 
[Rcpp](http://cran.r-project.org/web/packages/Rcpp/index.html).

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