******************** STOICHFUN PACKAGE ********************************
                     
                     Version 09.03.2016

The STOICHFUN package accompanies:

Lewandowska AM et al. 2016 
The influence of balanced and imbalanced resource supply on biodiversity–
functioning relationship across ecosystems. Phil. Trans. R. Soc. B 20150283.
http://dx.doi.org/10.1098/rstb.2015.0283

This data base is a product of the STOICHFUN group funded by
the Synthesis Centre for Biodiversity Sciences (sDiv) of the German
Centre for Integrative Biodiversity Research (iDiv) Halle-Jena-Leipzig
(DFG FZT 118).

This data base contains results of structural equation model (SEM) for each 
single study included in the meta-analysis desribed in the accompaning article.
Please, contact me if you use these data or if you require additional information
on any single study. In some cases the original data used for SEM can only 
be obtained from data providers on request. 

******************** Contents *******************************************

1. StoichFun_SEM_Richness.csv

This file contains results of the structural equation model with richness.
See the accompaining article for details.

Variable names:

Study ID         study ID as in the accompaining article (Supplementary Material)	
Study type       study type, field observational (field) or laboratory experimental (exp)	
Ecosystem type   freshwater, marine or terrestrial
Habitat          habitat type
Sampling size    number of data points	
Chi2             model goodness of fit, Chi-squared test	
p (Chi2)         model goodness of fit, p-value
a->S             standardized path coefficient, path: resource availability -> richness	
p (a->S)         p-value, path: resource availability -> richness
a->B             standardized path coefficients, path: resource availability -> realized productivity	
p (a->B)         p-value, path: resource availability -> realized productivity 
b->S             standardized path coefficient, path: resource imbalance -> richness	
p (b->S)         p-value, path: resource imbalance -> richness	
b->B             standardized path coefficient, path: resource imbalance -> realized productivity	
p (b->B)         p-value, path: resource imbalance -> realized productivity
S->B             standardized path coefficient, path: richness -> realized productivity	
p (S->B)         p-value, path: richness -> realized productivity


2. StoichFun_SEM_Evenness.csv

This file contains results of the structural equation model with evenness.
See the accompaining article for details.

Variable names:

Study ID         study ID as in the accompaining article (Supplementary Material)	
Study type       study type, field observational (field) or laboratory experimental (exp)	
Ecosystem type   freshwater, marine or terrestrial
Habitat          habitat type
Sampling size    number of data points	
Chi2             model goodness of fit, Chi-squared test	
p (Chi2)         model goodness of fit, p-value
a->J             standardized path coefficient, path: resource availability -> Pielou's evenness	
p (a->J)         p-value, path: resource availability -> Pielou's evenness
a->B             standardized path coefficients, path: resource availability -> realized productivity	
p (a->B)         p-value, path: resource availability -> realized productivity 
b->J             standardized path coefficient, path: resource imbalance -> Pielou's evenness	
p (b->J)         p-value, path: resource imbalance -> Pielou's evenness	
b->B             standardized path coefficient, path: resource imbalance -> realized productivity	
p (b->B)         p-value, path: resource imbalance -> realized productivity
J->B             standardized path coefficient, path: Pielou's evenness -> realized productivity	
p (J->B)         p-value, path: Pielou's evenness -> realized productivity


******************** References *****************************************************


- Nutrient Network (http://www.nutnet.umn.edu/)
  AMCAMP, AZI, BARTA, BLDR, BNCH, BURRAWAN, CDPT, CDCR, COWI, FNLY, FRUE, GILB, CBGB,
  GLAC, HALL, HART, HNVR, KINY, LANCASTER, LEAD, LOOK, MTCA, PAPE, SAGE, SAVA, SEDG, SERENG,
  SEVI, SHPS, SIER, SMITH, SPIN, SUMM, TEMPLE, TYSO, UKUL, UNC, VALM

- Pondscape (http://www.pondscape.be/index.html)
  PONDSCAPE

- Western Channel Observatory (http://www.westernchannelobservatory.org.uk/)
  L4

- Dutch General Directorate for Public Works and Water Management 
  (https://www.rijkswaterstaat.nl/index.aspx)
  HANS, NOORD, ROTT, TER, VLISS, WAL01, WAL02, LOD

- Soininen J., Korhonen J., Luoto M. (2013). Stochastic species distributions are driven
  by organism size. Ecology 94: 660-670
  HILL01 

- Dodson S.I., Arnott S.E., Cottingham K.L. (2000). The relationship in lake communities 
  between primary productivity and species richness. Ecology 81: 2662-2679
  HILL02

- Declerck S., Vanderstukken M., Pals A., Muylaert K., De Meester L. (2007). Plankton
  biodiversity along a gradient of productivity and its mediation by macrophytes.
  Ecology 88: 2199-2210
  DECL01

- Striebel M., Behl S., Stibor H. (2009). The coupling of biodiversity and productivity in
  phytoplankton communities: consequences for biomass stoichimetry. Ecology 90: 2025-2031
  STRIE01, STRIE02

- Stomp M., Huisman J., Mittelbach G.G., Litchman E., Klausmeier C.A. (2011). Large-scale
  biodiversity patterns in freshwater phytoplankton. Ecology 92: 2096-2107
  EPA01

- Lewandowska A.M., Boyce D.G., Hofmann M., Matthiessen B., Sommer U., Worm B. (2014).
  Effects of sea surface warming on marine plankton. Ecology letters 17: 614-623
  LEWA01

- Olde Venterink H., Pieterse N.M., Belgers J.D.M., Wassen M.J., Ruiter P.C. (2002). N, P, and K
  budgets along nutrient availability and productivity gradients in wetlands. Ecological
  Applications 12: 1010-1026
  VENTE01

- Olde Venterink H., Wassen M.J., Belgers J.D.M., Verhoeven J.T.A. (2001). Control of environmental
  variables on species density in fens and meadows: importance of direct effects and effects through 
  community biomass. Journal of Ecology 89: 1033-1040
  VENTE01

- Hillebrand H., Lehmpfuhl V. (2011). Resource stoichiometry and consumers control the 
  biodiversity-productivity relationship in pelagic metacommunities. The American Naturalist 178:171-181
  HILL03

- Eggers S.L., Lewandowska A.M., Barcelos e Ramos J., Blanco-Ameijeiras S., Gallo F., Matthiessen B.
  (2014). Community composition has greater impact on the functioning of marine phytoplankton communities 
  than ocean acidification. Global change biology 20: 713-723
  LEWA02

- Lewandowska A.M., Sommer U. (2010). Climate change and the spring bloom: a mesocosm study on the
  influence of light and temperature on phytoplankton and mesozooplankton. Marine Ecology Progress
  Series 405: 101-111
  LEWA03

- Sommer U., Lewandowka A. (2011). Climate change and the spring bloom: warming and overwintering 
  zooplankton have similar effects on phytoplankton. Global change biology 17: 154-162
  LEWA04 

- Lemmens P., Mergeay J., De Bie T., Van Wichelen J., De Meester L., Declerck S.A.J. (2013)
  How to maximally support local and regional biodiversity in applied conservation? Insights from
  pond management. Plos ONE 8: e72538
  LEMMENS

- Filstrup C.T., Hillebrand H., Heathcote A.J., Harpole W.S., Downing J.A. (2014) Cyanobacteria
  dominance influences resource use efficientcy and community turnover in phytoplankton
  and zooplankton communities. Ecology Letters 17: 464-474
  HILL06

- Interlandi S.J., Kilham S.S. (2001) Limiting resources and the regulation of diversity in 
  phytoplankton communities. Ecology 82: 1270-1282
  HILL07

- Minden V., Kleyer M. (2014) Internal and external regulation of plant organ stoichiometry.
  Plant Biology 16: 897-907
  TREIBSEL

- Hodapp D., Meier S., Muijsers F., Badewien T.H., Hillebrand H. (2015). Structural equation
  modeling approach to the diversity-productivity relationship of Wadden Sea phytoplankton.
  Marine Ecology Progress Series 523: 31-40
  HOD01, HOD02, HOD03

- Gamfeldt L., Snall T., Bagchi R., Jonsson M., Gustafsson L., Kjellander P., Ruiz-Jean M.C.,
  Froberg M., Stendahl J., Philipson C.D., Mikusinski G., Andersson E., Westerlund B., 
  Andren H., Moberg F., Moen J., Bengtsson J. (2013). Higher levels of multiple ecosystem services
  are found in forests with more tree species. Nature Communications 4: 1340
  GAM01

- Soininen J., Meier S. (2015). Phytoplankton richness is related to nutrient availability,
  not to pool size, in a subarctic rock pool system. Hydrobiologia 743: 175-188
  MEIER00





