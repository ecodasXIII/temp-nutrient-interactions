#install and load required packages
load_packages = function(){
if(!require('pacman')) install.packages('pacman')
library(pacman)
package.list = c("plyr", "tidyverse", "ggplot2", "digitize")
p_load(char = package.list, install = TRUE)
p_load_gh("jimjunker1/junkR", install = TRUE)
rm(package.list)
theme_mod <<- function(){theme_bw() %+replace% theme(panel.grid = element_blank())}
theme_set(theme_mod())

# breaks_in_C <<- scales::extended_breaks()(overkt_to_C(c(42,41,40,39,38)))#> [1]  0 10 20 30 
# breaks_in_C_plus <<- c(0,5,10,15,20,25,30,35, 40)
# 
# breaks_in_kt <<- round(C_to_overkt(breaks_in_C_plus),1)
# # breaks_in_kt
# # [1] 42.5 41.7 41.0 40.3 39.6 38.9 38.3 37.7
# breaks_in_kt_stand <<- round(C_to_overkt_stand15(breaks_in_C_plus),1)
# 
# C_to_overkt <<- function(a){1/(8.61733*10^-5*(a+273.15))}#overkt function
# overkt_to_C <<- function(a){1/(a*(8.61733*10^-5)) - 273.15}
# C_to_overkt_stand15 <<- function(a){(1/(8.61733e-5*(15+273.15)) - (1/(8.61733e-5*(a+273.15))))}
# overkt_stand15_to_C <<- function(a){1/((C_to_overkt(15)-a)*(8.61733*10^-5)) - 273.15}

oce_temp_pos <<- c(256,212,168,124,80,1)#color positions in 'temperature' list of ocecolors

}
load_packages()