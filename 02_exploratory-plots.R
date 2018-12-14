# preliminary figures for exploration of data

#Plot 
#View temperature range

temp_plot = ggplot(aquatic_NP, aes(x = temp)) + geom_histogram(colour = 'black', fill = 'white')+
    annotate('text', x = 1, y = 30,label = paste("n = ",length(!is.na(aquatic_NP$temp))))

ggplot(aquatic_NP, aes(x = temp)) + geom_histogram(colour = 'black',fill = 'white') + facet_grid(cat ~ ., scales = 'free')
#View N range
log_N_plot = ggplotGrob(ggplot(aquatic_NP, aes(x = log10(n_avail))) + geom_histogram(colour = 'black', fill = 'white'))
N_plot = ggplot(aquatic_NP, aes(x = n_avail)) + geom_histogram(colour = 'black', fill = 'white') +
  annotate('text', x = 1, y = 220, label = paste("n =",length(!is.na(aquatic_NP$n_avail)))) +
  annotation_custom(grob = log_N_plot, xmin = 250, xmax = 550, ymin = 100, ymax = 220)

log_P_plot = ggplotGrob(ggplot(aquatic_NP, aes(x = log10(p_avail))) + geom_histogram(colour = 'black', fill = 'white'))
P_plot = ggplot(aquatic_NP, aes(x = p_avail)) + geom_histogram(colour = 'black', fill = 'white') +
  annotate('text', x = .1, y = 135, label = paste("n =",length(!is.na(aquatic_NP$p_avail)))) +
  annotation_custom(grob = log_P_plot, xmin = 5, xmax = 9, ymin = 50, ymax = 135)
