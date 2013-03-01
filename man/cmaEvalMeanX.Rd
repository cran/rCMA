\name{cmaEvalMeanX}
\alias{cmaEvalMeanX}
\title{Evaluate the meanX of the current population.}
\usage{
  cmaEvalMeanX(cma, fitFunc, isFeasible)
}
\arguments{
  \item{cma}{CMA-ES Java object, already initialized with
  \code{\link{cmaInit}}}

  \item{fitFunc}{a function to be minimized. Signature:
  accepts a vector x, returns a double.}

  \item{isFeasible}{a Boolean function checking the
  feasibility of the vector x}
}
\value{
  \code{bestSolution}, a list with entries \code{bestX},
  \code{meanX}, \code{bestFitness}, \code{bestEvalNum}
}
\description{
  After executing \code{\link{cmaOptimDP}}, there is a
  current population and a best-ever solution. Evaluate for
  the mean of the current population whether it is feasible
  and whether the mean is an even better solution. If so,
  update the best-ever solution.
}
\details{
  The code of this function is also instructive as a full
  example for the extensibility of the
  \href{http://cran.r-project.org/web/packages/rJava/index.html}{\code{rJava}}
  interface to CMA-ES. See the full code in
  \code{demo/demoEvalMeanX}. Some example
  \code{rJava}-calls are: \preformatted{
  .jcall(cma,"[D","getMeanX"); bestSolutionObj =
  .jcall(cma,"Lfr/inria/optimization/cmaes/CMASolution;","setFitnessOfMeanX",fitFunc(meanX));
  .jcall(bestSolutionObj,"J","getEvaluationNumber"); }
  Every direct method of classes in the CMA-ES Java package
  \code{cmaes} (see [Hansen09] for the complete Javadoc and
  [Hansen13] for an overview on CMA-ES in total) can be
  accessed with the \code{.jcall}-mechanism of the
  \href{http://cran.r-project.org/web/packages/rJava/index.html}{\code{rJava}}
  R package: \preformatted{
  .jcall(obj,returnType,method,...) } where \code{...}
  stands for the calling parameter(s) of \code{method}. \cr
  \code{returnType} is a string following the JNI type
  convention (see, e.g. [Sun2002]) \tabular{ccc}{ \tab
  Field Descriptor \tab Java Language Type \cr \tab Z \tab
  boolean \cr \tab C \tab char \cr \tab I \tab int \cr \tab
  J \tab long \cr \tab F \tab float \cr \tab D \tab double
  \cr \tab [I \tab int[] \cr \tab [[D \tab double[][] \cr
  \tab Ljava/langString;\tab java.lang.String \cr \tab S
  \tab java.lang.String \cr \tab T \tab short \cr } (Note:
  (a) the terminating \code{";"} in
  \code{"Ljava/langString;"} (!) and (b) \code{"S"} is a
  short hand for \code{"Ljava/langString;"} and \code{"T"}
  is the re-mapped code for \code{short}. ) \cr\cr The
  calling parameters in \code{...} have to be matched
  exactly. In R, numeric vectors are stored as
  \code{doubles}, so the calling syntax \preformatted{
  bestSolutionObj =
  .jcall(cma,rType,"setFitnessOfMeanX",fitFunc(meanX)); }
  is just right for the Java method
  \code{setFitnessOfMeanX(double[]) }. In other cases, the
  calling R variable \code{x} has to be cast explicitly:
  \tabular{ccc}{ \tab Cast \tab Java Language Type \cr \tab
  .jbyte(x) \tab byte \cr \tab .jchar(x) \tab char \cr \tab
  as.integer(x) \tab int \cr \tab .jlong(x) \tab long \cr
  \tab .jfloat(x) \tab float \cr }
}
\examples{
\dontrun{
   ## just to show the syntax, without calling cmaOptimDP
   fitFunc <- function(x) {  sum(x*x); }
   isFeasible <- function(x) {  TRUE;  }
   cma <- cmaNew(propFile="CMAEvolutionStrategy.properties");
   cmaInit(cma,dimension=2,initialX=1.5);
   bestSolution=cmaEvalMeanX(cma,fitFunc,isFeasible);
   str(bestSolution);
   }
}
\author{
  Wolfgang Konen, FHK, 2013
}
\references{
  [Hansen09] \url{https://www.lri.fr/~hansen/javadoc}
  Nikolaus Hansen: Javadoc for CMA-ES Java package
  fr.inria.optimization.cmaes, 2009.  \cr [Hansen13]
  \url{https://www.lri.fr/~hansen/cmaesintro.html} Nikolaus
  Hansen: The CMA Evolution Strategy, 2013. \cr [Sun2002]
  \url{http://192.9.162.55/docs/books/jni/html/types.html#58909}
  Sun Microsystems: The Java Native Interface.
  Programmer's Guide and Specification.
  \href{http://192.9.162.55/docs/books/jni/html/types.html}{Chapter
  12 (JNI Types)}, Sec. 12.3.3. (JNI Field Descriptors),
  2002.
}
\seealso{
  \code{\link{cmaInit}}, \code{\link{cmaOptimDP}}
}

