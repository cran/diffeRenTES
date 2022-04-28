## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ---- message=FALSE, warning=FALSE, results = "hide", eval=FALSE--------------
#  library(devtools)
#  devtools::install_github("mbraccini/diffeRenTES")

## ----setup--------------------------------------------------------------------
library(diffeRenTES)
library(BoolNet)

## ---- message=FALSE, warning=FALSE, results = "hide",echo=FALSE---------------
set.seed(333)

## ---- warning=FALSE-----------------------------------------------------------
net <- BoolNet::generateRandomNKNetwork(10, 2)
attractors <- BoolNet::getAttractors(net) 

# Attractors Transition Matrix computation
ATM <- getATM(net, attractors, MAX_STEPS_TO_FIND_ATTRACTORS = 100) 

# ATM structure in matrix format.
# a1, a2, etc. refer to the attractors found.
print(ATM$ATM)

# No. perturbations that have not reach another attractor within the provided MAX_STEPS_TO_FIND_ATTRACTORS
print(ATM$lostFLips)

## ---- warning=FALSE-----------------------------------------------------------
#TESs computation
TESs <- getTESs(ATM) 

#Retrieve the computed TESs
print(TESs$TES)

#And the noise thresholds at which they emerge.
print(TESs$thresholds)

## ----message=FALSE, warning=FALSE,results = "hide"----------------------------
# Saving the TES-based differentiation tree into a file
saveDifferentiationTreeToFile(TESs, file.path(tempdir(), "example.svg")) 

