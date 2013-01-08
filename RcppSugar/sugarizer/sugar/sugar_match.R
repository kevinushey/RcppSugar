source( "./sugarizer/sugarizer.R" )

sugarize(
  sugar_function="match",
  num_args=2,
  possible_types=c("character", "double", "integer"),
  same_types=TRUE,
  package_dir=getwd(),
  include_dots=TRUE, ## include dot args in the call?
  export=TRUE, ## export the function?
  fallback='base::match(x, y, ...)', ## function to fall back to if no match to Rcpp supported types
  ask=FALSE
  )