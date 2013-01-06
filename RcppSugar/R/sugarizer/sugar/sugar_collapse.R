source( "./R/sugarizer/sugarizer.R" )

sugarize(
  sugar_function="collapse",
  num_args=1,
  possible_types=c("character"),
  package_dir=getwd(),
  include_dots=FALSE, ## include dot args in the call?
  export=TRUE, ## export the function?
  fallback='base::paste(x, collapse="")', ## function to fall back to if no match to Rcpp supported types
  ask=FALSE
) 