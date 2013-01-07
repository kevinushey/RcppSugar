#' RcppSugar -- the sugarizer
#' 
#' This function generates the .cpp and .R code necessary to
#' call a particular sugar-implemented function. It's like magic!
#' @param sugar_function the .cpp sugar function to be called.
#' @param num_args the number of arguments the .cpp sugar function normally calls.
#' @param possible_types the object types that the .cpp sugar function can handle.
#' @param same_types boolean. If we are calling a function with multiple arguments,
#' do we only want them to have equivalent types?
#' @param package_dir the directory in which the sugar wrapper functions should be generated.
#' @param fallback the function call to use in the case that the sugar function does not
#' have an implementation for the internal type passed to the object.
#' @param export boolean. if TRUE, we add the \code{@export} Roxygen tag, so that
#' the function is exported.
#' @param include_dots boolean. if TRUE, we include a dot arguments term. this
#' is currently used only as an assistant to fall-back functions; ie, if the
#' dot args are not \code{NULL}, we automatically fall back. This helps handle
#' sugar functions with slightly different signatures, eg. \code{match}.
#' @param ask boolean. ask before removing old files?
sugarize <- function(
  sugar_function,
  num_args,
  possible_types,
  same_types=FALSE, ## only allow matching types to pass through?
  package_dir=getwd(),
  fallback, ## function to fall back to if no match to Rcpp supported types
  export=TRUE, ## export the function?
  include_dots=FALSE, ## include dot arguments? primarily for compatibility with old fns
  ask=TRUE
  ) {
  
  source("./R/sugarizer/make_R_source_file.R")
  source("./R/sugarizer/make_Rcpp_sugar_file.R")
  
  R_arg_names=c("x", "y", "z", letters[1:23]) ## intentionally longer than necessary
  
  if( same_types ) {
    
    all_types <- do.call( function(...) { paste(..., sep="_") },
                          rep( list(possible_types), num_args )
    )
    
  } else {
    
    all_types <- do.call( function(...) { paste(..., sep="_") },
                          expand.grid( rep( list(possible_types), num_args ) )
    )
    
  }
  
  ## remove dots
  all_types <- gsub( "\\.", "_", all_types )
  
  sugar_functions <- paste( sep="_",
                            "RcppSugar",
                            sugar_function,
                            all_types
                            )
  
  make_Rcpp_sugar_file( sugar_function, 
                        num_args, 
                        possible_types, 
                        package_dir,
                        sugar_functions=sugar_functions,
                        same_types=same_types,
                        ask=ask
                        )
  
  make_R_source_file( sugar_function, 
                      num_args, 
                      possible_types, 
                      package_dir,
                      R_arg_names,
                      fallback,
                      sugar_functions=sugar_functions,
                      export=export,
                      include_dots=include_dots,
                      same_types=same_types,
                      ask=ask
                      )
  
  cat("Done!\n")
  
}