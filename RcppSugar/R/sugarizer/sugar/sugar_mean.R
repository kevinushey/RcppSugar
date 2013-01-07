source( "./R/sugarizer/sugarizer.R" )

sugarize(
  sugar_function="mean",
  num_args=1,
  possible_types=c("double"),
  package_dir=getwd(),
  include_dots=TRUE, ## include dot args in the call?
  export=TRUE, ## export the function?
  fallback="base::mean(x)",
  ask=FALSE
) 