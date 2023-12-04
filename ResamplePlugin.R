library(AppliedPredictiveModeling)
transparentTheme(trans = .4)
library(caret)

dyn.load(paste("RPluMA", .Platform$dynlib.ext, sep=""))
source("RPluMA.R")


input <- function(inputfile) {
	pfix = prefix()
	parameters <<- read.table(inputfile, as.is=T);
  rownames(parameters) <<- parameters[,1];

   # Need to get the three files
   model1 <<- readRDS(paste(pfix, parameters["model1", 2], sep="/"))
   model2 <<- readRDS(paste(pfix, parameters["model2", 2], sep="/"))
}

run <- function() {}

output <- function(outputfile) {
   resamps <- resamples(list(model1, model2))
print(summary(resamps))
saveRDS(resamps, outputfile)
}

