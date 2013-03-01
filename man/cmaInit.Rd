\name{cmaInit}
\alias{cmaInit}
\title{Initialize a CMA-ES Java object.}
\usage{
  cmaInit(cma, seed = NULL, dimension = NULL,
    initialX = NULL, initialStandardDeviations = NULL)
}
\arguments{
  \item{cma}{CMA-ES Java object, as created by
  \code{\link{cmaNew}}}

  \item{seed}{[NULL] if not NULL, set the seed to the given
  value}

  \item{dimension}{[NULL] if not NULL, overwrite the
  dimension setting from \code{propFile}
  (\code{\link{cmaNew}})}

  \item{initialX}{[NULL] if not NULL, overwrite the
  initialX setting from \code{propFile}
  (\code{\link{cmaNew}}).  initialX can be a double or a
  double vector of length \code{dimension}.}

  \item{initialStandardDeviations}{[NULL] if not NULL,
  overwrite the initialStandardDeviations setting from
  \code{propFile} \code{\link{cmaNew}}.
  initialStandardDeviations can be a double or a double
  vector of length \code{dimension}.}
}
\value{
  \code{fitness}, a vector of 0's with the length of the
  intended population.
}
\description{
  Initialize a CMA-ES Java object.
}
\note{
  As a side effect, the CMA-ES Java object \code{cma} of
  class \code{CMAEvolutionStrategy} is transferred into an
  augmented state.
}
\examples{
cma <- cmaNew();
   cmaInit(cma,seed=42,dimension=2,initialX=1.5);
}
\author{
  Wolfgang Konen, FHK, 2013
}
\seealso{
  \code{\link{cmaNew}}, \code{\link{cmaOptimDP}}
}

