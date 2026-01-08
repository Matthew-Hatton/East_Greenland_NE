## Here we test fitted values time series to see if they look right

rm(list = ls()) # reset
library(StrathE2EPolar)
library(patchwork)

model <- e2ep_read("East_Greenland",
                   "2011-2019-CNRM-SSP370")
results <- e2ep_run(model = model,nyears = 1000)

e2ep_plot_ts(model = model,results = results)

# save I.C
init_conditions <- e2ep_extract_start(model = model,results = results)
write.csv(init_conditions,"C:/Users/psb22188/AppData/Local/R/win-library/4.5/StrathE2EPolar/extdata/Models/East_Greenland/2011-2019-CNRM-SSP370/Param/initial_values_EG_2011-2019.csv")

model_NM <- e2ep_read("East_Greenland",
                      "2011-2019")
results_NM <- e2ep_run(model = model_NM,
                       nyears = 1)
e2ep_plot_ts(model = model_NM,
             results = results_NM)

## -- Test -- ##
# New initial conditions should give a steady state immediately
model2 <- e2ep_read("East_Greenland",
                    "2011-2019-CNRM-SSP370")
results2 <- e2ep_run(model = model2,nyears = 1)
e2ep_plot_ts(model = model2,results = results2)