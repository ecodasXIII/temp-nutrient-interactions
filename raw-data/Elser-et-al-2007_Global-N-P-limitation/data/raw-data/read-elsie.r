
### This program reads in the experimental data for the trophic comparisons 
### working group and merges the data tables together into a single table. 
### DSG Jan-Feb 2012 revised read-meta-12.r devel. by EWS and DSG 2005-2010.
### This uses more restricted list of studies by eliminating
### "meta-meta" extractions that may not meet ELSIE criteria and
### which are also grazing only studies (Coupe & Cahill 2003, Bigger &
### Marvier 1998, Milchunas & Laurenroth 1993) and all studies entered from
### the trophic cascades database (ETB and EWS) because data incomplete, 
### also with different criteria than ELSIE


### Clear all existing data 
rm(list=ls())

### Close graphics devices 
graphics.off()

### set working directory 
setwd("C:/Gruner/NCEAS/data")
getwd() 

### Read in data tables 
### set as.is=T to keep text strings at characters 
study<-read.csv("study.csv",strip.white=T,na.strings=".") 
taxa<-read.csv("taxa.csv",strip.white=T,na.strings=".") 
biota<-read.csv("biota.csv",strip.white=T,na.strings=".") 
resp<-read.csv("response.csv",strip.white=T,na.strings=".") 

### First remove studies and sets of studies that do not meet ELSIE criteria
study$ID_study<-toupper(as.character(study$ID_study))
study$meta_source<-toupper(as.character(study$meta_source))
study$ID_study[substr(as.character(study$ID_study),1,3)=="EWS"]<-"DEL"
study$ID_study[substr(as.character(study$ID_study),1,3)=="ETB"]<-"DEL"
study$ID_study[study$meta_source=="MILCHUNAS&LAURENROTH1993"]<-"DEL"
study<-subset(study, study$ID_study != "DEL") 
       #remove Coupe & Cahill and Bigger & Marvier (EWS)
       #remove TC ETB studies (ETB)
       #remove Milchunas&Laurenroth grazing studies (DSG)

### cleanse several inappropriate studies
study<-subset(study, study$ID_study != "WSH001")  #remove mycorrhiae studies
study<-subset(study, study$ID_study != "WSH019")  #remove mycorrhiae studies
study<-subset(study, study$ID_study != "EEC086")  #remove bird poop/mangrove
study<-subset(study, study$ID_study != "JES072")  #remove unquantif. gradient
study<-subset(study, study$ID_study != "JES021")  #remove unquantif. gradient
study<-subset(study, study$ID_study != "JES035")  #remove unquantif. gradient
study<-subset(study, study$ID_study != "BBH163")  #no response data
study<-subset(study, study$ID_study != "BBH164")  #no response data
study<-subset(study, study$ID_study != "BBH165")  #no response data
study<-subset(study, study$ID_study != "BBH166")  #no response data
study<-subset(study, study$ID_study != "WSH033")  #only animal yield data
study<-subset(study, study$ID_study != "WSH034")  #only animal yield data
study<-subset(study, study$ID_study != "WSH035")  #only animal yield data


### eliminate identical redundant rows in biota table (same everything)
biota$ID_biota <- NULL
biota <- unique(biota)

### Read in data that only have ratios (data extracted from studies without
### experimental means)
ratio<-read.csv("ratios.csv",strip.white=T,na.strings=".")
 
### Change some names in the ratio table to match those in the response table 
names(ratio)[names(ratio) == "ID_ratioresp"] <- "ID_response" 
### caution: some ratio$tax_resp_typ == "JIM WILL FIX" indicating that this
### information still needs to be extracted from the original papers that
### went into Jim's 1990 meta-analysis, the source of the ratios.

### Convert percent response (100*treat/control) to 
### true ratios (treat/control) 
sel<-ratio$tax_resp_unit == "% relative to control" 
ratio$tax_resp_mn[sel]<-ratio$tax_resp_mn[sel]/100
tmp<-rbind(ratio,resp) #Bind the response and ratio data sets together 
resp<-tmp #Overwrite the concatenated data sets onto the response data

### Capitalize key character variables for consistency across tables
taxa$ID_study<-as.factor(toupper(as.character(taxa$ID_study))) 
taxa$resp_man<-as.factor(toupper(as.character(taxa$resp_man))) 
taxa$taxa<-as.factor(toupper(as.character(taxa$taxa))) 
taxa$taxa_bin<-as.factor(toupper(as.character(taxa$taxa_bin)))

biota$taxa<-as.factor(toupper(as.character(biota$taxa))) 
biota$kingdom<-as.factor(toupper(as.character(biota$kingdom))) 
biota$thermo<-as.factor(toupper(as.character(biota$thermo))) 
biota$biotic_type<-as.factor(toupper(as.character(biota$biotic_type))) 
biota$trophic_status<-as.factor(toupper(as.character(biota$trophic_status))) 
biota$mobility<-as.factor(toupper(as.character(biota$mobility)))

study$ID_study<-toupper(as.character(study$ID_study)) 
study$study_typ<-as.factor(toupper(as.character(study$study_typ))) 
study$cons_man<-as.factor(toupper(as.character(study$cons_man))) 
study$system<-as.factor(toupper(as.character(study$system))) 
study$strata<-as.factor(toupper(as.character(study$strata))) 
study$habitat<-as.factor(toupper(as.character(study$habitat)))

resp$ID_study<-toupper(as.character(resp$ID_study)) 
resp$tax_resp_typ<-toupper(as.character(resp$tax_resp_typ)) 
resp$tax_man<-toupper(as.character(resp$tax_man)) 
resp$tax_resp<-toupper(as.character(resp$tax_resp)) 
resp$tax_resp_cat<-toupper(as.character(resp$tax_resp_cat)) 
resp$tax_resp_unit<-toupper(as.character(resp$tax_resp_unit))

### recategorize the myriad BIOMASS response types to three types 
### for tax_resp_cat = BIOMASS -> RATE, PRODUCTION, BIOMASS
### but create new variable for class of responses so that can
### look broadly and narrowly in analysis
resp$tax_resp_class<-0  
resp$tax_resp_class[resp$tax_resp_cat=="DIVERSITY"]<-"DIVERSITY"
resp$tax_resp_class[resp$tax_resp_cat=="COUNTS"]<-"COUNTS"
resp$tax_resp_class[substr(as.character(resp$tax_resp_cat),1,8)=="NUTRIENT"]<-"NUTRIENT STATUS"
resp$tax_resp_class[resp$tax_resp_cat=="BIOMASS" 
	& substr(as.character(resp$tax_resp_typ),1,8)=="RELATIVE"]<-"BIORATE"
resp$tax_resp_class[resp$tax_resp_cat=="BIOMASS" 
	& substr(as.character(resp$tax_resp_typ),1,8)=="SPECIFIC"]<-"BIORATE"
resp$tax_resp_class[resp$tax_resp_cat=="BIOMASS" 
	& substr(as.character(resp$tax_resp_typ),1,6)=="GROWTH"]<-"BIORATE"
resp$tax_resp_class[resp$tax_resp_cat=="BIOMASS" 
	& substr(as.character(resp$tax_resp_typ),1,8)=="DIAMETER"]<-"BIORATE"
resp$tax_resp_class[resp$tax_resp_cat=="BIOMASS" 
	& substr(as.character(resp$tax_resp_typ),1,6)=="RADIAL"]<-"BIORATE"
resp$tax_resp_class[resp$tax_resp_cat=="BIOMASS" 
	& substr(as.character(resp$tax_resp_typ),1,9)=="ROOT INGR"]<-"BIORATE"
resp$tax_resp_class[resp$tax_resp_cat=="BIOMASS" 
	& substr(as.character(resp$tax_resp_typ),1,9)=="ROOT ELON"]<-"BIORATE"
resp$tax_resp_class[resp$tax_resp_cat=="BIOMASS" 
	& substr(as.character(resp$tax_resp_typ),1,10)=="SHOOT ELON"]<-"BIORATE"
resp$tax_resp_class[resp$tax_resp_cat=="BIOMASS" 
	& resp$tax_resp_typ=="BIOMASS CHANGE"]<-"BIORATE"
resp$tax_resp_class[resp$tax_resp_cat=="BIOMASS" 
	& resp$tax_resp_typ=="HEIGHT CHANGE"]<-"BIORATE"
resp$tax_resp_class[resp$tax_resp_cat=="BIOMASS" 
	& resp$tax_resp_typ=="NET HEIGHT CHANGE"]<-"BIORATE"
resp$tax_resp_class[resp$tax_resp_cat=="BIOMASS" 
	& substr(as.character(resp$tax_resp_typ),1,9)=="ROOT GROW"]<-"BIORATE"
resp$tax_resp_class[resp$tax_resp_cat=="BIOMASS" 
	& resp$tax_resp_typ=="WEIGHT GAIN"]<-"BIORATE"

resp$tax_resp_class[resp$tax_resp_cat=="BIOMASS" 
	& resp$tax_resp_typ=="NPP"]<-"BIOPROD"
resp$tax_resp_class[resp$tax_resp_cat=="BIOMASS" 
	& resp$tax_resp_typ=="LITTERFALL"]<-"BIOPROD"
resp$tax_resp_class[resp$tax_resp_cat=="BIOMASS" 
	& resp$tax_resp_typ=="BNPP"]<-"BIOPROD"
resp$tax_resp_class[resp$tax_resp_cat=="BIOMASS" 
	& resp$tax_resp_typ=="ANPP"]<-"BIOPROD"
resp$tax_resp_class[resp$tax_resp_cat=="BIOMASS" 
	& substr(as.character(resp$tax_resp_typ),1,7)=="PRODUCT"]<-"BIOPROD"
resp$tax_resp_class[resp$tax_resp_cat=="BIOMASS" 
	& substr(as.character(resp$tax_resp_typ),1,3)=="14C"]<-"BIOPROD"
resp$tax_resp_class[resp$tax_resp_cat=="BIOMASS" 
	& substr(as.character(resp$tax_resp_typ),1,5)=="FRUIT"]<-"BIOPROD"

resp$tax_resp_class[resp$tax_resp_cat=="BIOMASS" 
	& substr(as.character(resp$tax_resp_typ),1,7)=="CHLOROP"]<-"BIOMASS"
resp$tax_resp_class[resp$tax_resp_cat=="BIOMASS" 
	& resp$tax_resp_typ =="COVER"]<-"BIOMASS"
resp$tax_resp_class[resp$tax_resp_cat=="BIOMASS" 
	& resp$tax_resp_typ =="BIOMASS"]<-"BIOMASS"
resp$tax_resp_class[resp$tax_resp_cat=="BIOMASS" 
	& resp$tax_resp_typ=="AFDM"]<-"BIOMASS"
resp$tax_resp_class[resp$tax_resp_cat=="BIOMASS" 
	& resp$tax_resp_typ=="BIOVOLUME"]<-"BIOMASS"
resp$tax_resp_class[resp$tax_resp_cat=="BIOMASS" 
	& resp$tax_resp_typ=="WOOD BIOMASS"]<-"BIOMASS"
resp$tax_resp_class[resp$tax_resp_cat=="BIOMASS" 
	& resp$tax_resp_typ=="CARBON"]<-"BIOMASS"
resp$tax_resp_class[resp$tax_resp_cat=="BIOMASS" 
	& resp$tax_resp_typ=="ABOVEGROUND BIOMASS"]<-"BIOMASS"
resp$tax_resp_class[resp$tax_resp_cat=="BIOMASS" 
	& resp$tax_resp_typ=="BELOWGROUND BIOMASS"]<-"BIOMASS"
resp$tax_resp_class[resp$tax_resp_cat=="BIOMASS" 
	& resp$tax_resp_typ=="WET BIOMASS"]<-"BIOMASS"
resp$tax_resp_class[resp$tax_resp_cat=="BIOMASS" 
	& resp$tax_resp_typ=="MICROBIAL C"]<-"BIOMASS"
resp$tax_resp_class[resp$tax_resp_cat=="BIOMASS" 
	& resp$tax_resp_typ=="TREE VOLUME"]<-"BIOMASS"
resp$tax_resp_class[resp$tax_resp_cat=="BIOMASS" 
	& resp$tax_resp_typ=="SHOOT LENGTH"]<-"BIOMASS"
resp$tax_resp_class[resp$tax_resp_cat=="BIOMASS" 
	& resp$tax_resp_typ=="LEAF BIOMASS"]<-"BIOMASS"
resp$tax_resp_class[resp$tax_resp_cat=="BIOMASS" 
	& resp$tax_resp_typ=="ROOT BIOMASS"]<-"BIOMASS"
resp$tax_resp_class[resp$tax_resp_cat=="BIOMASS" 
	& resp$tax_resp_typ=="BASAL AREA"]<-"BIOMASS"
resp$tax_resp_class[resp$tax_resp_cat=="BIOMASS" 
	& resp$tax_resp_typ=="JIM WILL FIX"]<-"BIOMASS"
resp$tax_resp_class[resp$tax_resp_cat=="BIOMASS" 
	& resp$tax_resp_typ=="ABSORBANCE"]<-"BIOMASS"
resp$tax_resp_class[resp$tax_resp_cat=="BIOMASS" 
	& resp$tax_resp_typ=="FLUORESCENCE"]<-"BIOMASS"
resp$tax_resp_class[resp$tax_resp_cat=="BIOMASS" 
	& resp$tax_resp_typ=="STEM WIDTH"]<-"BIOMASS"
resp$tax_resp_class[resp$tax_resp_cat=="BIOMASS" 
	& resp$tax_resp_typ=="HEIGHT"]<-"BIOMASS"
resp$tax_resp_class[resp$tax_resp_cat=="BIOMASS" 
	& resp$tax_resp_typ=="FUCOXANTHIN"]<-"BIOMASS"
resp$tax_resp_class[resp$tax_resp_cat=="BIOMASS" 
	& resp$tax_resp_typ=="ZEAXANTHIN"]<-"BIOMASS"

### Fix some system classifications 
study$system<-as.character(study$system) 
study$habitat<-as.character(study$habitat) 
study$strata<-as.character(study$strata) 
study$habitat[study$habitat=="forest"]<-"terr-woody" 
study$habitat[study$habitat=="shrubland"]<-"terr-woody"

### Merge study and response data 
comb.sr<-merge(study,resp, by="ID_study", all.x=T)

### Select out the columns from the taxa and biota data sets 
### that have data for most records 
taxa<-subset(taxa, select=c(ID_study,taxa_bin,taxa,resp_man)) 
biota<-subset(biota, select=c(taxa,kingdom,thermo,biotic_type,
					trophic_status,mobility))

### Get rid of data that are missing key data 
taxa<-taxa[is.na(taxa$resp_man) != TRUE,] 
taxa<-taxa[is.na(taxa$taxa) != TRUE,] 
biota<-biota[is.na(biota$taxa) != TRUE,]

### Make some binary variables that will be used in analyses 
biota$mobile[biota$mobility=="MOBILE"]<-1 
biota$mobile[biota$mobility=="SESSILE"]<-0 
biota$ecto[biota$therm=="ECTO"]<-1 
biota$ecto[biota$therm=="ENDO"]<-0 
biota$vert<-0 
biota$vert[biota$biotic_type=="VERTEBRATE"]<-1 
biota$invert<-0 
biota$invert[biota$biotic_type=="INVERTEBRATE"]<-1
biota$invert[biota$biotic_type=="ZOOPLANKTON"]<-1
biota$zooplankton<-0
biota$zooplankton[biota$biotic_type=="ZOOPLANKTON"]<-1  
biota$bacteria<-0
biota$bacteria[substr(as.character(biota$biotic_type),1,5)=="CYANO"]<-1
biota$bacteria[substr(as.character(biota$biotic_type),1,4)=="BACT"]<-1
biota$autotroph<-0 
biota$autotroph[substr(as.character(biota$trophic_status),1,4)=="AUTO"]<-1 
biota$woody<-0 
biota$woody[substr(as.character(biota$biotic_type),1,4)=="WOOD"]<-1 
biota$woody[biota$biotic_type=="SHRUB"]<-1 
biota$woody[biota$biotic_type=="TREE"]<-1 
biota$tree<-0 
biota$tree[biota$biotic_type=="TREE"]<-1 
biota$shrub<-0 
biota$shrub[biota$biotic_type=="SHRUB"]<-1 
biota$herb<-0
biota$herb[substr(as.character(biota$biotic_type),1,4)=="HERB"]<-1  
biota$herb[substr(as.character(biota$biotic_type),1,5)=="LOWER"]<-1 
biota$algae<-0 
biota$algae[substr(as.character(biota$biotic_type),1,5)=="MACRO"]<-1 
biota$algae[substr(as.character(biota$biotic_type),1,4)=="PERI"]<-1 
biota$algae[substr(as.character(biota$biotic_type),1,4)=="PHYT"]<-1
biota$algae[substr(as.character(biota$biotic_type),1,5)=="CYANO"]<-1
biota$periphyton<-0
biota$periphyton[substr(as.character(biota$biotic_type),1,4)=="PERI"]<-1 
biota$phytoplankton<-0
biota$phytoplankton[substr(as.character(biota$biotic_type),1,4)=="PHYT"]<-1
biota$phytoplankton[substr(as.character(biota$biotic_type),1,5)=="CYANO"]<-1
biota$macroalgae<-0
biota$macroalgae[substr(as.character(biota$biotic_type),1,5)=="MACRO"]<-1

### Put in data check using table() to make sure that all categories 
### have a place in the new binary variables and taxa can be scored.
### Take the mean value of each binary variable by taxa so there is 
### only one characteristic per taxa. These means are rounded to 
### make them 0 or 1 based on a vote count approach (did more 
### than half of the records give it a 1 or 0?) 
### taxa<-as.factor(unique(biota$taxa)) 
### replaced with ceiling function 17-mar-2008 so any nonzero value is = 1
auto<-(ceiling(tapply(biota$autotroph,biota$taxa,mean))) 
alg<-(ceiling(tapply(biota$algae,biota$taxa,mean))) 
periph<-(ceiling(tapply(biota$periphyton,biota$taxa,mean)))
phytopl<-(ceiling(tapply(biota$phytoplankton,biota$taxa,mean)))
macroalg<-(ceiling(tapply(biota$macroalgae,biota$taxa,mean)))
herb<-(ceiling(tapply(biota$herb,biota$taxa,mean)))
tree<-(ceiling(tapply(biota$tree,biota$taxa,mean)))                                                 
shrub<-(ceiling(tapply(biota$shrub,biota$taxa,mean))) 
wood<-(ceiling(tapply(biota$woody,biota$taxa,mean))) 
vert<-(ceiling(tapply(biota$vert,biota$taxa,mean)))
invert<-(ceiling(tapply(biota$invert,biota$taxa,mean)))
zoopl<-(ceiling(tapply(biota$zooplankton,biota$taxa,mean))) 
ecto<-(ceiling(tapply(biota$ecto,biota$taxa,mean)))
mobile<-(ceiling(tapply(biota$mobile,biota$taxa,mean))) 

### Reassemble these into a single data set 
tmp1<-data.frame(alg) 
tmp2<-data.frame(herb) 
tmp<-merge(tmp1,tmp2,by="row.names") 
names(tmp)[1]<-"taxa" 
tmp1<-tmp

tmp2<-data.frame(wood) 
tmp<-merge(tmp1,tmp2,by.x="taxa", by.y="row.names") 
tmp1<-tmp

tmp2<-data.frame(tree) 
tmp<-merge(tmp1,tmp2,by.x="taxa", by.y="row.names") 
tmp1<-tmp

tmp2<-data.frame(shrub) 
tmp<-merge(tmp1,tmp2,by.x="taxa", by.y="row.names") 
tmp1<-tmp

tmp2<-data.frame(periph) 
tmp<-merge(tmp1,tmp2,by.x="taxa", by.y="row.names") 
tmp1<-tmp

tmp2<-data.frame(phytopl) 
tmp<-merge(tmp1,tmp2,by.x="taxa", by.y="row.names") 
tmp1<-tmp

tmp2<-data.frame(macroalg) 
tmp<-merge(tmp1,tmp2,by.x="taxa", by.y="row.names") 
tmp1<-tmp

tmp2<-data.frame(vert) 
tmp<-merge(tmp1,tmp2,by.x="taxa", by.y="row.names") 
tmp1<-tmp

tmp2<-data.frame(invert) 
tmp<-merge(tmp1,tmp2,by.x="taxa", by.y="row.names") 
tmp1<-tmp

tmp2<-data.frame(zoopl) 
tmp<-merge(tmp1,tmp2,by.x="taxa", by.y="row.names") 
tmp1<-tmp

tmp2<-data.frame(ecto) 
tmp<-merge(tmp1,tmp2,by.x="taxa", by.y="row.names") 
tmp1<-tmp

tmp2<-data.frame(mobile) 
tmp<-merge(tmp1,tmp2,by.x="taxa", by.y="row.names") 
tmp1<-tmp

tmp2<-data.frame(auto) 
tmp<-merge(tmp1,tmp2,by.x="taxa", by.y="row.names") 
tmp1<-tmp

### Rename a data frame with a single set of attributes per taxa 
biosum<-tmp

### Merge the summarized biota data into the taxa table 
comb.tb<-merge(biosum,taxa,by="taxa")

### Get the mean abundance of the each of the biotic covariates for each 
### unique study id number and resp_man 
### Studies with multiple types of herbivores can be listed as 
### intermediated in their response by deleting the round function 
attach(comb.tb) 
tb.mn<-aggregate(comb.tb[c("auto","alg","herb","wood","shrub","tree",
    "periph","phytopl","macroalg","vert","invert","zoopl","mobile","ecto")],
    list(ID_study=ID_study,resp_man=resp_man),FUN=mean)
detach(comb.tb)

### Make separate resp and man taxa data sets 
resp<-subset(tb.mn, resp_man=="RESP") 
man<-subset(tb.mn, resp_man=="MAN")
resp$resp_man<-NULL  #no longer needed
man$resp_man<-NULL  #no longer needed

### Some dummy categories don't make sense for resp_man=="MAN"
### e.g., no manipulations of top-down effects of autotrophs, so "man_auto"
### is nonsense and should be deleted
man1<-subset(man, select=-(auto:macroalg))
man<-man1 ; man1<-NULL
resp$vert<-NULL
resp$ecto<-NULL

### Add in a prefix to specify if the response is from resp or man taxa 
names(resp)<-paste("resp",names(resp),sep="_") 
names(man)<-paste("man",names(man),sep="_") 
names(resp)[1]<-"ID_study" 
names(man)[1]<-"ID_study"

### Merge resp and man taxa data sets 
comb.rm<-merge(man,resp, by="ID_study", all=T)

### Merge taxon indicators with full data for studies 
comb.all<-merge( comb.sr, comb.rm, by="ID_study", all.x=T)

### Write out merged study and response data set to csv file 
write.table(comb.all, file = "ELSIE-all-merge.csv", sep=",",
      col.names=T,row.names=F,quote=T)

### end




