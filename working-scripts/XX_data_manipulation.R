source("./working-scripts/load_packages.R") #load packages and functions

Data_Beck=read.csv("raw-data/Beck Data/Beck Data.csv")


var_names_Beck=c("Ref", "Site.Name", "Latitude_GoogleEarth", "Longitude_GoogleEarth", "Days", "Nitrogen.Molarity",
                 "Phosphorus.Molarity", "Elevation_m", "Depth_m", "Canopy_Percent", "Canopy_Qual", "Temp_C",
                 "NH4_ug_L", "NO3_ug_L", "DIN_ug_L", "TN_mg_L", "SRP_ug_L", "TP_ug_L", "NO3_SRP_Ratio", 
                 "Control_mean_mg_m2", "Control.SE", "Chla_Instrument",
                 "N_mean_mg_m2", "N.SE", "N.LRR.Effect", "N.LRR.Variance",
                 "P_mean_mg_m2", "P.SE", "P.LRR.Effect", "P.LRR.Variance",
                 "NP_mean_mg_m2", "NP.SE", "NP.LRR", "NP.LRR.Variance")

TempData_Beck <- Data_Beck %>%
  select(all_of(var_names_Beck)) %>%
  filter(!is.na(Temp_C)) %>%
  mutate(tempkt = C_to_overkt(Temp_C))

response_beck = TempData_Beck %>%
  select(contains("_mg_m2"), tempkt,Days,contains("_L"),Chla_Instrument, NO3_SRP_Ratio) %>%
  rename("molNP" = NO3_SRP_Ratio) %>%
  rename_at(vars(contains("_")), list(~str_remove(.,"_.+$"))) %>%
  gather(key = txt, value = mg_m2, -c(tempkt:molNP)) %>%
  mutate(log_resp = log(mg_m2),
         resp_rate_d = mg_m2/Days,
         log_resp_rate_d = log(resp_rate_d),
         limitation = ifelse(molNP >= 16, "P","N"))

ggplot(response_beck, aes(x = overkt_to_C(tempkt), y = log10(resp_rate_d), group = txt)) + 
  geom_point(aes(fill = log10(molNP)),size = 2, alpha = 0.9, shape = 21, colour = 'grey') +
  geom_smooth(aes(colour = txt),span = 0.95,se= FALSE) + 
  theme_mod() + 
  scale_x_continuous(name = expression("Temperature ("*degree*"C)"), limits = c(0,35),
                     sec.axis = dup_axis(
                       breaks = breaks_in_C_plus,
                       labels = breaks_in_kt_stand,
                       name = expression("Standard temperature (1/"~italic(kT)*")")),
                     expand = c(0.03,0)) +
  # scale_colour_manual(colors = (''))+
  scale_fill_gradient2(low = "red" ,mid = "white", high = "blue", midpoint = log10(16)) +
  facet_wrap(~limitation)

ggplot(response_beck, aes(x = overkt_to_C(tempkt), y = log10(resp_rate_d), group = txt, colour = txt)) + 
  geom_point(size = 2, alpha = 0.4) +
  geom_smooth(span = 0.9,se= FALSE) + 
  theme_mod() + 
  scale_x_continuous(name = expression("Temperature ("*degree*"C)"), limits = c(0,35),
                     sec.axis = dup_axis(
                       breaks = breaks_in_C_plus,
                       labels = breaks_in_kt_stand,
                       name = expression("Standard temperature (1/"~italic(kT)*")")),
                     expand = c(0.03,0)) +
  facet_wrap(~txt)

ggplot(response_beck, aes(x = log10(SRP), y = log10(resp_rate_d))) +
         geom_point(aes(fill = overkt_to_C(tempkt)),size = 3, alpha = 0.8, shape = 21) +
         geom_smooth(span = 0.7,se= FALSE) + 
         theme_mod() + 
  scale_fill_gradientn(colors = ocecolors[['temperature']]) +
         facet_wrap(~txt)

ggplot(response_beck, aes(x = log10(NO3), y = log10(resp_rate_d))) +
  geom_point(aes(fill = overkt_to_C(tempkt)),size = 3, alpha = 0.8, shape = 21) +
  geom_smooth(span = 0.7,se= FALSE) + 
  theme_mod() + 
  scale_fill_gradientn(colors = ocecolors[['temperature']]) +
  facet_wrap(~txt)

temp.lm = lm(log_resp~tempkt, data = response_beck)
confint(temp.lm)
temp_rate.lm = lm(log_resp_rate_d~tempkt, data = response_beck)
summary(temp_rate.lm)
confint(temp_rate.lm)

response_beck = broom::augment(temp.lm, response_beck) 

ggplot(response_beck, aes(x = Days, y = .resid)) + geom_point() +
  geom_smooth(span = 0.9, colour = 'black', se = TRUE)
