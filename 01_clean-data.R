## 1) script to clean and wrangle data
library(tidyverse, verbose = F)
library(ggplot2)
theme_mod <- function(){theme_bw() %+replace% theme(panel.grid = element_blank())}
theme_set(theme_mod()) 

## Data import
Data_Beck=read.csv("raw-data/Beck Data/Beck Data.csv")
Data_Elser=read.csv("raw-data/Elser-et-al-2007_Global-N-P-limitation/data/doi_10.5063_AA_nceasadmin.910.2-np-analysis-dataset-out-for-datasharing.csv")
Data_Vanni=read.csv("raw-data/Vanni-et-al_2017_Animal-excretion/Aquatic_animal_excretion_data.csv")
#added "as.character" to following 4 lines of code to avoid getting just the internal integer codes (https://stackoverflow.com/questions/6328771/changing-values-when-converting-column-type-to-numeric)
Data_Vanni$Temperature..C.=as.numeric(as.character(Data_Vanni$Temperature..C.))
Data_Vanni$P.excretion.rate..ug.P.ind.h.=as.numeric(as.character(Data_Vanni$P.excretion.rate..ug.P.ind.h.))
Data_Vanni$N.excretion.rate..ug.N.ind.h.=as.numeric(as.character(Data_Vanni$N.excretion.rate..ug.N.ind.h.))
Data_Vanni$Excreted.N.P..molar.=as.numeric(as.character(Data_Vanni$Excreted.N.P..molar.))
max(Data_Vanni$Temperature..C., na.rm=TRUE)
min(Data_Vanni$Temperature..C., na.rm=TRUE)

## Elser: set variables of interest
var_names_Elser = c("id_study","system", "strata", "habitat", "cat", "tax_resp_class",
              "l.n.c","l.p.c","l.int.c","temp","n_avail","n_total","p_avail",
              "p_total", "light", "location", "latitud","longitud","elev","duration")

#Filter to variables of interest that have temperature values in aquatic systems
TempData_Elser <- Data_Elser %>%
  select(var_names_Elser) %>%
  filter(system %in% c("FRESHWATER", "MARINE")) %>%
  filter(!is.na(temp))
  

##Beck: set variables of interest
var_names_Beck=c("Ref", "Site.Name", "Latitude_GoogleEarth", "Longitude_GoogleEarth", "Days", "Nitrogen.Molarity",
                 "Phosphorus.Molarity", "Elevation_m", "Depth_m", "Canopy_Percent", "Canopy_Qual", "Temp_C",
                 "NH4_ug_L", "NO3_ug_L", "DIN_ug_L", "TN_mg_L", "SRP_ug_L", "TP_ug_L", "NO3_SRP_Ratio", 
                 "Control_mean_mg_m2", "Control.SE", 
                 "N_mean_mg_m2", "N.SE", "N.LRR.Effect", "N.LRR.Variance",
                 "P_mean_mg_m2", "P.SE", "P.LRR.Effect", "P.LRR.Variance",
                 "NP_mean_mg_m2", "NP.SE", "NP.LRR", "NP.LRR.Variance")

#Filter to variables of interest that have temperature values
TempData_Beck <- Data_Beck %>%
  select(var_names_Beck) %>%
  filter(!is.na(Temp_C))

##Vanni: set variables of interest

#Many of these could be interesting to explore, and variable names are really strangely formatted
#so I'm going to leave as-is for now

TempData_Vanni <- Data_Vanni%>%
  filter(!is.na(Temperature..C.))
