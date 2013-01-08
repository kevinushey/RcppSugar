source( "./sugarizer/sugarizer.R" )

sugarize(
  sugar_function="table",
  num_args=1,
  possible_types=c("character", "double", "integer"),
  package_dir=getwd(),
  ask=FALSE,
  include_dots=TRUE, ## include dot args in the call?
  export=TRUE, ## export the function?
  fallback="base::table( x, ... )" ## function to fall back to if no match to Rcpp supported types
) 