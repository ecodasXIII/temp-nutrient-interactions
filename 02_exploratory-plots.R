## 2) preliminary figures for exploration of data

##Elser Plots
#Temperature Range

ggplot(TempData_Elser, aes(x = temp)) + geom_histogram(colour = 'black', fill = 'white')+
    annotate('text', x = 1, y = 30,label = paste("n = ", nrow(subset(Tempdata_Elser, temp!="NA"))))+
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

#Total N Range

Elser_log_n_total = ggplotGrob(ggplot(TempData_Elser, aes(x = log10(n_total))) + geom_histogram(colour = 'black', fill = 'white'))
ggplot(TempData_Elser, aes(x = n_total)) + geom_histogram(colour = 'black', fill = 'white') +
  annotate('text', x = 1, y = 20, label = paste("n =", nrow(subset(TempData_Elser, n_total!="NA")))) +
  annotation_custom(grob = Elser_log_n_total, xmin = 250, xmax = 400, ymin = 10, ymax = 20)+
  ggtitle("Elser Total N")

#Avail P Range

Elser_log_p_avail = ggplotGrob(ggplot(TempData_Elser, aes(x = log10(p_avail))) + geom_histogram(colour = 'black', fill = 'white'))
ggplot(TempData_Elser, aes(x = p_avail)) + geom_histogram(colour = 'black', fill = 'white') +
  annotate('text', x = .1, y = 135, label = paste("n =",nrow(subset(TempData_Elser, p_avail!="NA")))) +
  annotation_custom(grob = Elser_log_p_avail, xmin = 5, xmax = 9, ymin = 50, ymax = 135)+
  ggtitle("Elser Available P")

#Total P Range

Elser_log_p_total = ggplotGrob(ggplot(TempData_Elser, aes(x = log10(p_total))) + geom_histogram(colour = 'black', fill = 'white'))
ggplot(TempData_Elser, aes(x = p_total)) + geom_histogram(colour = 'black', fill = 'white') +
  annotate('text', x = .1, y = 135, label = paste("n =",nrow(subset(TempData_Elser, p_total!="NA")))) +
  annotation_custom(grob = Elser_log_p_total, xmin = 10, xmax = 20, ymin = 50, ymax = 135)+
  ggtitle("Elser Total P")

##Beck Plots

#Temp Range

ggplot(TempData_Beck, aes(x = Temp_C)) + geom_histogram(colour = 'black', fill = 'white')+
  annotate('text', x = 1, y = 40,label = paste("n = ", nrow(subset(TempData_Beck, Temp_C!="NA"))))+
  ggtitle("Beck Temp")

#Canopy % Range

ggplot(TempData_Beck, aes(x = Canopy_Percent)) + geom_histogram(colour = 'black', fill = 'white')+
  annotate('text', x = 1, y = 40,label = paste("n = ", nrow(subset(TempData_Beck, Canopy_Percent!="NA"))))+
  ggtitle("Beck Canopy Percent")

#DIN Range

Beck_log_DIN = ggplotGrob(ggplot(TempData_Beck, aes(x = log10(DIN_ug_L))) + geom_histogram(colour = 'black', fill = 'white'))
ggplot(TempData_Beck, aes(x = DIN_ug_L)) + geom_histogram(colour = 'black', fill = 'white') +
  annotate('text', x = 1, y = 20, label = paste("n =", nrow(subset(TempData_Beck, DIN_ug_L!="NA")))) +
  annotation_custom(grob = Beck_log_DIN, xmin = 600, xmax = 800, ymin = 10, ymax = 20)+
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

#Excretion N:P

ggplot(TempData_Vanni, aes(x = Excreted.N.P..molar.)) + geom_histogram(colour = 'black', fill = 'white', bins=50)+
  annotate('text', x = 1000, y = 3000,label = paste("n = ", nrow(subset(TempData_Vanni, Excreted.N.P..molar.!="NA"))))+
  ggtitle("Vanni Excretion N:P Molar")


