rm(list = ls()) # reset

library(tidyverse)

source("./regionFile.R")
start_years <- c(2011,seq(2020,2050,10))
end_years <- c(2019,seq(2030,2060,10))

Lights <- data.frame(Month = NA,SSP = NA,
                     Forcing = NA,Measured = NA,
                     Year = NA)

for (i in seq_along(start_years)) {
  My_light <- readRDS("./Objects/physics/light.rds") %>% 
    filter(Forcing == forcing & SSP == paste0("ssp",ssp) & between(Year,start_years[i],end_year[i])) %>%               # Limit to reference period and variable
    group_by(Month,SSP,Forcing) %>%                                                       # Average across months
    summarise(Measured = mean(Light, na.rm = T)) %>% 
    ungroup() %>% 
    arrange(Month) %>% 
    mutate(Year = start_years[i])
  Lights <- rbind(Lights,My_light)
}

Lights <- Lights %>% 
  mutate(Date = make_date(Year, Month, 1))

## --  as StrathE2EPolar sees -- ##
ggplot() +
  geom_line(data = Lights,aes(x = Date,y = Measured))


My_light <- readRDS("./Objects/physics/light.rds") %>% 
  filter(Forcing == forcing & SSP == paste0("ssp",ssp))

ggplot(data = My_light,aes(x = Date,y = Light)) +
  geom_line() +
  geom_smooth()
