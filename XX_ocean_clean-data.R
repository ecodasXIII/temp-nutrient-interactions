#### Ocean time series working script for integrating data ####
### Ocean time series ###
# copy first row of variable names and remove commas#
header1 = gsub(",","",scan("./raw-data/Ocean-Time-Series/Aloha_HOT-DOGS/HOT-DOGS_Prim-Prod_10-01-1988-12-31-2017.csv", nlines = 1, sep = ",", what = character()))
#copy second row of variable units, removing commas###
header2 = gsub(",","",scan("./raw-data/Ocean-Time-Series/Aloha_HOT-DOGS/HOT-DOGS_Prim-Prod_10-01-1988-12-31-2017.csv", nlines = 1, sep = ",", skip = 1, what = character()))

#read in file skipping first two rows
aloha_test = read.csv(file = "./raw-data/Ocean-Time-Series/Aloha_HOT-DOGS/HOT-DOGS_Prim-Prod_10-01-1988-12-31-2017.csv", skip = 2, header = F)
#rename columns from header2
names(aloha_test) = paste0(header1,header2);aloha_test =aloha_test[,-16]                   
str(aloha_test)  

#remove no data obs
aloha_data = aloha_test %>%
  filter(l12 != -9) %>%
  select(c(crn:chl,l12)) %>%
  mutate(rel_PP = l12/chl)

ggplot(aloha_data, aes(y = log(rel_PP), x = depth)) + geom_point() + geom_smooth()
