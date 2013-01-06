make_Rcpp_sugar_file <- function( sugar_function, 
                                  num_args, 
                                  possible_types, 
                                  package_dir,
                                  sugar_functions,
                                  same_types,
                                  ask) {
  
  cat( "Making C++ sugar source file...\n" )
  
  file_path <- file.path(
    package_dir, "src", paste(sugar_function, ".cpp", sep="")
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
  
  cpp_file <- file( file_path, open="wt" )
  
  writeLine <- function(x) {
    cat( paste(x, "\n", sep=""), file=cpp_file )
  }
  
  letters_ <- paste( letters, "_", sep="" )
  args_vector <- paste( "SEXP", letters_[1:num_args] )
  args <- paste( args_vector, collapse=", " )
  
  Rcpp_vector_types <- Kmisc::kReplace( possible_types,
                                        c("character", "double", "integer"),
                                        c("CharacterVector", "NumericVector", "IntegerVector")
  )
  
  if( same_types ) {
    Rcpp_vector_types_expand <- as.data.frame(
      rep( list(Rcpp_vector_types), num_args )
      )
  } else {
    Rcpp_vector_types_expand <- as.data.frame(
      expand.grid( rep( list(Rcpp_vector_types), num_args ) )
    )
  }
  
  as_calls_df <- sapply( 1:num_args,function(i) {
    return( paste( sep="",
                   "as< ", Rcpp_vector_types_expand[[i]], " >", 
                   paste( sep="", "(", letters_[i], ")" )
    ) )
  })
  
  as_calls <- do.call( function(...) { paste( ..., sep=", " ) },
                       as.data.frame(as_calls_df)
  )
  
  function_definitions <- character( length(sugar_functions) )
  full_calls <- paste( sep="",
                       "RcppExport SEXP ",
                       sugar_functions,
                       "( ",
                       args,
                       ") {\n",
                       "\treturn wrap( ",
                       sugar_function,
                       "( ",
                       as_calls,
                       " ) );",
                       "\n}\n"
  )
  
  writeLine("#include <Rcpp.h>")
  writeLine("using namespace Rcpp;")
  writeLine("")
  for( call in full_calls ) {
    writeLine(call)
  }
  close( cpp_file )
  
}