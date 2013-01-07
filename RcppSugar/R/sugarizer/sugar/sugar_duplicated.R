source( "./R/sugarizer/sugarizer.R" )

sugarize(
  sugar_function="duplicated",
  num_args=1,
  possible_types=c("double", "integer", "character"),
  package_dir=getwd(),
  include_dots=TRUE, ## include dot args in the call?
  export=TRUE, ## export the function?
  fallback="base::duplicated(x, ...)", ## function to fall back to if no match to Rcpp supported types
  ask=FALSE
) 