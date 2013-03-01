## This demo just displays the complete code of rCMA::cmaEvalMeanX
##
## 
cmaEvalMeanX <- function(cma,fitFunc,isFeasible) {
    meanX = .jcall(cma,"[D","getMeanX");
    rType = "Lfr/inria/optimization/cmaes/CMASolution;";
    if (isFeasible(meanX)) {
      bestSolutionObj = .jcall(cma,rType,"setFitnessOfMeanX",fitFunc(meanX));
      # setFitnessOfMeanX may update the best-ever solution
    }  else {
      bestSolutionObj = .jcall(cma,rType,"getBestSolution");
    }
    bestSolution = list(bestX = .jcall(bestSolutionObj,"[D","getX")
                      , meanX = meanX
                      , bestFitness = .jcall(bestSolutionObj,"D","getFitness")
                      , bestEvalNum = .jcall(bestSolutionObj,"J","getEvaluationNumber")
                      );
}

## just to show the syntax, without calling cmaOptimDP
fitFunc <- function(x) {  sum(x*x); }
isFeasible <- function(x) {  TRUE;  }
cma <- cmaNew();
cmaInit(cma,dimension=2,initialX=1.5);
bestSolution=cmaEvalMeanX(cma,fitFunc,isFeasible);
str(bestSolution);
