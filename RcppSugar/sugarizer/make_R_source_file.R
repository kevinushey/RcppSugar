make_R_source_file <- function(sugar_function, 
                               num_args, 
                               possible_types, 
                               package_dir,
                               R_arg_names,
                               fallback,
                               sugar_functions,
                               export,
                               include_dots,
                               same_types,
                               ask) {
  
  cat( "Making R sugar source file...\n" )
  
  file_path <- file.path(
    package_dir, "R", paste(sugar_function, ".R", sep="")
  )
  
  if( ask ) {
    if( file.exists( file_path ) ) {
      cat("Warning! File exists at location:\n\t", file_path, 
          "\n\nDo you want to overwrite this file? (y/n):")
      tmp <- scan( what="character", n=1, quiet=TRUE )
      if( length( grep( "^y", tmp ) > 0 ) ) {
        unlink( file_path)
      } else {
        stop("Did not make sugar R source file.")
      }
    }
  } else {
    if( file.exists( file_path ) ) {
      unlink( file_path )
    }
  }
  
  R_file <- file( file_path, open="wt" )
 
  w <- writeLine <- function(...) {
    cat( paste( sep="", paste(..., sep=""), "\n" ), file=R_file )
  }
  
  w1 <- function(...) {
    cat( paste( "\t", sep="", paste( gsub( "\n", "\n\t", ...), sep=""), "\n" ), file=R_file )
  }
  
  rox_param <- paste( sep="",
                      "#' @param ", R_arg_names[1:num_args],
                      " a vector of storage mode: ",
                      paste( possible_types, collapse=", " )
  )
  
  #################
  ## Roxygen Doc ##
  #################
  
  w( "#' Rcpp Sugar -- ", sugar_function )
  w( "#' " )
  w( "#' This function implements the Rcpp sugar function \\code{", sugar_function, "}." )
  for( line in rox_param ) {
    w(line)
  }
  
  if( isTRUE(include_dots) ) {
    w("#' @param ... additional arguments used for compatibility")
  }
  
  if( isTRUE(export) ) { 
    w("#' @export")
  }
  
  ##############
  ## Examples ##
  ##############
  
  ## TODO
  
  ############
  ## R code ##
  ############
  
  ## type statement
  if( num_args==1 ) {
    type_statement <- paste( sep="", "types <- typeof(", R_arg_names[1], ")" )
  } else {
    type_statement <- paste( 
      sep="",
      "types <- paste( sep=\"_\", \n",
      paste( "\ttypeof(", R_arg_names[1:num_args], ")", collapse=",\n"),
      "\n)")
  }
  
  if( same_types ) {
    types <- do.call( function(...) { paste(..., sep="_") },
                      rep( list(possible_types), num_args )
    ) 
  } else {
    types <- do.call( function(...) { paste(..., sep="_") },
                      expand.grid( rep( list(possible_types), num_args ) )
    )
  }
  
  ## switch statement
  
  call_statements <- paste( sep="",
                            types,
                            "=",
                            ".Call( ",
                            '"', sugar_functions, '"',
                            ", ",
                            paste( R_arg_names[1:num_args], collapse=", " ),
                            ", PACKAGE=\"RcppSugar\" )"
  )
  
  ## add fallback
  call_statements <- c( call_statements, fallback )
  
  switch_statement <- paste( sep="", "switch( types, \n\t",
                            paste( collapse=",\n\t", call_statements ),
                            "\n)")
  
  params <- paste( R_arg_names[1:num_args], collapse=", " )
  
  ########################
  ## Writing it all out ##
  ########################
  
  initial_statement <- paste( sep="",
                              "sugar_",
                              sugar_function,
                              " <- function(",
                              params,
                              if( isTRUE(include_dots) ) { ", ... " },
                              ") {\n" )
  
  w( initial_statement )
  
  if( isTRUE( include_dots ) ) {
    statement <- paste( sep="",
                        "if( !is.null( match.call(expand.dots=FALSE)$`...` ) ) {\n", 
                        "\treturn( ", fallback, " )\n",
                        "}\n"
                        )
    w1(statement)
  }
  
  w1( type_statement )
  w1("")
  w1(switch_statement)
  w("\n}")
  
  close(R_file)
  
}