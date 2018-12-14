# script to clean and wrangle data
library(tidyverse, verbose = F)
library(ggplot2)
theme_mod <- function(){theme_bw() %+replace% theme(panel.grid = element_blank())}
theme_set(theme_mod()) 
#Elser et al. data import
global_NP = read.csv(file = "./raw-data/Elser-et-al-2007_Global-N-P-limitation/data/doi_10.5063_AA_nceasadmin.910.2-np-analysis-dataset-out-for-datasharing.csv",T)

#set variables of interest
var_names = c("id_study","system", "strata", "habitat", "cat", "tax_resp_class",
              "l.n.c","l.p.c","l.int.c","temp","n_avail","n_total","p_avail",
              "p_total", "light", "location", "latitud","longitud","elev","duration")
#filter to  variables of interest and with temperature data
aquatic_NP <- global_NP %>%
  select(var_names) %>%
  filter(system %in% c("FRESHWATER", "MARINE")) %>%
  filter(!is.na(temp))
