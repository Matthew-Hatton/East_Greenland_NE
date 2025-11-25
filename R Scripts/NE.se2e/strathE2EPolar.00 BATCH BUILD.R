## Run batches of R scripts to build StrathE2EPolar West Greenland model
rm(list = ls()) #reset

library(MiMeMo.tools)
source("./regionFile.R")

#### -- Batch process scripts -- ####
## -- we actually only need to do drivers, the fishing won't change -- ##
len <- length(list.files("./R Scripts/NE.se2e/",full.names = T))
scripts <- list.files("./R Scripts/NE.se2e/",full.names = T)[3:4] %>% # all except first two (this one)
  map(MiMeMo.tools::execute) # Run the scripts