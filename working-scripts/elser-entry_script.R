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

### Data clean up of raw Elser 2007 data ####

rm(list = ls())

elsie_study_df = read.csv(file ="./raw-data/Elser-et-al-2007_Global-N-P-limitation/data/raw-data/ELSIE_study_sheet.csv",T)
elsie_study_df = elsie_study_df %>% select(c(ID_study, system, latitud, longitud, n_avail, n_total, p_avail, p_total, c_total, light, temp, duration, vol))
elsie_study_df = elsie_study_df %>% mutate_at(vars(latitud:vol), as.character) %>% mutate_at(vars(latitud:vol),str_replace_all,pattern = "\\.$", replacement = "NA")
elsie_study_df[ elsie_study_df == "NA" ] <- NA
elsie_study_df = elsie_study_df %>% filter(!is.na(temp))

elsie_response_df = read.csv(file ="./raw-data/Elser-et-al-2007_Global-N-P-limitation/data/raw-data/ELSIE_response_sheet.csv",T)
elsie_response_df = elsie_response_df %>% select(c(ID_study, tax_resp, tax_resp_mn, tax_resp_sd, tax_resp_reps,
                                                   tax_resp_cat, tax_resp_typ, n_add, p_add, n_rate, p_rate))
elsie_response_df = elsie_response_df %>% mutate_at(vars(tax_resp_mn:p_rate), as.character) %>% mutate_at(vars(tax_resp_mn:p_rate),str_replace_all,pattern = "\\.$", replacement = "NA")
elsie_response_df[elsie_response_df == "NA"] <- NA

elsie_ratios_df = read.csv(file ="./raw-data/Elser-et-al-2007_Global-N-P-limitation/data/raw-data/ELSIE_ratios_sheet.csv",T)
elsie_ratios_df = elsie_ratios_df %>% select(c(ID_study, tax_resp, tax_resp_mn, tax_resp_sd, tax_resp_reps, tax_resp_cat,
                                               tax_resp_typ, tax_resp_unit, n_add, p_add, n_rate, p_rate, fert_unit))
elsie_ratios_df = elsie_ratios_df %>% mutate_at(vars(tax_resp_mn:fert_unit), as.character) %>% mutate_at(vars(tax_resp_mn:fert_unit), str_replace_all, pattern = "\\.$", replacement = "NA")
elsie_ratios_df[elsie_ratios_df == "NA"] <- NA

###
elsie_df = elsie_study_df %>% inner_join(elsie_response_df) %>% filter(system %in% c("freshwater","marine"))

elsie_df = elsie_df %>% bind_rows(elsie_ratios_df)
write.table(elsie_df, file = "./raw-data/Elser-et-al-2007_Global-N-P-limitation/data/elsie_df.csv", row.names = FALSE, sep = ",")


#### End raw cleanup ###

#quick look at  biomass and duration and temp ##

ggplot(elsie_df, aes(x = log10(as.numeric(duration)), y = log(as.numeric(tax_resp_mn)), group = ID_study))+geom_point(aes(colour = ID_study),size = 2) + theme(legend.position = "none")

ggplot(elsie_df, aes(x = as.numeric(temp), y = log(as.numeric(tax_resp_mn)), group = ID_study)) + geom_point(aes(colour = ID_study), size =2) + theme(legend.position = "none")
