## 2) preliminary figures for exploration of data

##Run script 1) clean_data before running this script

##Elser Plots
#Temperature Range

ggplot(TempData_Elser, aes(x = temp)) + geom_histogram(colour = 'black', fill = 'white')+
    annotate('text', x = 1, y = 30,label = paste("n = ", nrow(subset(TempData_Elser, temp!="NA"))))+
    ggtitle("Elser Temp")
ggplot(TempData_Elser, aes(x = temp)) + geom_histogram(colour = 'black',fill = 'white') + facet_grid(cat ~ ., scales = 'free')+
    ggtitle("Elser Temp by Ecosystem")

#Light Range

ggplot(TempData_Elser, aes(x = light)) + geom_histogram(colour = 'black', fill = 'white')+
  annotate('text', x = 1, y = 50,label = paste("n = ",nrow(subset(TempData_Elser, light!="NA"))))+
  ggtitle("Elser Light")
ggplot(TempData_Elser, aes(x = light)) + geom_histogram(colour = 'black',fill = 'white') + facet_grid(cat ~ ., scales = 'free')+
  ggtitle("Elser Light by Ecosystem")

#Avail N Range

Elser_log_n_avail = ggplotGrob(ggplot(TempData_Elser, aes(x = log10(n_avail))) + geom_histogram(colour = 'black', fill = 'white'))
ggplot(TempData_Elser, aes(x = n_avail)) + geom_histogram(colour = 'black', fill = 'white') +
  annotate('text', x = 1, y = 220, label = paste("n =",nrow(subset(TempData_Elser, n_avail!="NA")))) +
  annotation_custom(grob = Elser_log_n_avail, xmin = 250, xmax = 550, ymin = 100, ymax = 220)+
  ggtitle("Elser Available N")
ggplot(TempData_Elser, aes(x = n_avail)) + geom_histogram(colour = 'black',fill = 'white') + facet_grid(cat ~ ., scales = 'free')+
  ggtitle("Elser Available N by Ecosystem")

#Total N Range

Elser_log_n_total = ggplotGrob(ggplot(TempData_Elser, aes(x = log10(n_total))) + geom_histogram(colour = 'black', fill = 'white'))
ggplot(TempData_Elser, aes(x = n_total)) + geom_histogram(colour = 'black', fill = 'white') +
  annotate('text', x = 1, y = 20, label = paste("n =", nrow(subset(TempData_Elser, n_total!="NA")))) +
  annotation_custom(grob = Elser_log_n_total, xmin = 250, xmax = 400, ymin = 10, ymax = 20)+
  ggtitle("Elser Total N")
ggplot(TempData_Elser, aes(x = n_total)) + geom_histogram(colour = 'black',fill = 'white') + facet_grid(cat ~ ., scales = 'free')+
  ggtitle("Elser Total N by Ecosystem")

#Avail P Range

Elser_log_p_avail = ggplotGrob(ggplot(TempData_Elser, aes(x = log10(p_avail))) + geom_histogram(colour = 'black', fill = 'white'))
ggplot(TempData_Elser, aes(x = p_avail)) + geom_histogram(colour = 'black', fill = 'white') +
  annotate('text', x = .1, y = 135, label = paste("n =",nrow(subset(TempData_Elser, p_avail!="NA")))) +
  annotation_custom(grob = Elser_log_p_avail, xmin = 5, xmax = 9, ymin = 50, ymax = 135)+
  ggtitle("Elser Available P")
ggplot(TempData_Elser, aes(x = p_avail)) + geom_histogram(colour = 'black',fill = 'white') + facet_grid(cat ~ ., scales = 'free')+
  ggtitle("Elser Available P by Ecosystem")

#Total P Range

Elser_log_p_total = ggplotGrob(ggplot(TempData_Elser, aes(x = log10(p_total))) + geom_histogram(colour = 'black', fill = 'white'))
ggplot(TempData_Elser, aes(x = p_total)) + geom_histogram(colour = 'black', fill = 'white') +
  annotate('text', x = .1, y = 45, label = paste("n =",nrow(subset(TempData_Elser, p_total!="NA")))) +
  annotation_custom(grob = Elser_log_p_total, xmin = 10, xmax = 20, ymin = 20, ymax = 45)+
  ggtitle("Elser Total P")
ggplot(TempData_Elser, aes(x = p_total)) + geom_histogram(colour = 'black',fill = 'white') + facet_grid(cat ~ ., scales = 'free')+
  ggtitle("Elser Total P by Ecosystem")



##Beck Plots

#Temp Range

ggplot(TempData_Beck, aes(x = Temp_C)) + geom_histogram(colour = 'black', fill = 'white')+
  annotate('text', x = 1, y = 40,label = paste("n = ", nrow(subset(TempData_Beck, Temp_C!="NA"))))+
  ggtitle("Beck Temp")

#Canopy % Range

ggplot(TempData_Beck, aes(x = Canopy_Percent)) + geom_histogram(colour = 'black', fill = 'white')+
  annotate('text', x = 1, y = 15,label = paste("n = ", nrow(subset(TempData_Beck, Canopy_Percent!="NA"))))+
  ggtitle("Beck Canopy Percent")

#DIN Range

Beck_log_DIN = ggplotGrob(ggplot(TempData_Beck, aes(x = log10(DIN_ug_L))) + geom_histogram(colour = 'black', fill = 'white'))
ggplot(TempData_Beck, aes(x = DIN_ug_L)) + geom_histogram(colour = 'black', fill = 'white') +
  annotate('text', x = 1, y = 10, label = paste("n =", nrow(subset(TempData_Beck, DIN_ug_L!="NA")))) +
  annotation_custom(grob = Beck_log_DIN, xmin = 500, xmax = 800, ymin = 5, ymax = 10)+
  ggtitle("Beck DIN")

#TN Range

Beck_log_TN = ggplotGrob(ggplot(TempData_Beck, aes(x = log10(TN_mg_L))) + geom_histogram(colour = 'black', fill = 'white'))
ggplot(TempData_Beck, aes(x = TN_mg_L)) + geom_histogram(colour = 'black', fill = 'white') +
  annotate('text', x = 25, y = 40, label = paste("n =", nrow(subset(TempData_Beck, TN_mg_L!="NA")))) +
  annotation_custom(grob = Beck_log_TN, xmin = 125, xmax = 225, ymin = 20, ymax = 40)+
  ggtitle("Beck TN")

#SRP Range

Beck_log_SRP = ggplotGrob(ggplot(TempData_Beck, aes(x = log10(SRP_ug_L))) + geom_histogram(colour = 'black', fill = 'white'))
ggplot(TempData_Beck, aes(x = SRP_ug_L)) + geom_histogram(colour = 'black', fill = 'white') +
  annotate('text', x = 250, y = 250, label = paste("n =", nrow(subset(TempData_Beck, SRP_ug_L!="NA")))) +
  annotation_custom(grob = Beck_log_SRP, xmin = 1000, xmax = 1750, ymin = 125, ymax = 250)+
  ggtitle("Beck SRP")

#TP Range

Beck_log_TP = ggplotGrob(ggplot(TempData_Beck, aes(x = log10(TP_ug_L))) + geom_histogram(colour = 'black', fill = 'white'))
ggplot(TempData_Beck, aes(x = TP_ug_L)) + geom_histogram(colour = 'black', fill = 'white') +
  annotate('text', x = 200, y = 50, label = paste("n =", nrow(subset(TempData_Beck, TP_ug_L!="NA")))) +
  annotation_custom(grob = Beck_log_TP, xmin = 1500, xmax = 2500, ymin = 30, ymax = 50)+
  ggtitle("Beck TP")

#Control mean Range

Beck_Control_Mean = ggplotGrob(ggplot(TempData_Beck, aes(x = log10(Control_mean_mg_m2))) + geom_histogram(colour = 'black', fill = 'white'))
ggplot(TempData_Beck, aes(x = Control_mean_mg_m2)) + geom_histogram(colour = 'black', fill = 'white') +
  annotate('text', x = 50, y = 130, label = paste("n =", nrow(subset(TempData_Beck, Control_mean_mg_m2!="NA")))) +
  annotation_custom(grob = Beck_Control_Mean, xmin = 225, xmax = 400, ymin = 100, ymax = 150)+
  ggtitle("Beck Control Mean")

#N_LRR Effect Size

Beck_N_LRR_Effect_Size = ggplotGrob(ggplot(TempData_Beck, aes(x = log10(N.LRR.Effect))) + geom_histogram(colour = 'black', fill = 'white'))
ggplot(TempData_Beck, aes(x = N.LRR.Effect)) + geom_histogram(binwidth=0.2, colour = 'black', fill = 'white') +
  annotate('text', x = -5, y = 90, label = paste("n =", nrow(subset(TempData_Beck, N.LRR.Effect!="NA")))) +
  annotation_custom(grob = Beck_N_LRR_Effect_Size, xmin = -6, xmax = -2, ymin = 50, ymax = 80)+
  ggtitle("N LRR Effect Size")


#P_LRR Effect Size

Beck_P_LRR_Effect_Size = ggplotGrob(ggplot(TempData_Beck, aes(x = log10(P.LRR.Effect))) + geom_histogram(colour = 'black', fill = 'white'))
ggplot(TempData_Beck, aes(x = P.LRR.Effect)) + geom_histogram(binwidth=0.2, colour = 'black', fill = 'white') +
  annotate('text', x = -2, y = 90, label = paste("n =", nrow(subset(TempData_Beck, P.LRR.Effect!="NA")))) +
  annotation_custom(grob = Beck_P_LRR_Effect_Size, xmin = -3, xmax = -0.5, ymin = 50, ymax = 80)+
  ggtitle("P LRR Effect Size")

#P_LRR Effect Size

Beck_NP_LRR_Effect_Size = ggplotGrob(ggplot(TempData_Beck, aes(x = log10(NP.LRR))) + geom_histogram(colour = 'black', fill = 'white'))
ggplot(TempData_Beck, aes(x = NP.LRR)) + geom_histogram(binwidth=0.2, colour = 'black', fill = 'white') +
  annotate('text', x = -2, y = 90, label = paste("n =", nrow(subset(TempData_Beck, NP.LRR!="NA")))) +
  annotation_custom(grob = Beck_NP_LRR_Effect_Size, xmin = 0.5, xmax = 4, ymin = 50, ymax = 80)+
  ggtitle("NP LRR Effect Size")

##Vanni Plots

#Temp Range

ggplot(TempData_Vanni, aes(x = Temperature..C.)) + geom_histogram(colour = 'black', fill = 'white')+
  annotate('text', x = 10, y = 1100,label = paste("n = ", nrow(subset(TempData_Vanni, Temperature..C.!="NA"))))+
  ggtitle("Vanni Temp")

#Excretion SRP

ggplot(subset(TempData_Vanni, P.form=="SRP"), aes(x = P.excretion.rate..ug.P.ind.h.)) + geom_histogram(colour = 'black', fill = 'white')+
  annotate('text', x = 1000, y = 1200,label = paste("n = ", nrow(subset(TempData_Vanni, P.form=="SRP"& P.excretion.rate..ug.P.ind.h.!="NA"))))+
  ggtitle("Vanni SRP Excretion Rate")

#Excretion TP

ggplot(subset(TempData_Vanni, P.form=="TP"), aes(x = P.excretion.rate..ug.P.ind.h.)) + geom_histogram(colour = 'black', fill = 'white')+
  annotate('text', x = 0, y = 100,label = paste("n = ", nrow(subset(TempData_Vanni, P.form=="TP"& P.excretion.rate..ug.P.ind.h.!="NA"))))+
  ggtitle("Vanni TP Excretion Rate")

#Excretion Ammonium

ggplot(subset(TempData_Vanni, N.form=="NH4"), aes(x = N.excretion.rate..ug.N.ind.h.)) + geom_histogram(colour = 'black', fill = 'white')+
  annotate('text', x = 1000, y = 900,label = paste("n = ", nrow(subset(TempData_Vanni, N.form=="NH4" &N.excretion.rate..ug.N.ind.h.!="NA"))))+
  ggtitle("Vanni NH4 Excretion Rate")

#Excretion TN

ggplot(subset(TempData_Vanni, N.form=="TN"), aes(x = N.excretion.rate..ug.N.ind.h.)) + geom_histogram(colour = 'black', fill = 'white')+
  annotate('text', x = 0, y = 20,label = paste("n = ", nrow(subset(TempData_Vanni, N.form=="TN" &N.excretion.rate..ug.N.ind.h.!="NA"))))+
  ggtitle("Vanni TN Excretion Rate")

#Excretion N:P (If N excretion or P excretion was NA, value was calculated as "1", 
#so only included values >1)

ggplot(subset(TempData_Vanni, Excreted.N.P..molar.>1), aes(x = Excreted.N.P..molar.)) + geom_histogram(colour = 'black', fill = 'white', bins=50)+
  annotate('text', x = 500, y = 300,label = paste("n = ", nrow(subset(TempData_Vanni, Excreted.N.P..molar.!="NA" & Excreted.N.P..molar.>1))))+
    ggtitle("Vanni Excretion N:P Molar")



