#' Attach Sugar Functions
#' 
#' This function removed the \code{sugar_} prefix from function names,
#' assigns them to the \code{.RcppSugar.Exports} environment, and attached
#' that environment. These functions will hence mask any functions of the
#' same name in the \code{.GlobalEnv}. Only do this if you're crazy
#' or feel like experimenting!
#' 
#' @export
#' @param list boolean. list the names of all functions that have been exported?
#' @seealso \code{\link{detach_sugar}}, to undo the effects of this function
attach_sugar <- function(list=TRUE) {
  
  if( ".RcppSugar.Exports" %in% search() ) {
    warning("RcppSugar functions already attached!")
    return( invisible(NULL) )
  }
  
  .RcppSugar.Exports <- new.env()
  
  RcppSugar_pos <- grep( "RcppSugar", search() ) 
  RcppSugar_env <- as.environment( RcppSugar_pos )
  
  sugar_functions <- grep("^sugar", ls( pos=RcppSugar_pos ), value=TRUE)
  
  if( list ) {
    cat("Attaching functions: \n\t", 
        paste( collapse=", ", gsub( "sugar_", "", sugar_functions ) ),
        "\n\n"
        )
  }
  
  for( sugar in sugar_functions ) {
    fn <- gsub( "sugar_", "", sugar )
    assign( fn, get(sugar), env=.RcppSugar.Exports )
    rm( fn )
  }
  
  attach( .RcppSugar.Exports )
  
}

#' Detach Sugar Functions
#' 
#' This function un-attaches any functions attached through \code{attach_sugar()}.
#' 
#' @export
#' @seealso \code{\link{attach_sugar}}

detach_sugar <- function() {
  if( !(".RcppSugar.Exports" %in% search()) ) {
    warning("RcppSugar functions not currently attached.")
    return( invisible(NULL) )
  }
  
  detach(".RcppSugar.Exports")
  message("Sugar functions detached.")
  
}