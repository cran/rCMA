## demo/demoCMA2.R: demo usage of package rCMA.
##
## After doing the unconstrained sphere (as in demoCMA1.r, for later reference in plot), 
## the constrained sphere problem TR2 is solved. 
##
## Note that in this second case, the optimimum lies exactly at the boundary 
## of the feasible region: res2$bestX=c(1,1).
##
## This script does exactly the same as class CMAExampleConstr in cma_jAll.jar,
## but it allows to define the functions fitFunc and isFeasible on the R side. 
## They can be replaced by arbitrary other R functions, which may depend on other 
## R variables as well. 
## 
fitFunc <- function(x) {  sum(x*x); }
isFeasible <- function(x) {  (sum(x) - length(x)) > 0;  }
dimension = 2;

cma <- cmaNew(propFile="CMAEvolutionStrategy.properties");
cmaInit(cma,seed=42,dimension=dimension,initialX=1.5, initialStandardDeviations=0.2);
res1 = cmaOptimDP(cma,fitFunc,iterPrint=30);

cma <- cmaNew(propFile="CMAEvolutionStrategy.properties");
cmaInit(cma,seed=42,dimension=dimension,initialX=1.5, initialStandardDeviations=0.2);
res2 = cmaOptimDP(cma,fitFunc,isFeasible,iterPrint=30);

fTarget1 = 0;         
fTarget2 = dimension; 
plot(res1$fitnessVec-fTarget1,type="l",log="y",xlim=c(1,max(res1$nIter,res2$nIter))
    ,xlab="Iteration",ylab="Distance to target fitness");
lines(res2$fitnessVec-fTarget2,col="red");
str(res2);



