## sugarize the files
files <- list.files( "./sugarizer/sugar", full.names=TRUE )
for( file in files ) source(file)