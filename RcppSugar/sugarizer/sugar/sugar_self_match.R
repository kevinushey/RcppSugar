source( "./sugarizer/sugarizer.R" )

sugarize(
  sugar_function="self_match",
  num_args=1,
  possible_types=c("character", "double", "integer"),
  package_dir=getwd(),
  export=TRUE, ## export the function?
  fallback="base::match( x, base::unique(x) )", ## function to fall back to if no match to Rcpp supported types
  ask=FALSE
) 