#install and load required packages
#load_packages = function(){
if(!require('pacman')) install.packages('pacman')
library(pacman)
package.list = c("plyr", "tidyverse", "ggplot2", "digitize")
p_load(char = package.list, install = T)

overKT = function(a){1/(8.61733*10^-5*a)}

theme_mod <- function(){theme_bw() %+replace% theme(panel.grid = element_blank())}
theme_set(theme_mod()) 
#}