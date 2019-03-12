## eco-das XIII temperature-nutrient interactions

A repository related to the temperature-nutrient interactions working group

## Files
* raw data - folder containing raw data, metadata, readme, etc for individual datasets
* '01_exploratory-plots.Rmd' - script to clean data from raw and produce initial plots 
* '02_initial-stats-Beck-data.Rmd' - script to create plots, regressions, ANCOVAs from Beck data
* '03_initial_stats-Beck-data.Rmd' - script to create plots, regressions, ANCOVAs from Beck data; nutrients only included if they were limited in a given stream 

## Data overview

- Elser et al. 2007

Notes on variables of interest (working)

*System specs:

  - system (marine, terrestrial, freshwater)
  - strata (pelagic, benthic, aboveground, belowground)
  - habitat (general habitat description)
  - cat (categorized habitat description)

*Response vars: 

  - tax_resp_class(Biomass,Growth rate, Production)
  - l.n.c. (ln N response ratio)
  - l.p.c. (ln P response ratio)
  - l.int.c (ln N+P response ratio)
  
*Driver vars:

  - temp (mean temp &deg;C over duration)
  - n_avail (ambient N &mu;mol L^-1)
  - n_total (total N &mu;mol L^-1)
  - p_avail (ambient P &mu;mol L^-1)
  - p_total (Total P &mu;mol L^-1)
  - light(mean daily irradiance &mu;mol photons m^-2 s^-1)
  
*Potenial other variables:

  - location (place name, country, site)
  - latitud (latitude -90[S] to +90[N])
  - longitud (longitude -180[W] to +180[E])
  - elev (elevation [m] Depth below sea level is negative)
  - duration (days)



- Aloha HOT-DOGS

* System specs - 
* Response vars - 
* Driver vars - 
