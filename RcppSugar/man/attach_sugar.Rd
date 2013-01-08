\name{attach_sugar}
\alias{attach_sugar}
\title{Attach Sugar Functions}
\usage{
  attach_sugar(list = TRUE)
}
\arguments{
  \item{list}{boolean. list the names of all functions that
  have been exported?}
}
\description{
  This function removed the \code{sugar_} prefix from
  function names, assigns them to the
  \code{.RcppSugar.Exports} environment, and attached that
  environment. These functions will hence mask any
  functions of the same name in the \code{.GlobalEnv}. Only
  do this if you're crazy or feel like experimenting!
}
\seealso{
  \code{\link{detach_sugar}}, to undo the effects of this
  function
}

