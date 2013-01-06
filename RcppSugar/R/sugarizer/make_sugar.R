## sugarize the files
files <- list.files( "./R/sugarizer/sugar/", full.names=TRUE )
for( file in files ) source(file)