#install and load required packages
#load_packages = function(){
if(!require('pacman')) install.packages('pacman')
library(pacman)
package.list = c("plyr", "tidyverse", "ggplot2")
p_load(char = package.list, install = T)

theme_mod <- function(){theme_bw() %+replace% theme(panel.grid = element_blank())}
theme_set(theme_mod()) 
#}