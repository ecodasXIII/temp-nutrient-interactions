#elser manual entry script 
source("./working-scripts/load_packages.R") #load packages and functions
#get data
Data_Elser=read.csv("raw-data/Elser-et-al-2007_Global-N-P-limitation/data/doi_10.5063_AA_nceasadmin.910.2-np-analysis-dataset-out-for-datasharing.csv")
#filter data to those with temp and aquatic
Temp_Aq_Data_Elser <- Data_Elser %>%
  filter(system %in% c("FRESHWATER", "MARINE")) %>%
  filter(!is.na(temp))
#get the citation info
author_list = Temp_Aq_Data_Elser$author
citation_list = Temp_Aq_Data_Elser$citation
l.n.c = Temp_Aq_Data_Elser$l.n.c
l.p.c = Temp_Aq_Data_Elser$l.p.c
l.int.c = Temp_Aq_Data_Elser$l.int.c

elser_manual_df = data.frame(author =author_list, citation = citation_list, 
                             l.n.c = l.n.c, l.p.c = l.p.c, l.int.c = l.int.c,
                             control_meas = NA, control_unit = NA, notes = NA)
#Create a database for manual entry of control means for backing out of response ratio
#Do not run this without 
##write.csv(elser_manual_df, file = './raw-data/Elser-et-al-2007_Global-N-P-limitation/data/elser_manual.csv', row.names = F)
