#Reproduce carpetas básicas de Anchovy79

#lo he despertado el 27 de abril de 2021 para solucionar un error con el fleet, hay que cerrar R e instalar
#devtools::install_github("mareframe/mfdb", ref = "3.x")
#devtools::install_github("mareframe/mfdb", ref="3.x")
#devtools::install_github('hafro/rgadget')
#remotes::install_github('mareframe/mfdb', ref = 'd4bbd4e')


#Weight in kilos and numbers require to be multiplied by 1000 to be in units and not thousands

#Catchdistribution de las surveys y las acústicas solo biomasa


#setwd("~/GADGET/Assessment/Assessment2020_pandemia")
#setwd("~/GADGET/Assessment/Assessment_2021")
library(mfdb)
library(gdata)
library(XLConnect)               # load XLConnect package 
#library(plyr)
library(reshape2)
## Create a gadget directory, define some defaults to use with our queries below
exists("mdb_compi")
#mdb_comp <- mfdb('Ibera', db_params=list(dbname="mf"))
#mfdb('Ibera',destroy_schema = TRUE)#, db_params=list(dbname="mf"))
mdb_compi <- mfdb('Ibera.duckdb')#, db_params=list(dbname="mf"))
#gd <- gadget_directory("Anchovy2021_withLDandALK2020_1_2_data")
#gd <- gadget_directory("Anchovy2021_withLD2018_2019_1_2_andALKpelago2020")
area<-data.frame(1,"IXa",13000)
colnames(area)<-c("id","name","size")
yearsb<-c(1988:2020)
month<- rep(1:12, times = length(yearsb))
year<-rep(yearsb, times = 1, length.out = NA, each = 12)
areacell<-rep("IXa", times = length(yearsb)*12)
id<-rep(1, times = length(yearsb)*12)
temperatureb<-rep(5, times = length(yearsb)*12)
temperature<-data.frame(id,year,month,areacell,temperatureb)
colnames(temperature)<-c("id","year", "month","areacell","temperature")

#pelago = read.xls("/home/marga/GADGET/DATOS/pelago_99_14_simp.xls")#estas son las portuguesas
#ecocadiz = read.xls("/home/marga/GADGET/DATOS/ecocadiz_04_13_simp.xls")
#el 2013 debe coincidir con el total de ecocadiz0813 estas son las espa??olas
sar = read.xls("/home/marga/GADGET/DATOS/sar_98_07.xls")
catch_age=read.xls("/home/marga/GADGET/DATOS/catch_at_age_numbers88_13.xls")
length_age=read.xls("/home/marga/GADGET/DATOS/catch_length_at_age_88_13_3.xls")
#weight_age=read.csv("/home/marga/GADGET/DATOS/catches_weight_at_age_kg88_13_3.csv",strip.white = TRUE, sep=",", na.strings= c("999", "NA", " ", ""),stringsAsFactors=FALSE)  
#weight_age=read.csv("/home/marga/GADGET/DATOS/catches_weight_at_age_kg88_13_2.csv")
weight_age=read.xls("/home/marga/GADGET/DATOS/catches_weight_at_age_kg88_13_5.xls")
Catches_Ptg<-read.xls("/home/marga/GADGET/DATOS/Algarve/ANE_1989_2016 WGPELA_ENVIO_CORRIGIDO.xls")
require(dplyr)
require(tidyr)
Catches_Algarve<-Catches_Ptg %>% filter(AREATYPE=="27.9.a.s.a") %>%  group_by(YEAR,SEASON)%>% summarise(totalton=sum(CATON))%>% ungroup() %>% complete(YEAR, SEASON, fill = list(totalton = 0))
#Cambiar aquí totalton
#T1 - 10079.6 Kg

#T2 -  1953,5 Kg

#T3 - 12871.0 Kg

#T4 -  1206.6 Kg
Catches_Algarve<-add_row(Catches_Algarve, YEAR=2017, SEASON=1:4, totalton=c(10079.6,1953.5,12871,1206.6)*0.001) #porque estaba en kg se multiplica por 0.001 para que quede en tons CREO 2019 hay que verificar
# Trim1	1431,3 Kg sacados de LandingsPortugal2018 Folha1 y Sul es lo que me interesa
# 
# Trim2	11785,3 Kg
# 
# Trim3	52035,7 Kg
# 
# Trim4	83,6 Kg

Catches_Algarve<-add_row(Catches_Algarve, YEAR=2018, SEASON=1:4, totalton=c(1431.3,11785.3,52035.7,83.6)*0.001)  #porque estaba en kg se multiplica por 0.001 para que quede en tons CREO 2019 hay que verificar
Catches_Algarve<-add_row(Catches_Algarve, YEAR=2019, SEASON=1:4, totalton=c(0,0,4,109))  #porque estaba en ya en tons ver /home/marga/GADGET/DATOS/Algarve/Landings_Metier_9aS_alg_2019.xlsx
Catches_Algarve<-add_row(Catches_Algarve, YEAR=2020, SEASON=1:4, totalton=c(1.6059,67.2002,	73.5084,12.23))
#estaba en Kg pero en el excel lo he multiplicado por 0.001




#require(tidyr)
# 
#Year4bio2num uno menos que el año en curso
#Catches Algarve in biomass to number using BOQUERON_ALK cadiz y suma de números Cdaiz y Algarve en CatchesAllFleetsPTSP
#Year4bio2num<-2018

Year4bio2num<-2020
NUMPT<-data.frame(YEAR=rep(1989:Year4bio2num,each=4), SEASON=rep(1:4,each=length(1989:Year4bio2num)),NUMBERPT=rep(0,each=length(1989:Year4bio2num)*4),NUMBERSP=rep(0,each=length(1989:Year4bio2num)*4))
BIOMTOT<-data.frame(YEAR=rep(1989:Year4bio2num,each=4), SEASON=rep(1:4,each=length(1989:Year4bio2num)),TONPT=rep(0,each=length(1989:Year4bio2num)*4),TONSP=rep(0,each=length(1989:Year4bio2num)*4))
a<-1
for (i in 1989:2013){
  for (j in 1:4){
  bioq<-readWorksheetFromFile(paste("/home/marga/GADGET/DATOS/Taledas_allfleets_1988_2016/BOQUERON_ALK_",i,".xls",sep=""), sheet = paste(j,"Q",sep=""), header = F, startCol = 9, 
                           startRow = 2, endCol = 9, 
                           endRow = 2, useCachedValues=T)*0.001 #Para que quede en toneladas (está en kilos)
numberq<-readWorksheetFromFile(paste("/home/marga/GADGET/DATOS/Taledas_allfleets_1988_2016/BOQUERON_ALK_",i,".xls",sep=""), sheet = paste(j,"Q",sep=""), header = F, startCol = 9, 
                               startRow = 38, endCol = 9, 
                               endRow = 38, useCachedValues=T)
biopt<-Catches_Algarve %>% filter(YEAR==i,SEASON==j)%>%select(totalton) 
numpt<-biopt$totalton*numberq/bioq
NUMPT[a,]<-c(i,j,numpt,numberq)
BIOMTOT[a,]<-c(i,j,biopt,bioq)
a<-a+1
  }
}
##actualizar loop hasta 
for (i in 2014:Year4bio2num){
  for (j in 1:4){
    bioq<-readWorksheetFromFile(paste("/home/marga/GADGET/DATOS/Taledas_allfleets_1988_2016/BOQUERON_ALK_",i,".xls",sep=""), sheet = paste(j,"Q",sep=""), header = F, startCol = 9, 
                                startRow = 2, endCol = 9, 
                                endRow = 2, useCachedValues=T)*0.001 #Para que quede en toneladas
    numberq<-readWorksheetFromFile(paste("/home/marga/GADGET/DATOS/Taledas_allfleets_1988_2016/BOQUERON_ALK_",i,".xls",sep=""), sheet = paste(j,"Q",sep=""), header = F, startCol = 9, 
                                   startRow = 40, endCol = 9, 
                                   endRow = 40, useCachedValues=T)
    biopt<-Catches_Algarve %>% filter(YEAR==i,SEASON==j)%>%select(totalton) 
    numpt<-biopt$totalton*numberq/bioq
    BIOMTOT[a,]<-c(i,j,biopt,bioq) #en toneladas
    NUMPT[a,]<-c(i,j,numpt,numberq)
    a<-a+1
  }
}  
                           
CatchesAllFleetsPTSP<-NUMPT%>%mutate(ALL=NUMBERPT+NUMBERSP)                           
                           
    





#Trato de leer todas las tablas en un loop
#pelagos


#La del 2013 y 2014 es la del IEO porque IPIMAR sale la cosa rara, esto no es alk, esto está ponderado
mybiglist <- list()
for (i in c(1999,2001:2003,2005:2009)){
  name<-paste("Pelago",i,sep="")
  a<-readWorksheetFromFile("/home/marga/GADGET/DATOS/Acústica en 9aS_TallasyEdades.xls", sheet = paste(i,"Port",sep=""), 
                           header = TRUE, startCol = 13, 
                           startRow = 5, endCol = 17, 
                           endRow = 35, useCachedValues=TRUE)
  names(a)<-c("length","0", "1", "2", "3")
  a$year<-i
  a$month<-4
  a$type<-"pelago_comp"
  
  a[is.na(a)] <- 0
  
  mybiglist[[name]] <- a
}

for (i in c(2010,2013,2014)){
  name<-paste("Pelago",i,sep="")
  a<-readWorksheetFromFile("/home/marga/GADGET/DATOS/Acústica en 9aS_TallasyEdades.xls", sheet = paste(i,"Port",sep=""), 
                           header = TRUE, startCol = 11, 
                           startRow = 5, endCol = 15, 
                           endRow = 35, useCachedValues=TRUE)
  b<-readWorksheetFromFile("/home/marga/GADGET/DATOS/Acústica en 9aS_TallasyEdades.xls", sheet = paste(i,"Port",sep=""), 
                           header = F, startCol = 9, 
                           startRow = 2, endCol = 9, 
                           endRow = 2, useCachedValues=TRUE)
                          
  
  names(a)<-c("length","0", "1", "2", "3")
  a$total<-b[1,1]*0.001 #pasarlo a tons que luego se multiplica por 1000 para que quede en Kg
  a$year<-i
  a$month<-4
  a$type<-"pelago_comp"
  
  a[is.na(a)] <- 0
  
  mybiglist[[name]] <- a
}




mybiglist$Pelago1999$month<-3
mybiglist$Pelago2001$month<-3
mybiglist$Pelago2002$month<-3
mybiglist$Pelago2003$month<-2
#para 2017 no hay datos de ALK para Algarve así que pongo sólo lo de Cádiz, esto no va aquí esto está ponderado
for (i in c(2015:2021)){
  name<-paste("Pelago",i,sep="")
  a<-readWorksheetFromFile(paste("/home/marga/GADGET/DATOS/PELAGO/Pelago",i,".xls",sep=""), sheet = "Sheet1", 
                           header = TRUE, startCol = 1, 
                           startRow = 6, endCol = 5, 
                           endRow = 26, useCachedValues=TRUE)
  b<-readWorksheetFromFile(paste("/home/marga/GADGET/DATOS/PELAGO/Pelago",i,".xls",sep=""), sheet = "Sheet1", 
                           header = F, startCol = 10, 
                           startRow = 5, endCol = 10, 
                           endRow = 5, useCachedValues=TRUE)
  names(a)<-c("length","0", "1", "2", "3")
  a$year<-i
  a$month<-4
  a$type<-"pelago_comp"
  a$total<-b[1,1]
  a[is.na(a)] <- 0
  
  mybiglist[[name]] <- a
}

df<-plyr::ldply(mybiglist,data.frame)
pelago_bio_pre<-cbind(df[7], df[10]*1000, df[8])
pelago_bio_pre<-unique(na.omit(pelago_bio_pre))
df<-df[-10]
names(df)<-c(".id",    "length", "0", "1",   "2",     "3",     "year",   "month",  "type")
pelago_comp<-df





#only_Length_distribution_pelago
mybiglist <- list()
for (i in c(1999,2001:2003,2005:2009)){
  name<-paste("Pelago",i,sep="")
  a<-readWorksheetFromFile("/home/marga/GADGET/DATOS/Acústica en 9aS_TallasyEdades.xls", sheet = paste(i,"Port",sep=""), 
                           header = TRUE, startCol = 10, 
                           startRow = 5, endCol = 11, 
                           endRow = 35, useCachedValues=TRUE)
  names(a)<-c("length","count")
  a$year<-i
  a$month<-4-3
  a$type<-"pelago_comp_ld"
  
  a[is.na(a)] <- 0
  
  mybiglist[[name]] <- a
}

for (i in c(2010,2013,2014)){
  name<-paste("Pelago",i,sep="")
  a<-readWorksheetFromFile("/home/marga/GADGET/DATOS/Acústica en 9aS_TallasyEdades.xls", sheet = paste(i,"Port",sep=""), 
                           header = TRUE, startCol = 8, 
                           startRow = 5, endCol = 9, 
                           endRow = 35, useCachedValues=TRUE)
  names(a)<-c("length","count")
  a$year<-i
  a$month<-4-3
  a$type<-"pelago_comp_ld"
  
  a[is.na(a)] <- 0
  
  mybiglist[[name]] <- a
}




mybiglist$Pelago1999$month<-11   #3+3
mybiglist$Pelago1999$year<-1998

mybiglist$Pelago2001$month<-11 #3+3
mybiglist$Pelago2001$year<-2000

mybiglist$Pelago2002$month<-11#3+3
mybiglist$Pelago2002$year<-2001

mybiglist$Pelago2003$month<-10 #2+3
mybiglist$Pelago2003$year <-2002

  name<-"Pelago2015" #en millones
  a<-readWorksheetFromFile("/home/marga/GADGET/DATOS/PELAGO/ANE_PELAGO15_Results.xls", sheet = "9a S", 
                           header = TRUE, startCol = 13, 
                           startRow = 2, endCol = 14, 
                           endRow = 33, useCachedValues=TRUE)
  i<-2015
 # b<-readWorksheetFromFile(paste("/home/marga/GADGET/DATOS/PELAGO/Pelago",i,".xls",sep=""), sheet = "Sheet1", 
                          # header = F, startCol = 10,
                          # startRow = 5, endCol = 10,
                          # endRow = 5, useCachedValues=TRUE)
  names(a)<-c("length","count")
  a$year<-2015
  a$month<-4-3
  a$type<-"pelago_comp_ld"
  #a$total<-b[1,1]
  a[is.na(a)] <- 0
  a$count<-a$count*1000000
  
  mybiglist[[name]] <- a
  
  name<-"Pelago2016" #en miles
  a<-readWorksheetFromFile("/home/marga/GADGET/DATOS/PELAGO/PELAGO16_ANE_RESULTS_FINAL.xls", sheet = "AbundanceBiomassANE_FINAL", 
                           header = TRUE, startCol = 1, 
                           startRow = 66, endCol = 2, 
                           endRow = 86, useCachedValues=TRUE)
i<-2016
  # b<-readWorksheetFromFile(paste("/home/marga/GADGET/DATOS/PELAGO/Pelago",i,".xls",sep=""), sheet = "Sheet1",
  # header = F, startCol = 10,
  # startRow = 5, endCol = 10,
  # endRow = 5, useCachedValues=TRUE)
  names(a)<-c("length","count")
  a$year<-2016
  a$month<-4-3
  a$type<-"pelago_comp_ld"
  #a$total<-b[1,1]
  a[is.na(a)] <- 0
  a$count<-a$count*1000
  
  mybiglist[[name]] <- a

  #######Agregar pelago 2017 ld
  
  name<-"Pelago2017" #en miles
  a<-readWorksheetFromFile("/home/marga/GADGET/DATOS/PELAGO/results-ane-pel17_fv.xlsx", sheet = "CAD", 
                           header = TRUE, startCol = 1, 
                           startRow = 49, endCol = 2, 
                           endRow = 73, useCachedValues=TRUE)
  i<-2017
  # b<-readWorksheetFromFile(paste("/home/marga/GADGET/DATOS/PELAGO/Pelago",i,".xls",sep=""), sheet = "Sheet1",
  # header = F, startCol = 10,
  # startRow = 5, endCol = 10,
  # endRow = 5, useCachedValues=TRUE)
  names(a)<-c("length","count")
  a$year<-2017
  a$month<-4-3
  a$type<-"pelago_comp_ld"
  #a$total<-b[1,1]
  a[is.na(a)] <- 0
  a$count<-a$count*1000
  
  mybiglist[[name]] <- a
  
  
  #######Agregar pelago 2018 ld
  
  name<-"Pelago2018" #en miles
  a<-readWorksheetFromFile("/home/marga/GADGET/DATOS/PELAGO/results-ANE-PEL18.xlsx", sheet = "algarve+cadiz", 
                           header = TRUE, startCol = 1, 
                           startRow = 1, endCol = 2, 
                           endRow = 30, useCachedValues=TRUE)
  i<-2018
  # b<-readWorksheetFromFile(paste("/home/marga/GADGET/DATOS/PELAGO/Pelago",i,".xls",sep=""), sheet = "Sheet1",
  # header = F, startCol = 10,
  # startRow = 5, endCol = 10,
  # endRow = 5, useCachedValues=TRUE)
  names(a)<-c("length","count")
  a$year<-2018
  a$month<-4-3
  a$type<-"pelago_comp_ld"
  #a$total<-b[1,1]
  a[is.na(a)] <- 0
  a$count<-a$count*1000
  
  mybiglist[[name]] <- a
  
  
  #######Agregar pelago 2019 ld
  
  name<-"Pelago2019" #en miles
  a<-readWorksheetFromFile("/home/marga/GADGET/DATOS/PELAGO/results-ANE-PEL19.xlsx", sheet = "algarve+cadiz", 
                           header = TRUE, startCol = 1, 
                           startRow = 1, endCol = 2, 
                           endRow = 30, useCachedValues=TRUE)
  i<-2019
  # b<-readWorksheetFromFile(paste("/home/marga/GADGET/DATOS/PELAGO/Pelago",i,".xls",sep=""), sheet = "Sheet1",
  # header = F, startCol = 10,
  # startRow = 5, endCol = 10,
  # endRow = 5, useCachedValues=TRUE)
  names(a)<-c("length","count")
  a$year<-2019
  a$month<-4-3
  a$type<-"pelago_comp_ld"
  #a$total<-b[1,1]
  a[is.na(a)] <- 0
  a$count<-a$count*1000
  
  mybiglist[[name]] <- a
  
  #######Agregar pelago 2020 ld
  
  name<-"Pelago2020" #en miles
  a<-readWorksheetFromFile("/home/marga/GADGET/DATOS/PELAGO/results-ANE-PEL20.xlsx", sheet = "algarve+cadiz", 
                           header = TRUE, startCol = 1, 
                           startRow = 1, endCol = 2, 
                           endRow = 30, useCachedValues=TRUE)
  i<-2020
  # b<-readWorksheetFromFile(paste("/home/marga/GADGET/DATOS/PELAGO/Pelago",i,".xls",sep=""), sheet = "Sheet1",
  # header = F, startCol = 10,
  # startRow = 5, endCol = 10,
  # endRow = 5, useCachedValues=TRUE)
  names(a)<-c("length","count")
  a$year<-2020
  a$month<-4-3
  a$type<-"pelago_comp_ld"
  #a$total<-b[1,1]
  a[is.na(a)] <- 0
  a$count<-a$count*1000
  
  mybiglist[[name]] <- a
  
  #######Agregar pelago 2021 ld
  
  name<-"Pelago2021" #en miles
  a<-readWorksheetFromFile("/home/marga/GADGET/DATOS/PELAGO/results-ANE-PEL21.xlsx", sheet = "algarve+cadiz", 
                           header = TRUE, startCol = 1, 
                           startRow = 1, endCol = 2, 
                           endRow = 30, useCachedValues=TRUE)
  i<-2021
  # b<-readWorksheetFromFile(paste("/home/marga/GADGET/DATOS/PELAGO/Pelago",i,".xls",sep=""), sheet = "Sheet1",
  # header = F, startCol = 10,
  # startRow = 5, endCol = 10,
  # endRow = 5, useCachedValues=TRUE)
  names(a)<-c("length","count")
  a$year<-2021
  a$month<-4-3
  a$type<-"pelago_comp_ld"
  #a$total<-b[1,1]
  a[is.na(a)] <- 0
  a$count<-a$count*1000
  
  mybiglist[[name]] <- a 
  
 #  name<-"Pelago2000" #en miles
 #  d<-readWorksheetFromFile("/home/marga/GADGET/DATOS/PELAGO/biq2000.xls", sheet = "ALgarve", 
 #                           header = TRUE, startCol = 1, 
 #                           startRow = 1, endCol = 2, 
 #                           endRow = 30, useCachedValues=TRUE)
 #  c<-readWorksheetFromFile("/home/marga/GADGET/DATOS/PELAGO/biq2000.xls", sheet = "CADIZ", 
 #                              header = TRUE, startCol = 1, 
 #                              startRow = 1, endCol = 2, 
 #                              endRow =30, useCachedValues=TRUE)
 #  d[is.na(d)] <- 0
 #  c[is.na(c)] <- 0
 #  a<-data.frame(cbind(d$L,(d$mil+c$mil)*1000))
 # 
 #  # b<-readWorksheetFromFile(paste("/home/marga/GADGET/DATOS/PELAGO/Pelago",i,".xls",sep=""), sheet = "Sheet1",
 #  # header = F, startCol = 10,
 #  # startRow = 5, endCol = 10,
 #  # endRow = 5, useCachedValues=TRUE)
 #  names(a)<-c("length","count")
 #  a$year<-2000
 #  a$month<-4-3
 #  a$type<-"pelago_comp_ld"
 #  #a$total<-b[1,1]
 #  a[is.na(a)] <- 0
 # # a$count<-a$count*1000
 #  
 #  mybiglist[[name]] <- a
  
  
  
  
  
    

df3<-plyr::ldply(mybiglist,data.frame)
#pelago_bio_pre<-cbind(df[7], df[10]*1000, df[8])
#pelago_bio_pre<-unique(na.omit(pelago_bio_pre))
#df3<-df3[-10]
#names(df3)<-c(".id",    "length", "0", "1",   "2",     "3",     "year",   "month",  "type")
names(df3)<-c(".id",    "length", "count",     "year",   "month",  "sampling_type")
pelago_comp_ld<-df3[,1:6]

pelago_comp_ld$areacell<-"IXa"
pelago_comp_ld$species<-'ANE'
pelago.ldistnoage<-pelago_comp_ld[,2:8]







#aldist_pelago solo 14 15 16 17 18 19 y 20 2013 no porque no tengo la ALK
mybiglist <- list()

name<-"alPelago2014" 
d<-readWorksheetFromFile("/home/marga/GADGET/DATOS/PELAGO/PELAGO14_ANE_ALK_WCOAST_sg.xlsx", sheet = "alg", 
                         header = TRUE, startCol = 6, 
                         startRow = 7, endCol = 9, 
                         endRow = 22, useCachedValues=TRUE)
c<-readWorksheetFromFile("/home/marga/GADGET/DATOS/PELAGO/PELAGO14_ANE_ALK_WCOAST_sg.xlsx", sheet = "cad", 
                         header = TRUE, startCol = 6, 
                         startRow = 7, endCol = 9, 
                         endRow =22, useCachedValues=TRUE)
d[is.na(d)] <- 0
c[is.na(c)] <- 0

a<-data.frame(cbind(c$Row.Labels,0,d$X1+c$X1,c$X2+d$X2,c$X3+d$X3))
names(a)<-c("length", "0","1", "2", "3")
a$year<-2014
a$month<-4-3
a$type<-"pelago_comp_ald"
a[is.na(a)] <- 0
mybiglist[[name]] <- a


name<-"alPelago2015" 
d<-readWorksheetFromFile("/home/marga/GADGET/DATOS/PELAGO/ANE_PELAGO15_Results_sg.xlsx", sheet = "Algarve", 
                         header = TRUE, startCol = 17, 
                         startRow = 4, endCol = 20, 
                         endRow = 31, useCachedValues=TRUE)
c<-readWorksheetFromFile("/home/marga/GADGET/DATOS/PELAGO/ANE_PELAGO15_Results_sg.xlsx", sheet = "CADIZ", 
                         header = TRUE, startCol = 17, 
                         startRow = 4, endCol = 20, 
                         endRow =31, useCachedValues=TRUE)
d[is.na(d)] <- 0
c[is.na(c)] <- 0

a<-data.frame(cbind(c$Col1,0,d$X1+c$X1,c$X2+d$X2,c$X3+d$X3))
names(a)<-c("length", "0","1", "2", "3")
a$year<-2015
a$month<-4-3
a$type<-"pelago_comp_ald"
a[is.na(a)] <- 0
mybiglist[[name]] <- a

name<-"alPelago2016" 
a<-readWorksheetFromFile("/home/marga/GADGET/DATOS/PELAGO/PELAGO16_ANE_RESULTS_FINAL_sg.xlsx", sheet = "ALKs_FINAL", 
                         header = TRUE, startCol = 8, 
                         startRow = 6, endCol = 11, 
                         endRow = 28, useCachedValues=TRUE)
a<-data.frame(cbind(a$Col1,0,a$X1,a$X2,a$X3))
names(a)<-c("length", "0","1", "2", "3")
a$year<-2016
a$month<-4-3
a$type<-"pelago_comp_ald"
a[is.na(a)] <- 0
mybiglist[[name]] <- a

i<-2017
name<-"alPelago2017" #solo cadiz no hay Algarve
a<-readWorksheetFromFile(paste("/home/marga/GADGET/DATOS/PELAGO/Pelago",i,".xls",sep=""), sheet = "Sheet1", 
                         header = TRUE, startCol = 1, 
                         startRow = 5, endCol = 4, 
                         endRow = 26, useCachedValues=TRUE)
a<-data.frame(cbind(a[,1],0,a$X1,a$X2,a$X3))
#a<-data.frame(cbind(a$Col1,0,a$X1,a$X2,a$X3))
names(a)<-c("length", "0","1", "2", "3")
a$year<-2017
a$month<-4-3
a$type<-"pelago_comp_ald"

a[is.na(a)] <- 0

mybiglist[[name]] <- a

i<-2018
name<-"alPelago2018" #solo cadiz no hay Algarve
a<-readWorksheetFromFile(paste("/home/marga/GADGET/DATOS/PELAGO/Pelago",i,".xls",sep=""), sheet = "Sheet1", 
                         header = TRUE, startCol = 1, 
                         startRow = 5, endCol = 4, 
                         endRow = 26, useCachedValues=TRUE)
#a<-data.frame(cbind(a$Col1,0,a$X1,a$X2,a$X3))
a<-data.frame(cbind(a[,1],0,a$X1,a$X2,a$X3))
names(a)<-c("length", "0","1", "2", "3")
#names(a)<-c("length", "1", "2", "3")
a$year<-2018
a$month<-4-3
a$type<-"pelago_comp_ald"

a[is.na(a)] <- 0

mybiglist[[name]] <- a


i<-2019
name<-"alPelago2019" #solo cadiz no hay Algarve
a<-readWorksheetFromFile(paste("/home/marga/GADGET/DATOS/PELAGO/Pelago",i,".xls",sep=""), sheet = "Sheet1", 
                         header = TRUE, startCol = 1, 
                         startRow = 5, endCol = 4, 
                         endRow = 26, useCachedValues=TRUE)

a<-data.frame(cbind(a[,1],0,a$X1,a$X2,a$X3))
names(a)<-c("length", "0","1", "2", "3")
#names(a)<-c("length", "1", "2", "3")
a$year<-2019
a$month<-4-3
a$type<-"pelago_comp_ald"

a[is.na(a)] <- 0

mybiglist[[name]] <- a

i<-2020
name<-"alPelago2020" #cadiz y Algarve
a<-readWorksheetFromFile(paste("/home/marga/GADGET/DATOS/PELAGO/Pelago",i,".xls",sep=""), sheet = "Sheet1", 
                         header = TRUE, startCol = 1, 
                         startRow = 5, endCol = 4, 
                         endRow = 26, useCachedValues=TRUE)
#a<-data.frame(cbind(a$Col1,0,a$X1,a$X2,a$X3))
a<-data.frame(cbind(a[,1],0,a$X1,a$X2,a$X3))
names(a)<-c("length", "0","1", "2", "3")
#names(a)<-c("length", "1", "2", "3")
a$year<-2020
a$month<-4-3
a$type<-"pelago_comp_ald"

a[is.na(a)] <- 0

mybiglist[[name]] <- a


i<-2021
name<-"alPelago2021" #cadiz y Algarve
a<-readWorksheetFromFile(paste("/home/marga/GADGET/DATOS/PELAGO/Pelago",i,".xls",sep=""), sheet = "Sheet1", 
                         header = TRUE, startCol = 1, 
                         startRow = 5, endCol = 4, 
                         endRow = 29 , useCachedValues=TRUE)
#a<-data.frame(cbind(a$Col1,0,a$X1,a$X2,a$X3))
a<-data.frame(cbind(a[,1],0,a$X1,a$X2,a$X3))
names(a)<-c("length", "0","1", "2", "3")
#names(a)<-c("length", "1", "2", "3")
a$year<-2021
a$month<-4-3
a$type<-"pelago_comp_ald"

a[is.na(a)] <- 0

mybiglist[[name]] <- a


# b<-readWorksheetFromFile(paste("/home/marga/GADGET/DATOS/PELAGO/Pelago",i,".xls",sep=""), sheet = "Sheet1",
# header = F, startCol = 10,
# startRow = 5, endCol = 10,
# endRow = 5, useCachedValues=TRUE)


df4<-plyr::ldply(mybiglist,data.frame)
#pelago_bio_pre<-cbind(df[7], df[10]*1000, df[8])
#pelago_bio_pre<-unique(na.omit(pelago_bio_pre))
#df3<-df3[-10]
names(df4)<-c(".id",    "length", "0", "1",   "2",     "3",     "year",   "month",  "type")
pelago_comp_ald<-df4













#########################
#ecocadiz
mybiglist <- list()
B0<-data.frame(year=c(1,2),total=c(1,2))
fi<-1
for (i in c(2004,2006,2007,2009,2010)){
  name<-paste("Ecocadiz",i,sep="")
  a<-readWorksheetFromFile("/home/marga/GADGET/DATOS/Acústica en 9aS_TallasyEdades.xls", sheet = paste(i,"Esp",sep=""), 
                           header = TRUE, startCol = 13, 
                           startRow = 5, endCol = 17, 
                           endRow = 37, useCachedValues=TRUE)
  bioage0<-readWorksheetFromFile("/home/marga/GADGET/DATOS/Acústica en 9aS_TallasyEdades.xls", sheet = paste(i,"Esp",sep=""), 
                                 header = F, startCol = 5, 
                                 startRow = 92, endCol = 5, 
                                 endRow = 92, useCachedValues=TRUE)
  
  B0[fi,]<-c(i,bioage0[1,1])
  
  names(a)<-c("length","0", "1", "2", "3")
  a$year<-i
  a$month<-7
  a$type<-"ecocadiz_comp"
  
  a[is.na(a)] <- 0
  
  mybiglist[[name]] <- a
  fi<-fi+1
}




for (i in c(2013,2014)){
  name<-paste("Ecocadiz",i,sep="")
  a<-readWorksheetFromFile("/home/marga/GADGET/DATOS/Acústica en 9aS_TallasyEdades.xls", sheet = paste(i,"Esp",sep=""), 
                           header = TRUE, startCol = 11, 
                           startRow = 5, endCol = 15, 
                           endRow = 35, useCachedValues=TRUE)
  
  bioage0<-readWorksheetFromFile("/home/marga/GADGET/DATOS/Acústica en 9aS_TallasyEdades.xls", sheet = paste(i,"Esp",sep=""), 
                                 header = F, startCol = 5, 
                                 startRow = 92, endCol = 5, 
                                 endRow = 92, useCachedValues=TRUE)
  
  B0[fi,]<-c(i,bioage0[1,1])
  
  names(a)<-c("length","0", "1", "2", "3")
  a$year<-i
  a$month<-7
  a$type<-"ecocadiz_comp"
  
  a[is.na(a)] <- 0
  
  mybiglist[[name]] <- a
  fi<-fi+1
}

mybiglist$Ecocadiz2004$month<-6
mybiglist$Ecocadiz2006$month<-6
mybiglist$Ecocadiz2013$month<-8
B<-data.frame(year=c(1,2),total=c(1,2),month=c(1,2))
#ojo a tiene valores ponderados pero que no se van a usar, sin embargo B nos interesa y bioage0 es para restar la biomasa de la edad 0 de la biomasa total, me falta hacerlo en 2010,2013 y 2014
for (i in c(2015:2020)){
  name<-paste("Ecocadiz",i,sep="")
  a<-readWorksheetFromFile(paste("/home/marga/GADGET/DATOS/ECOCADIZ/ALK_ECOCADIZ_",i,".xls",sep=""), sheet = "ALK_GENERAL_BOQUERON", 
                           header = TRUE, startCol = 11, 
                           startRow = 7, endCol = 15, 
                           endRow = 38, useCachedValues=TRUE)
  b<-readWorksheetFromFile(paste("/home/marga/GADGET/DATOS/ECOCADIZ/ALK_ECOCADIZ_",i,".xls",sep=""), sheet = "ALK_GENERAL_BOQUERON", 
                           header = F, startCol = 9, 
                           startRow = 3, endCol = 9, 
                           endRow = 3, useCachedValues=T)
  bioage0<-readWorksheetFromFile(paste("/home/marga/GADGET/DATOS/ECOCADIZ/ALK_ECOCADIZ_",i,".xls",sep=""), sheet = "ALK_GENERAL_BOQUERON", 
                                    header = F, startCol = 5, 
                                    startRow = 103, endCol = 5, 
                                    endRow = 103, useCachedValues=T)
  
  
  names(a)<-c("length","0", "1", "2", "3")
  a$year<-i
  B[(i-2014),]$year<-i
  a$month<-7
  B[(i-2014),]$total<-b[1,1]-bioage0[1,1]
  B[(i-2014),]$month<-7
  a$type<-"ecocadiz_comp"
  a[is.na(a)] <- 0
  mybiglist[[name]] <- a
  
}

names(B)<-c("year","count","month")
B$areacell<-"IXa"
B$species<-'ANE'
B$sampling_type<-"ecocadiz_bio"
B$vessel<-'1.RSH'

df<-plyr::ldply(mybiglist,data.frame)
names(df)<-c(".id",    "length", "0", "1",   "2",     "3",     "year",   "month",  "type")
ecocadiz_comp<-df

pelago_def<-melt(pelago_comp, id=c(".id","length","year",   "month",  "type" )) 

names(pelago_def)<-c(".id","length","year",   "month",  "sampling_type","age","count") 

ecocadiz_def<-melt(ecocadiz_comp, id=c(".id","length","year",   "month",  "type" )) 

names(ecocadiz_def)<-c(".id","length","year",   "month",  "sampling_type","age","count") 

pelago_def$areacell<-"IXa"
pelago_def$species<-'ANE'
pelago_def$count<-signif(pelago_def$count,2)
pelago_def$count<-pelago_def$count*1000 #para que quede en individuos
pelago.ldist<-pelago_def[,2:9]

ecocadiz_def$areacell<-"IXa"
ecocadiz_def$species<-'ANE'
ecocadiz_def$count<-signif(ecocadiz_def$count,2)
ecocadiz_def$count<-ecocadiz_def$count*1000 #para que quede en individuos
ecocadiz.ldist<-ecocadiz_def[,2:9]



###############################################################
#alk ecocadiz
mybiglist <- list()
for (i in c(2004,2006,2007,2009,2010,2013,2014,2015)){
  name<-paste("Ecocadiz",i,sep="")
  a<-readWorksheetFromFile("/home/marga/GADGET/DATOS/Acústica en 9aS_TallasyEdades.xls", sheet = paste(i,"Esp",sep=""), 
                           header = TRUE, startCol = 1, 
                           startRow = 5, endCol = 5, 
                           endRow = 37, useCachedValues=TRUE)
  names(a)<-c("length","0", "1", "2", "3")
  a$year<-i
  a$month<-7-3
  a$type<-"ecocadiz_comp_ald"
  
  a[is.na(a)] <- 0
  
  mybiglist[[name]] <- a
}



mybiglist$Ecocadiz2004$month<-6-3
mybiglist$Ecocadiz2006$month<-6-3
mybiglist$Ecocadiz2013$month<-8-3
#B<-data.frame(year=c(1,2),total=c(1,2),month=c(1,2))
i<-2016
  name<-paste("Ecocadiz",i,sep="")
  a<-readWorksheetFromFile(paste("/home/marga/GADGET/DATOS/ECOCADIZ/ALK_ECOCADIZ_",i,".xls",sep=""), sheet = "ALK_GENERAL_BOQUERON", 
                           header = TRUE, startCol = 1, 
                           startRow = 6, endCol = 5, 
                           endRow = 38, useCachedValues=TRUE)
  names(a)<-c("length","0", "1", "2", "3")
  a$year<-i
 # B[(i-2014),]$year<-i
  a$month<-7-3
 # B[(i-2014),]$total<-b[1,1]
  #B[(i-2014),]$month<-7
  a$type<-"ecocadiz_comp_ald"
  a[is.na(a)] <- 0
  mybiglist[[name]] <- a
  
  i<-2017
  name<-paste("Ecocadiz",i,sep="")
  a<-readWorksheetFromFile(paste("/home/marga/GADGET/DATOS/ECOCADIZ/ALK_ECOCADIZ_",i,".xls",sep=""), sheet = "ALK_GENERAL_BOQUERON", 
                           header = TRUE, startCol = 1, 
                           startRow = 6, endCol = 5, 
                           endRow = 38, useCachedValues=TRUE)
  names(a)<-c("length","0", "1", "2", "3")
  a$year<-i
  # B[(i-2014),]$year<-i
  a$month<-7-3
  # B[(i-2014),]$total<-b[1,1]
  #B[(i-2014),]$month<-7
  a$type<-"ecocadiz_comp_ald"
  a[is.na(a)] <- 0
  mybiglist[[name]] <- a
  
  ###################2018
  i<-2018
  name<-paste("Ecocadiz",i,sep="")
  a<-readWorksheetFromFile(paste("/home/marga/GADGET/DATOS/ECOCADIZ/ALK_ECOCADIZ_",i,".xls",sep=""), sheet = "ALK_GENERAL_BOQUERON", 
                           header = TRUE, startCol = 1, 
                           startRow = 6, endCol = 5, 
                           endRow = 38, useCachedValues=TRUE)
  names(a)<-c("length","0", "1", "2", "3")
  a$year<-i
  # B[(i-2014),]$year<-i
  a$month<-7-3
  # B[(i-2014),]$total<-b[1,1]
  #B[(i-2014),]$month<-7
  a$type<-"ecocadiz_comp_ald"
  a[is.na(a)] <- 0
  mybiglist[[name]] <- a
  #############3
  i<-2019
  name<-paste("Ecocadiz",i,sep="")
  a<-readWorksheetFromFile(paste("/home/marga/GADGET/DATOS/ECOCADIZ/ALK_ECOCADIZ_",i,".xls",sep=""), sheet = "ALK_GENERAL_BOQUERON", 
                           header = TRUE, startCol = 1, 
                           startRow = 6, endCol = 5, 
                           endRow = 38, useCachedValues=TRUE)
  names(a)<-c("length","0", "1", "2", "3")
  a$year<-i
  # B[(i-2014),]$year<-i
  a$month<-7-3
  # B[(i-2014),]$total<-b[1,1]
  #B[(i-2014),]$month<-7
  a$type<-"ecocadiz_comp_ald"
  a[is.na(a)] <- 0
  mybiglist[[name]] <- a
  #############3
  i<-2020
  name<-paste("Ecocadiz",i,sep="")
  a<-readWorksheetFromFile(paste("/home/marga/GADGET/DATOS/ECOCADIZ/ALK_ECOCADIZ_",i,".xls",sep=""), sheet = "ALK_GENERAL_BOQUERON", 
                           header = TRUE, startCol = 1, 
                           startRow = 6, endCol = 5, 
                           endRow = 38, useCachedValues=TRUE)
  names(a)<-c("length","0", "1", "2", "3")
  a$year<-i
  # B[(i-2014),]$year<-i
  a$month<-7-3
  # B[(i-2014),]$total<-b[1,1]
  #B[(i-2014),]$month<-7
  a$type<-"ecocadiz_comp_ald"
  a[is.na(a)] <- 0
  mybiglist[[name]] <- a
  
  df<-plyr::ldply(mybiglist,data.frame)
  names(df)<-c(".id",    "length", "0", "1",   "2",     "3",     "year",   "month",  "type")
  ecocadiz_comp_ald<-df[,1:9] 

#names(B)<-c("year","count","month")
#B$areacell<-"IXa"
#B$species<-'ANE'
#B$sampling_type<-"ecocadiz_bio"
#B$vessel<-'1.RSH'

  pelago_def_ald<-melt(pelago_comp_ald, id=c(".id","length","year",   "month",  "type" )) 
  
  names(pelago_def_ald)<-c(".id","length","year",   "month",  "sampling_type","age","count") 
  
  ecocadiz_def_ald<-melt(ecocadiz_comp_ald, id=c(".id","length","year",   "month",  "type" )) 
  
  names(ecocadiz_def_ald)<-c(".id","length","year",   "month",  "sampling_type","age","count") 
  
  pelago_def_ald$areacell<-"IXa"
  pelago_def_ald$species<-'ANE'
 # pelago_def_ald$count<-signif(pelago_def_ald$count,2)
 # pelago_def_ald$count<-pelago_def$count*1000 #para que quede en individuos
  pelago.aldist<-pelago_def_ald[,2:9]
  
  ecocadiz_def_ald$areacell<-"IXa"
  ecocadiz_def_ald$species<-'ANE'
  #ecocadiz_def$count<-signif(ecocadiz_def$count,2)
  #ecocadiz_def$count<-ecocadiz_def$count*1000 #para que quede en individuos
  ecocadiz.aldist<-ecocadiz_def_ald[,2:9]

  ##################3  
#length distribution ecocadiz
  mybiglistII <- list()
  for (i in c(2004,2006,2007,2009,2010)){
    name<-paste("Ecocadiz",i,sep="")
    a<-readWorksheetFromFile("/home/marga/GADGET/DATOS/Acústica en 9aS_TallasyEdades.xls", sheet = paste(i,"Esp",sep=""), 
                             header = TRUE, startCol = 10, 
                             startRow = 5, endCol = 11, 
                             endRow = 37, useCachedValues=TRUE)
    names(a)<-c("length","count")
    a$year<-i
    a$month<-7-3
    a$type<-"ecocadiz_comp_ld"
    
    a[is.na(a)] <- 0
    
    mybiglistII[[name]] <- a
  }

  for (i in c(2013:2015)){
    name<-paste("Ecocadiz",i,sep="")
    a<-readWorksheetFromFile("/home/marga/GADGET/DATOS/Acústica en 9aS_TallasyEdades.xls", sheet = paste(i,"Esp",sep=""), 
                             header = TRUE, startCol = 8, 
                             startRow = 5, endCol = 9, 
                             endRow = 37, useCachedValues=TRUE)
    names(a)<-c("length","count")
    a$year<-i
    a$month<-7-3
    a$type<-"ecocadiz_comp_ld"
    
    a[is.na(a)] <- 0
    
    mybiglistII[[name]] <- a
  }
  
  mybiglistII$Ecocadiz2004$month<-6-3
  mybiglistII$Ecocadiz2006$month<-6-3
  mybiglistII$Ecocadiz2013$month<-8-3
  i<-2016
  name<-paste("Ecocadiz",i,sep="")
  a<-readWorksheetFromFile(paste("/home/marga/GADGET/DATOS/ECOCADIZ/ALK_ECOCADIZ_",i,".xls",sep=""), sheet = "ALK_GENERAL_BOQUERON", 
                           header = TRUE, startCol = 8, 
                           startRow = 6, endCol = 9, 
                           endRow = 38, useCachedValues=TRUE)
  names(a)<-c("length","count")
  a$year<-i
  a$month<-7-3
  a$type<-"ecocadiz_comp_ld"
  
  a[is.na(a)] <- 0
  
  mybiglistII[[name]] <- a
  
  i<-2017
  name<-paste("Ecocadiz",i,sep="")
  a<-readWorksheetFromFile(paste("/home/marga/GADGET/DATOS/ECOCADIZ/ALK_ECOCADIZ_",i,".xls",sep=""), sheet = "ALK_GENERAL_BOQUERON", 
                           header = TRUE, startCol = 8, 
                           startRow = 6, endCol = 9, 
                           endRow = 38, useCachedValues=TRUE)
  names(a)<-c("length","count")
  a$year<-i
  a$month<-7-3
  a$type<-"ecocadiz_comp_ld"
  
  a[is.na(a)] <- 0
  
  mybiglistII[[name]] <- a
  
  #############2018
  
  i<-2018
  name<-paste("Ecocadiz",i,sep="")
  a<-readWorksheetFromFile(paste("/home/marga/GADGET/DATOS/ECOCADIZ/ALK_ECOCADIZ_",i,".xls",sep=""), sheet = "ALK_GENERAL_BOQUERON", 
                           header = TRUE, startCol = 8, 
                           startRow = 6, endCol = 9, 
                           endRow = 38, useCachedValues=TRUE)
  names(a)<-c("length","count")
  a$year<-i
  a$month<-7-3
  a$type<-"ecocadiz_comp_ld"
  
  a[is.na(a)] <- 0
  
  mybiglistII[[name]] <- a
  
  #############2019
  
  i<-2019
  name<-paste("Ecocadiz",i,sep="")
  a<-readWorksheetFromFile(paste("/home/marga/GADGET/DATOS/ECOCADIZ/ALK_ECOCADIZ_",i,".xls",sep=""), sheet = "ALK_GENERAL_BOQUERON", 
                           header = TRUE, startCol = 18, 
                           startRow = 6, endCol = 19, 
                           endRow = 38, useCachedValues=TRUE)
  names(a)<-c("length","count")
  a$year<-i
  a$month<-7-3
  a$type<-"ecocadiz_comp_ld"
  
  a[is.na(a)] <- 0
  
  mybiglistII[[name]] <- a 
  
  #############2020
  
  i<-2020
  name<-paste("Ecocadiz",i,sep="")
  a<-readWorksheetFromFile(paste("/home/marga/GADGET/DATOS/ECOCADIZ/ALK_ECOCADIZ_",i,".xls",sep=""), sheet = "ALK_GENERAL_BOQUERON", 
                           header = TRUE, startCol = 18, 
                           startRow = 6, endCol = 19, 
                           endRow = 38, useCachedValues=TRUE)
  names(a)<-c("length","count")
  a$year<-i
  a$month<-7-3
  a$type<-"ecocadiz_comp_ld"
  
  a[is.na(a)] <- 0
  
  mybiglistII[[name]] <- a 
  
  
  
  dfIII<-plyr::ldply(mybiglistII,data.frame)
  names(dfIII)<-c(".id",    "length", "count",     "year",   "month",  "sampling_type")
  ecocadiz_comp_ld<-dfIII[,1:6]
  #arsa_def<-melt(arsa_comp, id=c(".id","length","year",   "month",  "type" )) 
  
  #names(arsa_def)<-c(".id","length","year",   "month",  "sampling_type","age","count")
  ecocadiz_comp_ld$areacell<-"IXa"
  ecocadiz_comp_ld$species<-'ANE'
  ecocadiz.ldistnoage<-ecocadiz_comp_ld[,2:8]
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  


#######################################################################
#length distribution of the surveys
library(ggplot2)
hi<-aggregate(count~length+year+sampling_type,ecocadiz.ldist,sum)
ho<-aggregate(count~length+year+sampling_type,pelago.ldist,sum)
hu<-rbind(hi,ho)
#ecocadiz_ld_plot<-qplot(length, count, data = hu, color = year)
ecocadiz_ld_plot<-ggplot(hu,aes(length, count))

ecocadiz_ld_plot+facet_grid(sampling_type~year)+geom_line()
library(Rgadget)

hu  %>% ggplot(aes(length,count)) + geom_line()+ facet_wrap(~sampling_type+year,scale='free_y')

hi<-aggregate(count~age+year+sampling_type,ecocadiz.ldist,sum)
ho<-aggregate(count~age+year+sampling_type,pelago.ldist,sum)
hu<-rbind(hi,ho)
ecocadiz_ad_plot<-ggplot(hu, aes(age, count))
ecocadiz_ad_plot+facet_grid(sampling_type~year)+geom_point()
library(Rgadget)
hu<-subset(hu,age==0|age==1|age==2)
hu  %>% ggplot(aes(age,count)) + geom_point()+ facet_wrap(~sampling_type+year,scale='free_y')

hu  %>% ggplot(aes(year,count)) + geom_point() + facet_wrap(~age+sampling_type,scale='free',ncol=2)
####################################3



pelago_bio<-readWorksheetFromFile("/home/marga/GADGET/DATOS/Acústica en 9aS_TallasyEdades.xls", sheet = "BiomasaPort", 
                                  header = F, startCol = 3, 
                                  startRow = 35, endCol = 18, 
                                  endRow = 35, useCachedValues=TRUE)
pelago_bio<-t(pelago_bio)
#ojo que va en kg hay que multiplicar por 1000 las tonnes
pelago_biom<-data.frame(cbind(1999:2014,pelago_bio*1000,c(rep(3,4),2,rep(4,11))))
names(pelago_biom)<-c("year","count","month")
names(pelago_bio_pre)<-c("year","count","month")
pelago_biom<-rbind(pelago_biom%>%filter(year<2010),pelago_bio_pre)
# #pelbiom2018<-readWorksheetFromFile("/home/marga/GADGET/DATOS/PELAGO/results-ANE-PEL18.xlsx", sheet = "algarve+cadiz", 
#                                    header = F, startCol = 3, 
#                                    startRow = 44, endCol = 3, 
#                                    endRow = 44, useCachedValues=TRUE)
# pelago_biom<-add_row(pelago_biom,year=2018,count=pelbiom2018[1,1]*1000,month=4)
# pelbiom2019<-readWorksheetFromFile("/home/marga/GADGET/DATOS/PELAGO/results-ANE-PEL19.xlsx", sheet = "algarve+cadiz", 
#                                    header = F, startCol = 3, 
#                                    startRow = 44, endCol = 3, 
#                                    endRow = 44, useCachedValues=TRUE)
# pelago_biom<-add_row(pelago_biom,year=2019,count=pelbiom2019[1,1]*1000,month=4)
names(pelago_biom)<-c("year","count","month")
pelago_biom$month<-pelago_biom$month-3
pelago_biom$areacell<-"IXa"
pelago_biom$species<-'ANE'
pelago_biom$sampling_type<-"pelago_bio"
pelago_biom$vessel<-'1.RSH'
pelago_biom<-na.omit(pelago_biom)
pelago_biom$year<-pelago_biom$year*(pelago_biom$month>0)+(pelago_biom$year-1)*(pelago_biom$month<=0)
pelago_biom$month<-pelago_biom$month*(pelago_biom$month>0)+11*(pelago_biom$month<=0)


ecocadiz_bio<-readWorksheetFromFile("/home/marga/GADGET/DATOS/Acústica en 9aS_TallasyEdades.xls", sheet = "BiomasaEsp", 
                                    header = F, startCol = 3, 
                                    startRow = 35, endCol = 13, 
                                    endRow = 35, useCachedValues=TRUE)
ecocadiz_bio<-t(ecocadiz_bio)
ecocadiz_biom<-data.frame(cbind(2004:2014,ecocadiz_bio*1000,c(rep(6,3),rep(7,6),8,7)))
names(ecocadiz_biom)<-c("year","count","month")
ecoca_age0<-left_join(ecocadiz_biom,B0)%>%mutate(count=count-total)%>%select(year,count,month)

ecocadiz_biom<-ecoca_age0


ecocadiz_biom$areacell<-"IXa"
ecocadiz_biom$species<-'ANE'
ecocadiz_biom$sampling_type<-"ecocadiz_bio"
ecocadiz_biom$vessel<-"1.RSH"
ecocadiz_biom<-rbind(ecocadiz_biom,B)
ecocadiz_biom<-na.omit(ecocadiz_biom)
ecocadiz_biom$month<-ecocadiz_biom$month-3



g<-factor(sar$numorbio)
#pelagosep<-split(pelago,g)
#ecocadizsep<-split(ecocadiz,g)
sarsep<-split(sar,g)

# ecocadiz0813<-read.xls("/home/marga/GADGET/DATOS/ecocadiz_tableincolumn.xls")
# order_ecocadiz<-matrix(as.numeric(as.character(ecocadiz0813$table_in_column)), nrow=25, ncol=9,byrow=T)
# order_ecocadiz<-cbind(order_ecocadiz,rowSums(order_ecocadiz[,2:6]))
# def_ecocadiz0813<-order_ecocadiz[,c(1,10)]

# order_ecocadiz<-matrix(ecocadiz0813$table_in_column, nrow=25, ncol=9,byrow=T)
# def_ecocadiz0813<-order_ecocadiz[,c(1,8)]
# def_ecocadiz0813<-data.frame(def_ecocadiz0813)
# names(def_ecocadiz0813)<-c("length","count")
# def_ecocadiz0813$year<-2013
# def_ecocadiz0813$month<-8#5#Depending on how time is defined 8 is the real
# def_ecocadiz0813$length<-seq(6,18,0.5)

# mfdb_import_area(mdb, data.frame(
#   id = 1:3,
#   name = c("Tarifa","Algeciras","Morocco"),
#   ## area size is 
#   size = 1) )

#area<-data.frame(id = c(1), name=c("IXaS_cadiz"), size =c(13000))
# mfdb_import_temperature(mdb, data.frame(
#   year = rep(c(1998, 1999), each = 12),
#   month = c(1:12, 1:12),
#   areacell = c(rep('45G01', times = 24)),
#   temperature = c(0.5, 1.2, 2.4, 3.5, 4.6, 5.7, 6.1, 7.4, 8.9, 10, 11, 12, 25:36)))


mfdb_import_area(mdb_compi, data.frame(id = c(1), name=c("IXa"), size =c(13000))) #division=c('alg','cad'),
#mfdb_import_division(mdb_comp, list(divA = c("IXa", "IXa_a"), divB = c('IXa')))


#temperature<-temperature[,-1]
mfdb_import_temperature(mdb_compi, temperature)

FOO<-list()
FOOG<-list()



i<-1988
filed<-paste("/home/marga/GADGET/DATOS/Juan_data/Datos_",i,"_anchovy.xlsx",sep = "")
FOO[[(i-1987)]]<-readWorksheet(loadWorkbook(filed), sheet="Hoja1")
FOOG[[(i-1987)]]<-readWorksheet(loadWorkbook(filed), sheet="Hoja2")
FOO[[(i-1987)]]<-cbind(year=i, FOO[[(i-1987)]])
names( FOO[[(i-1987)]])<-c(names(FOO[[1]]))
catch_at_length<-FOO[[1]]



for(i in 1989:2013) 
{ 
  filed<-paste("/home/marga/GADGET/DATOS/Juan_data/Datos_",i,"_anchovy.xlsx",sep = "")
  FOO[[(i-1987)]]<-readWorksheet(loadWorkbook(filed), sheet="Hoja1")
  FOOG[[(i-1987)]]<-readWorksheet(loadWorkbook(filed), sheet="Hoja2")
  FOO[[(i-1987)]]<-cbind(year=i, FOO[[(i-1987)]])
  names( FOO[[(i-1987)]])<-c(names(FOO[[1]]))
  catch_at_length<-rbind(catch_at_length,FOO[[i-1987]])
}  
catch_at_length[is.na(catch_at_length)]<-0

#names(catch_at_length)<-c("year","length","Col2","count","count","count","count","Total")
#Primero organizar año, edad, número
catchldist14<-readWorksheet(loadWorkbook("/home/marga/GADGET/DATOS/lengthdist1415.xls"), sheet="Sheet2")
catchldist14<-matrix(as.numeric(as.character(catchldist14$X2014)),  ncol=6,byrow=T)
catchldist15<-readWorksheet(loadWorkbook("/home/marga/GADGET/DATOS/lengthdist1415.xls"), sheet="Sheet1")
catchldist16<-readWorksheet(loadWorkbook("/home/marga/GADGET/DATOS/lengthdist1415.xls"), sheet="Sheet3")
catchldist15<-matrix(as.numeric(as.character(catchldist15$X2015)),  ncol=6,byrow=T)
catchldist16<-matrix(as.numeric(as.character(catchldist16$X2016)),  ncol=6,byrow=T)

catchldist15<-cbind(catchldist15,year=2015)
catchldist14<-cbind(catchldist14,year=2014)
catchldist16<-cbind(catchldist16,year=2016)

catchldist15<-data.frame(catchldist15)
catchldist14<-data.frame(catchldist14)
catchldist16<-data.frame(catchldist16)

names(catch_at_length)<-c("year","length","Col2","Q1","Q2","Q3","Q4","Total")
names(catchldist14)<-c("length","Q1","Q2","Q3","Q4","Total","year")
names(catchldist15)<-c("length","Q1","Q2","Q3","Q4","Total","year")
names(catchldist16)<-c("length","Q1","Q2","Q3","Q4","Total","year")

catchldist14<-cbind(catchldist14[,7],catchldist14[,1],Col2=NA,catchldist14[,2:6])
catchldist15<-cbind(catchldist15[,7],catchldist15[,1],Col2=NA,catchldist15[,2:6])
catchldist16<-cbind(catchldist16[,7],catchldist16[,1],Col2=NA,catchldist16[,2:6])

names(catchldist14)<-c("year","length","Col2","Q1","Q2","Q3","Q4","Total")
names(catchldist15)<-c("year","length","Col2","Q1","Q2","Q3","Q4","Total")
names(catchldist16)<-c("year","length","Col2","Q1","Q2","Q3","Q4","Total")




catch_at_length<-rbind(catch_at_length, catchldist14, catchldist15,catchldist16)

fleet.seinepre<-plyr::ddply(catch_at_length,~year,summarise,Total_catches1=sum(Q1),Total_catches2=sum(Q2), Total_catches3=sum(Q3), Total_catches4=sum(Q4))  #suma sobre la longitud






#Suma por años las longitudes
#fleet.seinepre<-ddply(catch_at_length,~year,summarise,Total_catches1=sum(X1st.Q),Total_catches2=sum(X2nd.Q), Total_catches3=sum(X3rd.Q), Total_catches4=sum(X4th.Q))                                                                              
# #catches20181cakg<-readWorksheetFromFile("/home/marga/GADGET/DATOS/Taledas_allfleets_1988_2016/Ane279a_9aS_Prov Landings Jan-June 2018.xlsx", sheet="Hoja2",
#                                         header = F, startCol = 7, 
#                                         startRow = 19, endCol = 7, 
#                                         endRow = 19, useCachedValues=TRUE)
# #catches20182cakgpre<-readWorksheetFromFile("/home/marga/GADGET/DATOS/Taledas_allfleets_1988_2016/Ane279a_9aS_Prov Landings Jan-June 2018.xlsx", sheet="Hoja2",
#                                         header = F, startCol = 7, 
#                                         startRow = 22, endCol = 7, 
#                                         endRow = 22, useCachedValues=TRUE)
# catches20181alton<-readWorksheetFromFile("/home/marga/GADGET/DATOS/Algarve/PNAB_biqueirao_2018.xlsx", sheet="Sheet1",
#                                          header = F, startCol = 5, 
#                                          startRow = 7, endCol = 5, 
#                                          endRow = 7, useCachedValues=TRUE)
# 
# catches20182altonpre<-readWorksheetFromFile("/home/marga/GADGET/DATOS/Algarve/PNAB_biqueirao_vendas-diarias_2018.xls", sheet="Sheet1",
#                                          header = F, startCol = 13, 
#                                          startRow = 14, endCol = 13, 
#                                          endRow = 14, useCachedValues=TRUE)

#bio2018*Num2017/bio2017
#Algarve en kg más 1209 A 23 de JUnio, Cadiz
#ERROR
#Numb20181=(catches20181cakg[1,1]+catches20181alton[1,1]*1000)*(CatchesAllFleetsPTSP$ALL[CatchesAllFleetsPTSP$YEAR==2017 & CatchesAllFleetsPTSP$SEASON==1])/((BIOMTOT$TONPT+BIOMTOT$TONSP)[BIOMTOT$YEAR==2017 & BIOMTOT$SEASON==1])

#Numb20182=(catches20182cakgpre[1,1])*(CatchesAllFleetsPTSP$NUMBERSP[CatchesAllFleetsPTSP$YEAR==2017 & CatchesAllFleetsPTSP$SEASON==2])/((BIOMTOT$TONSP)[BIOMTOT$YEAR==2017 & BIOMTOT$SEASON==2])

# catches20191cakg<-readWorksheetFromFile("/home/marga/GADGET/DATOS/Taledas_allfleets_1988_2016/Ane279a_9aS_Prov Landings Jan-June 2019.xlsx", sheet="Hoja2",
#                                         header = F, startCol = 7, 
#                                         startRow = 19, endCol = 7, 
#                                         endRow = 19, useCachedValues=TRUE)
# catches20192cakgpre<-readWorksheetFromFile("/home/marga/GADGET/DATOS/Taledas_allfleets_1988_2016/Ane279a_9aS_Prov Landings Jan-June 2019.xlsx", sheet="Hoja2",
#                                            header = F, startCol = 7, 
#                                            startRow = 22, endCol = 7, 
#                                            endRow = 22, useCachedValues=TRUE)
# catches20191alton<-0 #Catches algarve
# catches20192altonpre<-0
# #bio2018*Num2017/bio2017
# #Algarve en kg más 1209 A 23 de JUnio, Cadiz
# #ERROR
# #Ojo que como no hay Algarve, mejor NUm 2018 de Cadiz y bio 2018 de cadiz
# Numb20191=(catches20191cakg[1,1])*(CatchesAllFleetsPTSP$NUMBERSP[CatchesAllFleetsPTSP$YEAR==2018 & CatchesAllFleetsPTSP$SEASON==1])/((BIOMTOT$TONSP)[BIOMTOT$YEAR==2018 & BIOMTOT$SEASON==1]*1000)
# 
# Numb20192=(catches20192cakgpre[1,1])*(CatchesAllFleetsPTSP$NUMBERSP[CatchesAllFleetsPTSP$YEAR==2018 & CatchesAllFleetsPTSP$SEASON==2])/((BIOMTOT$TONSP)[BIOMTOT$YEAR==2018 & BIOMTOT$SEASON==2]*1000)

# catches20201cakg<-readWorksheetFromFile("/home/marga/GADGET/DATOS/Taledas_allfleets_1988_2016/Ane279a_9aS_Prov Landings Jan-June 2020.xlsx", sheet="landings2020",
#                                          header = F, startCol = 10,
#                                          startRow = 18, endCol = 10,
#                                          endRow = 18, useCachedValues=TRUE)
# catches20202cakgpre<-readWorksheetFromFile("/home/marga/GADGET/DATOS/Taledas_allfleets_1988_2016/Ane279a_9aS_Prov Landings Jan-June 2020.xlsx", sheet="landings2020",
#                                          header = F, startCol = 10,
#                                          startRow = 19, endCol = 10,
#                                          endRow = 19, useCachedValues=TRUE)
#  catches20201alton<-1.6#readWorksheetFromFile("/home/marga/GADGET/DATOS/Algarve/PNAB_biqueirao_2018.xlsx", sheet="Sheet1",
#                                           #header = F, startCol = 5,
#                                          # startRow = 7, endCol = 5,
#                                           #endRow = 7, useCachedValues=TRUE)
# 
#  catches20202altonpre<-0.2#readWorksheetFromFile("/home/marga/GADGET/DATOS/Algarve/PNAB_biqueirao_vendas-diarias_2018.xls", sheet="Sheet1",
#                                          # header = F, startCol = 13,
#                                          # startRow = 14, endCol = 13,
#                                          # endRow = 14, useCachedValues=TRUE)
catches20211cakg<-readWorksheetFromFile("/home/marga/GADGET/DATOS/Taledas_allfleets_1988_2016/Ane279a_9aS_Prov Landings Jan-June 2021.xls", sheet="Sheet1",
                                        header = F, startCol = 7,
                                        startRow = 20, endCol = 7,
                                        endRow = 20, useCachedValues=TRUE)
catches20212cakgpre<-readWorksheetFromFile("/home/marga/GADGET/DATOS/Taledas_allfleets_1988_2016/Ane279a_9aS_Prov Landings Jan-June 2021.xls", sheet="Sheet1",
                                           header = F, startCol = 8,
                                           startRow = 20, endCol = 8,
                                           endRow = 20, useCachedValues=TRUE)
#revisar bien estaba bien pero me lié porque esta es la del 2
catches20212cakgpre<-catches20212cakgpre+0.37*(catches20211cakg+catches20212cakgpre)#sacado de historico-capturas
catches20211alton<-1.669
#ver ANE_biqueirão_01012021-30042021 en DATOS/Algarve

#readWorksheetFromFile("/home/marga/GADGET/DATOS/Algarve/PNAB_biqueirao_2018.xlsx", sheet="Sheet1",
#header = F, startCol = 5,
# startRow = 7, endCol = 5,
#endRow = 7, useCachedValues=TRUE)

catches20212altonpre<-0.059#readWorksheetFromFile("/home/marga/GADGET/DATOS/Algarve/PNAB_biqueirao_vendas-diarias_2018.xls", sheet="Sheet1",
# header = F, startCol = 13,
# startRow = 14, endCol = 13,
# endRow = 14, useCachedValues=TRUE)

#bio2018*Num2017/bio2017
#Algarve en kg más 1209 A 23 de JUnio, Cadiz
#ERROR
#Numb20181=(catches20181cakg[1,1]+catches20181alton[1,1]*1000)*(CatchesAllFleetsPTSP$ALL[CatchesAllFleetsPTSP$YEAR==2017 & CatchesAllFleetsPTSP$SEASON==1])/((BIOMTOT$TONPT+BIOMTOT$TONSP)[BIOMTOT$YEAR==2017 & BIOMTOT$SEASON==1])
 Numb20211=(catches20211cakg[1,1]+catches20211alton*1000)*(CatchesAllFleetsPTSP$ALL[CatchesAllFleetsPTSP$YEAR==2020 & CatchesAllFleetsPTSP$SEASON==1])/((BIOMTOT$TONPT+BIOMTOT$TONSP)[BIOMTOT$YEAR==2020 & BIOMTOT$SEASON==1]*1000)

#Numb20182=(catches20182cakgpre[1,1])*(CatchesAllFleetsPTSP$NUMBERSP[CatchesAllFleetsPTSP$YEAR==2017 & CatchesAllFleetsPTSP$SEASON==2])/((BIOMTOT$TONSP)[BIOMTOT$YEAR==2017 & BIOMTOT$SEASON==2])
 Numb20212=(catches20212cakgpre[1,1]+catches20212altonpre*1000)*(CatchesAllFleetsPTSP$ALL[CatchesAllFleetsPTSP$YEAR==2020 & CatchesAllFleetsPTSP$SEASON==2])/((BIOMTOT$TONPT+BIOMTOT$TONSP)[BIOMTOT$YEAR==2020 & BIOMTOT$SEASON==2]*1000)
BIOMTOT$ALL<-BIOMTOT$TONPT+BIOMTOT$TONSP
 BIOMTOT<-add_row(BIOMTOT, YEAR=2021, SEASON=1:2, TONPT=c(catches20211alton,catches20212altonpre),TONSP=c(catches20211cakg[1,1]*0.001,catches20212cakgpre[1,1]*0.001),ALL=c(catches20211alton+catches20211cakg[1,1]*0.001,catches20212altonpre+catches20212cakgpre[1,1]*0.001)) #sacado de Ane279a_9aS_Prov Landings Jan-June 2019.xls porque para Portugal las capturas son cero
 
 BIOMTOTnewyear<-BIOMTOT %>% mutate(newyear=c(1988,1988,rep(1989:2020,each=4))) %>%group_by(newyear)%>%summarise(catonsur=sum(ALL)) #cuidado aquí el último año es el año anterior al assessment porque va en management calendar
   
   
 discardsbyquarter<-readWorksheetFromFile("/home/marga/GADGET/DATOS/Taledas_allfleets_1988_2016/Landings and Discards_9aN and 9a S_2014 on.xlsx", sheet="South_9aS",
                                          header = T, startCol = 9, 
                                          startRow = 4, endCol = 14, 
                                          endRow = 33, useCachedValues=TRUE)
 names(discardsbyquarter)<-c("year","1","2","3","4")
 DISCARDS<-melt(discardsbyquarter,id="year")%>%arrange(year)%>%mutate(newyear=c(1988,1988,rep(1989:2016,each=4),2017,2017))%>%group_by(newyear)%>%summarise(newyeardiscardsouth=sum(value))%>%mutate(year=newyear)
 DISCARDS<-add_row(DISCARDS, newyear=2018, newyeardiscardsouth=151, year=2018) #sacado de Landings and Discards_9aN and 9a S_2014 on_2018.xlsx
 DISCARDS<-add_row(DISCARDS, newyear=2019, newyeardiscardsouth=87, year=2019) #sacado de Landings and Discards_9aN and 9a S_2014 on_2019.xlsx #corregidas también las del 2018
 
 DISCARDS$newyeardiscardsouth[DISCARDS$year==2017]<-186

#save(BIOMTOTnewyear,DISCARDS,file="/home/marga/GADGET/Assessment/Assessment2020_pandemia/BIOMTOTnewyeardiscards.Rdata")
save(BIOMTOTnewyear,DISCARDS,file="BIOMTOTnewyeardiscards.Rdata")















names(fleet.seinepre)<-c("year","count","count","count","count")
fleet.seinepre[c(2,3,4,5)]<-fleet.seinepre[c(2,3,4,5)]*1000
fleet.seine<-rbind(fleet.seinepre[c(1,2)],fleet.seinepre[c(1,3)],fleet.seinepre[c(1,4)],fleet.seinepre[c(1,5)])
fleet.seine$month<-rep(seq(3,12,3),times=1, each=nrow(fleet.seinepre))#rep(c(12,3,6,9),times=1, each=26)#rep(seq(3,12,3),times=1, each=26)
fleet.seine$areacell<-"IXa"
fleet.seine$species<-'ANE'
fleet.seine$vessel<-"2.CQT"
fleet.seine$sampling_type<-"SEA"

fleet.allptsp<-CatchesAllFleetsPTSP%>%mutate(month=SEASON*3)%>%ungroup()%>%select(year=YEAR,month,count=ALL)
#fleet.allptsp<-add_row(fleet.allptsp,year=2018,month=c(3,6),count=c(Numb20181,Numb20182))
#fleet.allptsp<-add_row(fleet.allptsp,year=2019,month=c(3,6),count=c(Numb20191,Numb20192))
#fleet.allptsp<-add_row(fleet.allptsp,year=2020,month=c(3,6),count=c(Numb20201,Numb20202))
fleet.allptsp<-add_row(fleet.allptsp,year=2021,month=c(3,6),count=c(Numb20211,Numb20212))
fleet.allptsp$areacell<-"IXa"
fleet.allptsp$species<-'ANE'
fleet.allptsp$vessel<-"2.CDA"
fleet.allptsp$sampling_type<-"SEAS2"


#ARSA ALK
mybiglistII <- list()
for (i in c(1993,1997:2016)){
  name<-paste("ARSA",i,sep="")
  a<-readWorksheetFromFile(paste("/home/marga/GADGET/DATOS/ARSA/ARSA_NOV_ALK_",i,".xlsx",sep=""), sheet = "4Q", 
                           header = TRUE, startCol = 11, 
                           startRow = 5, endCol = 15, 
                           endRow = 37, useCachedValues=TRUE)
  names(a)<-c("length","0", "1", "2", "3")
  a$year<-i
  a$month<-11
  a$type<-"arsa_comp"
  
  a[is.na(a)] <- 0
  
  mybiglistII[[name]] <- a
}

dfII<-plyr::ldply(mybiglistII,data.frame)
names(dfII)<-c(".id",    "length", "0", "1",   "2",     "3",     "year",   "month",  "type")
arsa_comp<-dfII
arsa_def<-melt(arsa_comp, id=c(".id","length","year",   "month",  "type" )) 

names(arsa_def)<-c(".id","length","year",   "month",  "sampling_type","age","count")
arsa_def$areacell<-"IXa"
arsa_def$species<-'ANE'
arsa.ldist<-arsa_def[,2:9]

#arsa.ldist sin age
mybiglistII <- list()
for (i in c(1993,1997:2016)){
  name<-paste("ARSALD",i,sep="")
  a<-readWorksheetFromFile(paste("/home/marga/GADGET/DATOS/ARSA/ARSA_NOV_ALK_",i,".xlsx",sep=""), sheet = "4Q", 
                           header = FALSE, startCol = 8, 
                           startRow = 6, endCol = 9, 
                           endRow = 37, useCachedValues=TRUE)
  names(a)<-c("length","count")
  a$year<-i
  a$month<-11
  a$type<-"arsa_compld"
  
  a[is.na(a)] <- 0
  
  mybiglistII[[name]] <- a
}

dfII<-plyr::ldply(mybiglistII,data.frame)
names(dfII)<-c(".id",    "length", "count",     "year",   "month",  "sampling_type")
arsa_compld<-dfII
#arsa_def<-melt(arsa_comp, id=c(".id","length","year",   "month",  "type" )) 

#names(arsa_def)<-c(".id","length","year",   "month",  "sampling_type","age","count")
arsa_compld$areacell<-"IXa"
arsa_compld$species<-'ANE'
arsa.ldistnoage<-arsa_compld[,2:8]




arsa_bio<-readWorksheetFromFile("/home/marga/GADGET/DATOS/ARSA/WKPELA2018_ane.27.9a_ES_SURVEY_ARSA-Novseries.xlsx", sheet = "Absolute Indices' estimates", 
                                  header = F, startCol = 15, 
                                  startRow = 2, endCol = 15, 
                                  endRow = 22, useCachedValues=TRUE)
arsa_bio<-arsa_bio*1000 #Para Kilograms
ARSA_biom<-data.frame(cbind(year=c(1993,1997:2016), count=arsa_bio, month=11))
names(ARSA_biom)<-c("year", "count", "month")
ARSA_biom$areacell<-"IXa"
ARSA_biom$species<-'ANE'
ARSA_biom$sampling_type<-"arsa_bio"
ARSA_biom$vessel<-'1.RSH'


#bocadeva

bocadeva_bio<-readWorksheetFromFile("/home/marga/GADGET/DATOS/DEPM/DEPM_SSB_estimates.xlsx", sheet="Sheet1",
                                header = F, startCol = 1, 
                                startRow = 2, endCol = 2, 
                                endRow = 6, useCachedValues=TRUE)
bocadeva_bio[,2]<-bocadeva_bio[,2]*1000 #Para Kilograms
bocadeva_biom<-mutate(bocadeva_bio,month=c(6,6,7,7,7))
names(bocadeva_biom)<-c("year", "count", "month")
bocadeva_biom$areacell<-"IXa"
bocadeva_biom$species<-'ANE'
bocadeva_biom$sampling_type<-"bocadeva_bio"
bocadeva_biom$vessel<-'1.RSH'
bocadeva_biom$month<-bocadeva_biom$month-3

#length-age
mybiglistII <- list()
mybiglistIV <- list()
for (i in 1989:2013){
  #i<-1989
  for (j in 1:4){
   # j<-1
    name<-paste("ALKcatches",i,j,sep="")
    name1<-paste("LDcatches",i,j,sep="")
    a<-readWorksheetFromFile(paste("/home/marga/GADGET/DATOS/Taledas_allfleets_1988_2016/BOQUERON_ALK_",i,".xls",sep=""), sheet = paste(j,"Q",sep=""), header = T, startCol = 1, 
                                startRow = 5, endCol = 5, 
                                endRow = 37, useCachedValues=T)
    ldist_cat<- readWorksheetFromFile(paste("/home/marga/GADGET/DATOS/Taledas_allfleets_1988_2016/BOQUERON_ALK_",i,".xls",sep=""), sheet = paste(j,"Q",sep=""), header = T, startCol = 8, 
                                      startRow = 5, endCol = 9, 
                                      endRow = 37, useCachedValues=T)
    
    names(a)<-c("length","0", "1", "2", "3")
    a$year<-i
    a$month<-3*(j-1)+1
    a$type<-"alkcatches_comp"
    names(ldist_cat)<-c("length","count")
    ldist_cat$year<-i
    ldist_cat$month<-3*(j-1)+1
    
    
    
    a[is.na(a)] <- 0
    
    mybiglistII[[name]] <- a
    ldist_cat[is.na(ldist_cat)]<-0
    mybiglistIV[[name1]] <- ldist_cat
  }}
  #Cambio 2018 por 2019
for (i in 2014:2020){
  for (j in 1:4){
    name<-paste("ALKcatches",i,j,sep="")
    name1<-paste("LDcatches",i,j,sep="")
    a<-readWorksheetFromFile(paste("/home/marga/GADGET/DATOS/Taledas_allfleets_1988_2016/BOQUERON_ALK_",i,".xls",sep=""), sheet = paste(j,"Q",sep=""), header = T, startCol = 1, 
                             startRow = 5, endCol = 5, 
                             endRow = 39, useCachedValues=T)
   ldist_cat<- readWorksheetFromFile(paste("/home/marga/GADGET/DATOS/Taledas_allfleets_1988_2016/BOQUERON_ALK_",i,".xls",sep=""), sheet = paste(j,"Q",sep=""), header = T, startCol = 8, 
                                     startRow = 5, endCol = 9, 
                                     endRow = 39, useCachedValues=T)
   names(ldist_cat)<-c("length","count")
    names(a)<-c("length","0", "1", "2", "3")
    ldist_cat$year<-i
    a$year<-i
    a$month<-3*(j-1)+1
    ldist_cat$month<-3*(j-1)+1
    a$type<-"alkcatches_comp"
    
    a[is.na(a)] <- 0
    ldist_cat[is.na(ldist_cat)]<-0
    mybiglistII[[name]] <- a
    mybiglistIV[[name1]] <- ldist_cat
  }}

 dfIII<-plyr::ldply(mybiglistII,data.frame)
 dfIV<-plyr::ldply(mybiglistIV,data.frame)
  names(dfIII)<-c(".id",    "length", "0", "1",   "2",     "3",     "year",   "month",  "type")
 ALKcatches_comp<-dfIII
 ALKcatches_def<-melt(ALKcatches_comp, id=c(".id","length","year",   "month",  "type" )) 
  
  names(ALKcatches_def)<-c(".id","length","year",   "month",  "sampling_type","age","count") 
  ALKcatches_def$areacell<-"IXa"
  ALKcatches_def$species<-'ANE'
  ALKcatches.ldist<-ALKcatches_def[,2:9]
 # ALKcatches.ldist$age<-as.numeric(as.character(ALKcatches.ldist$age))
  
    
    
       



names(catch_at_length)<-c("year","length","Col2","count","count","count","count","Total")
seine.ldist <- rbind(catch_at_length[c(1,2,4)],catch_at_length[c(1:2,5)],catch_at_length[c(1:2,6)],catch_at_length[c(1:2,7)])
seine.ldist[3]<-seine.ldist[3]*1000
#rep(x, times = 1, length.out = NA, each = 1)
#arreglar!!!
seine.ldist$month<-rep(seq(3,12,3),times=1, each=nrow(catch_at_length))#rep(c(12,3,6,9),times=1, each=988)#rep(seq(3,12,3),times=1, each=988)

seine.ldist<-rbind(seine.ldist%>%filter(year<2014),dfIV%>%filter(year>=2014)%>% select(year,length,count,month))
seine.ldist2<-dfIV%>%mutate(length2=length-0.25,month2=month+2)%>% select(year,length=length2,count2=count,month=month2)
SEINE.ldist<-left_join(seine.ldist,seine.ldist2)
  #left_join(seine.ldist%>%filter(year>2014),seine.ldist2%>%filter(year>2014)) #seine.ldist%>%mutate(count2=seine.ldist2$count)

# ggplot(SEINE.ldist,aes(length,count)) +
#   geom_line(aes(length,count2), col='gray') +
#   facet_wrap(~year+month) + theme_bw() + geom_line() +
#   



# ldist20171<-seine.ldist%>%filter(year==2017,month<4)
# ldist20172<-seine.ldist%>%filter(year==2017,month==4)
# ldist20171p<-ldist20171%>%mutate(countperc=count/max(ldist20171$count))
# ldist20172p<-ldist20172%>%mutate(countperc=count/max(ldist20172$count))



seine.ldist$areacell<-"IXa"
seine.ldist$species<-'ANE'
seine.ldist$sampling_type<-'SEA'




# ecocadiz0813.ldist<-def_ecocadiz0813
# ecocadiz0813.ldist$areacell<-"IXa"
# ecocadiz0813.ldist$species<-'ANE'
# ecocadiz0813.ldist$sampling_type<-'ecocadiz0813'


catchespre<-subset(catch_age,AGE==c(0,1,2,3), select=c(1:6))
names(catchespre)<-c("year","age","count","count","count","count")
catches.agedist<-rbind(catchespre[c(1,2,3)],catchespre[c(1,2,4)],catchespre[c(1,2,5)],catchespre[c(1,2,6)])
catches.agedist[3]<-catches.agedist[3]*1000
Nyears<-length(unique(catches.agedist$year)) #number of years
catches.agedist$month<-rep(seq(3,12,3),times=1, each=Nyears*4)#rep(c(12,3,6,9),times=1, each=26*4)#rep(seq(3,12,3),times=1, each=26*4)#26 años, 4 edades
catches.agedist$species<-'ANE'
catches.agedist$areacell<-"IXa"
catches.agedist$sampling_type<-'SEA'
# comm.ldist <- merge(comm.ldist, 
#                     comm.stations[c('synis.id','ar','man','lat','lon')])
# comm.ldist$areacell <- d2sr(comm.ldist$lat,-comm.ldist$lon)
# names(comm.ldist) <- c('sample.id','species','length','count','sex',
#                        'maturity','year','month','lat','lon','areacell')
# comm.ldist$species <- 'COD' 

length_agepre<-subset(length_age,age==0|age==1|age==2|age==3) #quitando l????nea de totales
names(length_agepre)<-c("year","age","length","length","length","length")
length.at.age<-rbind(length_agepre[c(1,2,3)],length_agepre[c(1,2,4)],length_agepre[c(1,2,5)],length_agepre[c(1,2,6)])
length.at.age$month<-rep(seq(3,12,3),times=1, each=26*4)#rep(c(12,3,6,9),times=1, each=26*4)#changing the quarter
length.at.age<-na.omit(length.at.age)
length.at.age$sampling_type<-'SEA'
length.at.age$species<-'ANE'
length.at.age$areacell<-"IXa"

weight_agepre<-subset(weight_age,age==0|age==1|age==2|age==3) #quitando l????nea de totales
names(weight_agepre)<-c("year","age","weight","weight","weight","weight")
weight.at.age<-rbind(weight_agepre[c(1,2,3)],weight_agepre[c(1,2,4)],weight_agepre[c(1,2,5)],weight_agepre[c(1,2,6)])
weight.at.age$month<-rep(seq(3,12,3),times=1, each=26*4)#rep(c(12,3,6,9),times=1, each=26*4)#changing the quarter
weight.at.age<-na.omit(weight.at.age)
weight.at.age$sampling_type<-'SEA'
weight.at.age$species<-'ANE'
weight.at.age$areacell<-"IXa"



# weight_agepre<-subset(weight_age,AGE==0|AGE==1|AGE==2|AGE==3) #quitando l????nea de totales
# names(weight_agepre)<-c("year","age","weight","weight","weight","weight")
# weight.at.age<-rbind(weight_agepre[c(1,2,3)],weight_agepre[c(1,2,4)],weight_agepre[c(1,2,5)],weight_agepre[c(1,2,6)])
# weight.at.age$month<-rep(c(12,3,6,9),times=1, each=26*4)
# #Remove rows with empty spaces
# blank2na <- function(x){ 
#   z <- gsub("\\s+", "", x)  #make sure it's "" and not " " etc
#   x[z==""] <- NA 
#   return(x)
# }
# 
# #apply that function
# weight.at.age<-data.frame(sapply(weight.at.age,  blank2na))
# 
# #weight.at.age<-na.omit(weight.at.age)
# weight.at.age$sampling_type<-'SEA'
# weight.at.age$species<-'ANE'
# weight.at.age$areacell<-"IXa"


# pelagonumber.survey<-pelagosep[[2]][c(1,2,5)]
# #permutation of time
# #pelagonumber.survey[2]<-(pelagonumber.survey[2]+9)%%12
# #pelagonumber.survey$month[pelagonumber.survey$month==0]<-12
# pelagonumber.survey[3]<-pelagonumber.survey[3]*1000000#units in millions
# #pelagonumber.survey[is.na(pelagonumber.survey)]<-0 mejor omitir filas con NA que trtarlas como ceros
# pelagonumber.survey<-na.omit(pelagonumber.survey)
# names(pelagonumber.survey)<-c('year','month','count')
# pelagonumber.survey$species<-'ANE'
# pelagonumber.survey$areacell<-"IXa"
# pelagonumber.survey$sampling_type = 'pelago'
# #pelagonumber.survey$survey = 'pelago'
# 
# ecocadiz.survey<-ecocadizsep[[2]][c(1,2,5)]
# #ecocadiz.survey[2]<-(ecocadiz.survey[2]+9)%%12
# #ecocadiz.survey$month[ecocadiz.survey$month==0]<-12
# ecocadiz.survey[3]<-ecocadiz.survey[3]*1000000
# #ecocadiz.survey[is.na(ecocadiz.survey)]<-0
# ecocadiz.survey<-na.omit(ecocadiz.survey)
# names(ecocadiz.survey)<-c('year','month','count')
# ecocadiz.survey$species<-'ANE'
# ecocadiz.survey$areacell<-"IXa"
# ecocadiz.survey$sampling_type = 'ecocadiz'

#1 para biomasa 2 para n?meros
#sarnumber.survey<-sarsep[[2]][c(1,2,5)]

#sarnumber.survey<-sarsep[[1]][c(1,2,5)] #BIOMASA
sarnumber.survey_pre<-sarsep[[1]][c(1,2,4,5)] #BIOMASA #incluyendo la 4 incluyo Portugal, el último dato de 2012 es de la ecocadiz reclutas
sarnumber.survey<-cbind(sarnumber.survey_pre[c(1,2)],rowSums(sarnumber.survey_pre[c(3,4)], na.rm=T))

#sarnumber.survey[2]<-(sarnumber.survey[2]+9)%%12
#sarnumber.survey$month[sarnumber.survey$month==0]<-12
sarnumber.survey<-na.omit(sarnumber.survey)
#sarnumber.survey[is.na(sarnumber.survey)]<-0
#sarnumber.survey[3]<-sarnumber.survey[3]*1000000 #Para pasar de millones a individuos hay que multiplicar por 1000000
sarnumber.survey[3]<-sarnumber.survey[3]*1000 #Para pasar de toneladas a kilos hay que multiplicar por 1000
sarnumber.survey<-sarnumber.survey[-5,]#la fila 5 es de ecocadiz reclutas
names(sarnumber.survey)<-c('year','month','count')
sarnumber.survey$species<-'ANE'
sarnumber.survey$areacell<-"IXa"
sarnumber.survey$sampling_type<-'sar_bio'
sarnumber.survey$vessel<-'1.RSH'


######################
#IXaGoC y IXaAlg en biomasa
#IXaGoC
seine_bio<-readWorksheetFromFile("/home/marga/GADGET/DATOS/ane 27.9a_Catches by Subdivision.xlsx", sheet = "Quarterly Catches", 
                                    header = F, startCol = 30, 
                                    startRow = 7, endCol = 34, 
                                    endRow = 34, useCachedValues=TRUE)
names(seine_bio)<-c("year","count","count","count","count")
catches.seine_bio_GoC<-rbind(seine_bio[c(1,2)], seine_bio[c(1,3)],seine_bio[c(1,4)],seine_bio[c(1,5)])
#catches.agedist<-rbind(catchespre[c(1,2,3)],catchespre[c(1,2,4)],catchespre[c(1,2,5)],catchespre[c(1,2,6)])
catches.seine_bio_GoC[2]<-catches.seine_bio_GoC[2]*1000 #tonnes to kg
dim(seine_bio)
catches.seine_bio_GoC$month<-rep(seq(3,12,3),times=1, each=dim(seine_bio)[1])#rep(c(12,3,6,9),times=1, each=26*4)#rep(seq(3,12,3),times=1, each=26*4)#26 años, 4 edades
catches.seine_bio_GoC$species<-'ANE'
catches.seine_bio_GoC$areacell<-"IXa"
catches.seine_bio_GoC$sampling_type<-'SEA'
catches.seine_bio_GoC$vessel<-"3.CQT"

port_bio<-readWorksheetFromFile("/home/marga/GADGET/DATOS/ane 27.9a_Catches by Subdivision.xlsx", sheet = "Quarterly Catches", 
                                header = F, startCol = 23, 
                                startRow = 10, endCol = 27, 
                                endRow = 34, useCachedValues=TRUE)
names(port_bio)<-c("year","count","count","count","count")
catches.port_bio_Alg<-rbind(port_bio[c(1,2)], port_bio[c(1,3)],port_bio[c(1,4)],port_bio[c(1,5)])
#catches.agedist<-rbind(catchespre[c(1,2,3)],catchespre[c(1,2,4)],catchespre[c(1,2,5)],catchespre[c(1,2,6)])
catches.port_bio_Alg[2]<-catches.port_bio_Alg[2]*1000 #tonnes to kg
dim(port_bio)
catches.port_bio_Alg$month<-rep(seq(3,12,3),times=1, each=dim(port_bio)[1])#rep(c(12,3,6,9),times=1, each=26*4)#rep(seq(3,12,3),times=1, each=26*4)#26 años, 4 edades
catches.port_bio_Alg$species<-'ANE'
catches.port_bio_Alg$areacell<-"IXa"
catches.port_bio_Alg$sampling_type<-'SEA'
catches.port_bio_Alg$vessel<-"3.CDA"


mybiglist <- list()
for (i in c(2012,2014:2016)){
  name<-paste("Ecocadiz_rec",i,sep="")
  a<-readWorksheetFromFile(paste("/home/marga/GADGET/DATOS/ECOCADIZ-RECLUTAS/ALK_ECO-R_",i,".xls",sep=""), sheet = "ALK_GENERAL_BOQUERON", 
                           header = TRUE, startCol = 11, 
                           startRow = 7, endCol = 15, 
                           endRow = 36, useCachedValues=TRUE)
  b<-readWorksheetFromFile(paste("/home/marga/GADGET/DATOS/ECOCADIZ-RECLUTAS/ALK_ECO-R_",i,".xls",sep=""), sheet = "ALK_GENERAL_BOQUERON", 
                           header = F, startCol = 9, 
                           startRow = 3, endCol = 9, 
                           endRow = 3, useCachedValues=TRUE)
  names(a)<-c("length","0", "1", "2", "3")
  a$year<-i
  a$month<-10
  a$type<-"ecocadiz_rec_comp"
  a$total<-b[1,1]
  a[is.na(a)] <- 0
  
  mybiglist[[name]] <- a
}
mybiglist$Ecocadiz_rec2012$month<-11


df<-plyr::ldply(mybiglist,data.frame)
names(df)<-c(".id",    "length", "0", "1",   "2",     "3",     "year",   "month",  "type","total")
ecocadiz_rec_bio<-cbind(df[7],df[8],df[10])
names(ecocadiz_rec_bio)<-c("year","month","count")
ecocadiz_rec_bio$areacell<-"IXa"
ecocadiz_rec_bio$species<-'ANE'
ecocadiz_rec_bio$sampling_type<-"ecocadizrec_bio"
ecocadiz_rec_bio$vessel<-"1.RSH"
ecocadiz_rec_bio<-na.omit(ecocadiz_rec_bio)
ecocadiz_rec_bio<-unique(ecocadiz_rec_bio)





ecocadiz_rec_comp<-df[-10] #remove total

ecocadiz_rec_def<-melt(ecocadiz_rec_comp, id=c(".id","length","year",   "month",  "type" )) 

names(ecocadiz_rec_def)<-c(".id","length","year",   "month",  "sampling_type","age","count") 

ecocadiz_rec_def$areacell<-"IXa"
ecocadiz_rec_def$species<-'ANE'
ecocadiz_rec_def$count<-signif(ecocadiz_rec_def$count,2)
ecocadiz_rec_def$count<-ecocadiz_rec_def$count*1000 #para que quede en individuos
ecocadizrec.ldist<-ecocadiz_rec_def[,2:9]


areadef<-data.frame(name="IXa")
mfdb_import_area(mdb, areadef)
vesseldef<-data.frame(name=c("2.CDA","1.RSH"))
mfdb_import_vessel_taxonomy(mdb, vesseldef)
library(tidyverse)
library(gadget3)
defaults <- list(
  #area = mfdb::mfdb_group("IXa" = 1),
  timestep = mfdb::mfdb_timestep_quarterly,
  year = 1988:2021, species="ANE")

#areas <- structure(
 #seq_along(defaults$area),
  #names = names(defaults$area))

# Timekeeping for the model, i.e. how long we run for
time_actions <- list(
  g3a_time(start_year = min(defaults$year),
           end_year = max(defaults$year),
           defaults$timestep),
  list())

##### Configure stocks #########################################################

## stocks
anch <-
  g3_stock(c(species = 'anch'), lengthgroups = seq(3, 22, 0.5)) %>%
 #g3s_livesonareas(areas[c('IXa')]) %>%
  g3s_age(minage = 0, maxage = 3)

# ling_mat <-
#   g3_stock(c(species = 'ling', 'mat'), lengthgroups = seq(20, 156, 4)) %>%
#   g3s_livesonareas(areas[c('1')]) %>%
#   g3s_age(minage = 5, maxage = 15)

## Maximum number of length groups a stock can group within a time step (maxlengthgroupgrowth)
mlgg <- 5

############ Configure fleets ##################################################

## Survey(s)
seine <-
  g3_fleet('seine')# %>%
  #g3s_livesonareas(areas[c('IXa')])

## Commercial
ECO <-
  g3_fleet('ECO') #%>%
  #g3s_livesonareas(areas[c('IXa')])

PEL <-
  g3_fleet('PEL')# %>%
  #g3s_livesonareas(areas[c('IXa')])

# gil <-
#   g3_fleet('gil') %>%
#   g3s_livesonareas(areas[c('1')])
# 
# foreign <-
  # g3_fleet('foreign') %>%
  # g3s_livesonareas(areas[c('1')])






# mfdb_import_cs_taxonomy(mdb, 'index_type', data.frame(name = c(
#   "acoustic",
#   "effort",
#   NULL)))


# mfdb_import_sampling_type(mdb, data.frame(
#   id = 1:5,
#   name = c('SEA', 'pelago','ecocadiz', 'ecocadiz0813','sar'),
#   description = c('Sea sampling', 'pelago','ecocadiz', 'ecocadiz0813','sar')))
#
mfdb_import_sampling_type(mdb_compi, data.frame(
  id = 1:23,
  name = c('SEA', 'pelago','ecocadiz', 'ecocadiz0813','sar','pelago_comp','ecocadiz_comp','pelago_bio','ecocadiz_bio', 'sar_bio','ecocadizrec_bio','ecocadiz_rec_comp','bocadeva_bio','alkcatches_comp', 'arsa_comp','arsa_bio','SEAS','SEAS2','arsa_compld','ecocadiz_comp_ld','ecocadiz_comp_ald','pelago_comp_ld','pelago_comp_ald'),
  description = c('Sea sampling', 'pelago','ecocadiz', 'ecocadiz0813','sar','pelago_comp','ecocadiz_comp','pelago_bio','ecocadiz_bio','sar_bio','ecocadizrec_bio','ecocadiz_rec_comp','bocadeva_bio','alkcatches_comp', 'arsa_comp','arsa_bio','seas2','seas3','arsa_solo_length','ecocadiz_comp_ld','ecocadiz_comp_ald','pelago_comp_ld','pelago_comp_ald')))
mdb<-mdb_compi



mfdb:::mfdb_send(mdb, paste0("ALTER TABLE sample ALTER COLUMN count TYPE NUMERIC"))

mfdb_import_survey(mdb,
                   data_source = 'example-anchovy-seine.ldist',
                   seine.ldist)

#mfdb_import_survey(mdb,
#                  data_source = 'example-anchovy-ecocadiz0813.ldist',
#                 ecocadiz0813.ldist)
# mfdb_import_survey(mdb,
#                    data_source = 'example-anchovy-weight.at.age',
#                    weight.at.age)
# mfdb_import_survey(mdb,
#                    data_source = 'example-anchovy-length.at.age',
#                    length.at.age)
# 
# mfdb_import_survey(mdb,
#                    data_source = 'example-anchovy-catch.at.agedist',
#                    catches.agedist)

mfdb_import_survey(mdb,
                   data_source = 'example-anchovy-ALKcatch.at.dist',
                   ALKcatches.ldist)
#mfdb:::mfdb_send(mdb, paste0("ALTER TABLE ", mdb$schema, ".sample ALTER COLUMN count TYPE NUMERIC")) 


mfdb_import_survey(mdb,
                   data_source = 'example-anchovy-allptsp.dist',
                   fleet.allptsp)

# mfdb_import_survey(mdb,
#                    data_source = 'example-anchovy-fleet-Port',
#                    catches.port_bio_Alg)
# mfdb_import_survey(mdb,
#                    data_source = 'example-anchovy-fleet-Esp',
#                    catches.seine_bio_GoC)

# mfdb_import_survey_index(mdb, data_source = 'acoustic_index1', data.frame(
#   index_type = 'acoustic',
#   year = '1998',
#   month = 1:12,
#   areacell = '45G01',
#   #              -----Q1----- -----Q2----- -----Q3----- -----Q4-----
#   value =      c(12, 11, 10,  9, 8, 7,     6, 5, 4,     3, 2, 1     )))

# mfdb_import_survey(mdb,
#                    data_source = 'example-anchovy-acoustic-pelago.numbers',
#                    pelagonumber.survey)

mfdb_import_survey(mdb,
                   data_source = 'example-anchovy-acoustic-pelago.biomass',
                   pelago_biom)

mfdb_import_survey(mdb,
                   data_source = 'example-anchovy-acoustic-pelago.ldist',
                   pelago.ldist)

mfdb_import_survey(mdb,
                   data_source = 'example-anchovy-sar.numbers',
                   sarnumber.survey)

# mfdb_import_survey(mdb,
#                    data_source = 'example-anchovy-ecocadiz.numbers',
#                    ecocadiz.survey)

mfdb_import_survey(mdb,
                   data_source = 'example-anchovy-ecocadiz.biomass',
                   ecocadiz_biom)

mfdb_import_survey(mdb,
                   data_source = 'example-anchovy-ecocadiz.ldist',
                   ecocadiz.ldist)

mfdb_import_survey(mdb,
                   data_source = 'example-anchovy-ecocadizrec.biomass',
                   ecocadiz_rec_bio)

mfdb_import_survey(mdb,
                   data_source = 'example-anchovy-ecocadizrec.ldist',
                   ecocadizrec.ldist)

mfdb_import_survey(mdb,
                   data_source = 'example-anchovy-arsa.ldist',
                   arsa.ldist)
mfdb_import_survey(mdb,
                   data_source = 'example-anchovy-arsa.ldistnoage',
                   arsa.ldistnoage)
mfdb_import_survey(mdb,
                   data_source = 'example-anchovy-pelago.ldistnoage',
                   pelago.ldistnoage)
mfdb_import_survey(mdb,
                   data_source = 'example-anchovy-ecocadiz.ldistnoage',
                   ecocadiz.ldistnoage)
mfdb_import_survey(mdb,
                   data_source = 'example-anchovy-ecocadiz.aldist',
                   ecocadiz.aldist)
mfdb_import_survey(mdb,
                   data_source = 'example-anchovy-pelago.aldist',
                   pelago.aldist)


mfdb_import_survey(mdb,
                   data_source = 'example-anchovy-arsa.biomass',
                   ARSA_biom)

mfdb_import_survey(mdb,
                   data_source = 'example-anchovy-bocadeva.biomass',
                   bocadeva_biom)

#Para Anchovy73:
# bounds	understocking
# 	ldist.seine:
# areaaggfile	Aggfiles/catchdistribution.ldist.seine.area.agg
# ageaggfile	Aggfiles/catchdistribution.ldist.seine.age.agg
# lenaggfile	Aggfiles/catchdistribution.ldist.seine.len.agg
# 	ldist.ecocadiz:
# areaaggfile	Aggfiles/catchdistribution.ldist.ecocadiz.area.agg
# ageaggfile	Aggfiles/catchdistribution.ldist.ecocadiz.age.agg
# lenaggfile	Aggfiles/catchdistribution.ldist.ecocadiz.len.agg
# 	catches.agedist:
# areaaggfile	Aggfiles/catchdistribution.catches.agedist.area.agg
# ageaggfile	Aggfiles/catchdistribution.catches.agedist.age.agg
# lenaggfile	Aggfiles/catchdistribution.catches.agedist.len.agg
# 	pelagonumber.survey:
# areaaggfile	Aggfiles/surveyindices.pelagonumber.survey.area.agg
# lenaggfile	Aggfiles/surveyindices.pelagonumber.survey.len.agg
# 	ldist.pelago:
# areaaggfile	Aggfiles/catchdistribution.ldist.pelago.area.agg
# ageaggfile	Aggfiles/catchdistribution.ldist.pelago.age.agg
# lenaggfile	Aggfiles/catchdistribution.ldist.pelago.len.agg
# 	ecocadiz.survey:
# areaaggfile	Aggfiles/surveyindices.ecocadiz.survey.area.agg
# lenaggfile	Aggfiles/surveyindices.ecocadiz.survey.len.agg
# 	sarnumber.survey:
# areaaggfile	Aggfiles/surveyindices.sarnumber.survey.area.agg
# lenaggfile	Aggfiles/surveyindices.sarnumber.survey.len.agg
# length.at.age:
# areaaggfile	Aggfiles/catchstatistics.length.at.age.area.agg
# ageaggfile	Aggfiles/catchstatistics.length.at.age.age.agg
# 


# defaults <- list(
#   
#   timestep = mfdb_timestep_quarterly,
#   year = 1984:2012,
#   species = 'COD')
## Write out areafile and update mainfile with areafile location
# gadget_dir_write(gd, gadget_areafile(
#   size = mfdb_area_size(mdb, defaults)[[1]],
#   temperature = mfdb_temperature(mdb, defaults)[[1]]))
# ## Write a penalty component to the likelihood file
# gadget_dir_write(gd, gadget_likelihood_component("penalty",
#                                                  name = "bounds",
#                                                  weight = "0.5",
#                                                  data = data.frame(
#                                                    switch = c("default"),
#                                                    power = c(2),
#                                                    lowerW=10000,
#                                                    upperW=10000,
#                                                    stringsAsFactors = FALSE)))
# 
# gadget_dir_write(gd, gadget_likelihood_component("understocking", name ="understocking",weight = "1e8"))


aggdata <- mfdb_sample_count(mdb, c('age', 'length'), c(list(
  sampling_type='SEA',length = mfdb_interval("len", seq(3,22,0.5))),
  defaults))


# aggdata <- mfdb_sample_count(mdb, c('age', 'length'), c(list(
#   sampling_type = 'IGFS',
#   species = 'COD',
#   length = mfdb_interval("len", seq(0, 150, by = 2))),
#   defaults))

# gadget_dir_write(gd, gadget_likelihood_component("catchdistribution",
#                                                  name = "ldist.seine",
#                                                  weight = 1,
#                                                  data = aggdata[[1]],
#                                                  fleetnames = c("seine"),
#                                                  stocknames = c("anch")))
# gadget_dir_write(gd, gadget_file("Aggfiles/catchdistribution.ldist.seine.age.agg", list(list(all=c(0,3)))))

save(aggdata, file="demo-anchovy/data/ldist.seine.Rdata")
rm(aggdata)

# aggdata <- mfdb_sample_count(mdb, c('age','length'), c(list(
#   sampling_type='arsa_compld', year=1993:2000,length = mfdb_interval("len", seq(3,20,1))),
#  defaults))
# aggdata[[1]]$year<-aggdata[[1]]$year+1
# aggdata[[1]]$step<-1
# 
# 
# 
# gadget_dir_write(gd, gadget_likelihood_component("catchdistribution",
#                                                  name = "ldist.arsa.noage1",                                                                                                                            
#                                                  stocknames = c("anch"),                                           
#                                                  weight = 1,
#                                                  fleetnames = c("ARSA"),
#                                                  data = aggdata[[1]]
# ))
# gadget_dir_write(gd, gadget_file("Aggfiles/catchdistribution.ldist.arsa.noage1.age.agg", list(list(all=c(0,3)))))
# 
# rm(aggdata)
# 
# aggdata <- mfdb_sample_count(mdb, c('age','length'), c(list(
#   sampling_type='arsa_compld', year=2001:2016,length = mfdb_interval("len", seq(3,22,0.5))),
#   defaults))
# aggdata[[1]]$year<-aggdata[[1]]$year+1
# aggdata[[1]]$step<-1
# 
# gadget_dir_write(gd, gadget_likelihood_component("catchdistribution",
#                                                  name = "ldist.arsa.noage2",                                                   
#                                                  stocknames = c("anch"),                                           
#                                                  weight = 1,
#                                                  fleetnames = c("ARSA"),
#                                                  data = aggdata[[1]]
# ))
# gadget_dir_write(gd, gadget_file("Aggfiles/catchdistribution.ldist.arsa.noage2.age.agg", list(list(all=c(0,3)))))
# 

#rm(aggdata)

aggdata <- mfdb_sample_count(mdb, c('age','length'), c(list(
  sampling_type='pelago_comp_ld', length = mfdb_interval("len", seq(3,22,0.5))),
  defaults))


# gadget_dir_write(gd, gadget_likelihood_component("catchdistribution",
#                                                  name = "ldist.pelago.noage",                                                   
#                                                  stocknames = c("anch"),                                           
#                                                  weight = 1,
#                                                  fleetnames = c("PEL"),
#                                                  data = aggdata[[1]]
# ))
# gadget_dir_write(gd, gadget_file("Aggfiles/catchdistribution.ldist.pelago.noage.age.agg", list(list(all=c(0,3)))))
save(aggdata, file="demo-anchovy/data/ldist.pelago.Rdata")
rm(aggdata)

aggdata <- mfdb_sample_count(mdb, c('age','length'), c(list(
  sampling_type='ecocadiz_comp_ld', length = mfdb_interval("len", seq(3,22,0.5))),
  defaults))


# gadget_dir_write(gd, gadget_likelihood_component("catchdistribution",
#                                                  name = "ldist.ecocadiz.noage",                                                   
#                                                  stocknames = c("anch"),                                           
#                                                  weight = 1,
#                                                  fleetnames = c("ECO"),
#                                                  data = aggdata[[1]]
# ))
# gadget_dir_write(gd, gadget_file("Aggfiles/catchdistribution.ldist.ecocadiz.noage.age.agg", list(list(all=c(0,3)))))

save(aggdata, file="demo-anchovy/data/ldist.ecocadiz.Rdata")
rm(aggdata)


aggdata <- mfdb_sample_count(mdb, c('age','length'), c(list(
  sampling_type='alkcatches_comp',length = mfdb_interval("len", seq(3.5,19.5,0.5)), age=c(0,1,2,3)),
  defaults))

# aggdata <- mfdb_sample_count(mdb, c('age', 'length'), c(list(
#   sampling_type = 'IGFS',
#   species = 'COD',
#   length = mfdb_interval("len", seq(0, 150, by = 2))),
#   defaults))

# gadget_dir_write(gd, gadget_likelihood_component("catchdistribution",
#                                                  name = "ldist.alkseine",
#                                                  weight = 1,
#                                                  data = aggdata[[1]],
#                                                  fleetnames = c("seine"),
#                                                  stocknames = c("anch")))
save(aggdata, file="demo-anchovy/data/aldist.seine.Rdata")
rm(aggdata)


aggdata <- mfdb_sample_count(mdb, c('age','length'), c(list(
  sampling_type='pelago_comp_ald',length = mfdb_interval("len", seq(3.5,19.5,0.5)), age=c(0,1,2,3)),
  defaults))

# aggdata <- mfdb_sample_count(mdb, c('age', 'length'), c(list(
#   sampling_type = 'IGFS',
#   species = 'COD',
#   length = mfdb_interval("len", seq(0, 150, by = 2))),
#   defaults))

# gadget_dir_write(gd, gadget_likelihood_component("catchdistribution",
#                                                  name = "aldist.pelago",
#                                                  weight = 1,
#                                                  data = aggdata[[1]],
#                                                  fleetnames = c("PEL"),
#                                                  stocknames = c("anch")))


save(aggdata, file="demo-anchovy/data/aldist.pelago.Rdata")
rm(aggdata)


#He quitado los bichos de la edad cero de la ecocadiz
aggdata <- mfdb_sample_count(mdb, c('age','length'), c(list(
  sampling_type='ecocadiz_comp_ald',length = mfdb_interval("len", seq(3.5,19.5,0.5)), age=c(1,2,3)),
  defaults))


# aggdata <- mfdb_sample_count(mdb, c('age','length'), c(list(
#   sampling_type='ecocadiz_comp_ald',length = mfdb_interval("len", seq(3.5,19.5,0.5)), age=c(0,1,2,3)),
#   defaults))
# 



# aggdata <- mfdb_sample_count(mdb, c('age', 'length'), c(list(
#   sampling_type = 'IGFS',
#   species = 'COD',
#   length = mfdb_interval("len", seq(0, 150, by = 2))),
#   defaults))

# gadget_dir_write(gd, gadget_likelihood_component("catchdistribution",
#                                                  name = "aldist.ecocadiz",
#                                                  weight = 1,
#                                                  data = aggdata[[1]],
#                                                  fleetnames = c("ECO"),
#                                                  stocknames = c("anch")))
# 

save(aggdata, file="demo-anchovy/data/aldist.ecocadiz.Rdata")
rm(aggdata)






############################################

# aggdata <- mfdb_sample_count(mdb, c('age','length'), c(list(
#   sampling_type='ecocadiz0813',length = mfdb_interval("len", seq(6,18,0.5))),
#   defaults))
# aggdata <- mfdb_sample_count(mdb, c('age','length'), c(list(
#   sampling_type='ecocadiz_comp',length = mfdb_interval("len", seq(3.5,19.5,0.5))),
#   defaults))

##############################
# aggdata <- mfdb_sample_count(mdb, c('age','length'), c(list(
#   sampling_type='ecocadiz_comp',length = mfdb_interval("len", seq(3.5,19.5,0.5)), age=c(0,1,2,3)),
#   defaults))



# aggdata <- mfdb_sample_count(mdb, c('age', 'length'), c(list(
#   sampling_type = 'IGFS',
#   species = 'COD',
#   length = mfdb_interval("len", seq(0, 150, by = 2))),
#   defaults))

# gadget_dir_write(gd, gadget_likelihood_component("catchdistribution",
#                                                  name = "ldist.ecocadiz0813",                                                                                                                            
#                                                  stocknames = c("anch"),                                           
#                                                  weight = 1,
#                                                  fleetnames = c("seine"),
#                                                  data = aggdata[[1]]
# ))
# gadget_dir_write(gd, gadget_file("Aggfiles/catchdistribution.ldist.ecocadiz0813.age.agg", list(list(all=c(0,3)))))
# 
#ECO O SEINE De flota
# gadget_dir_write(gd, gadget_likelihood_component("catchdistribution",
#                                                  name = "ldist.ecocadiz",                                                                                                                            
#                                                  stocknames = c("anch"),                                           
#                                                  weight = 1,
#                                                  fleetnames = c("ECO"),
#                                                  data = aggdata[[1]]
# ))
# # gadget_dir_write(gd, gadget_file("Aggfiles/catchdistribution.ldist.ecocadiz0813.age.agg", list(list(all=c(0,3)))))
# 
# 
# 
# 
# rm(aggdata)
#################################esto no
# aggdata <- mfdb_sample_count(mdb, c('age', 'length'), c(list(sampling_type='SEA',age =c(0,1,2,3)),defaults))
# 
# 
# gadget_dir_write(gd, gadget_likelihood_component("catchdistribution",
#                                                  name = "catches.agedist",
#                                                  weight = 1,
#                                                  data = aggdata[[1]],
#                                                  fleetnames = c("seine"),
#                                                  stocknames = c("anch")))
# 
# gadget_dir_write(gd, gadget_file("Aggfiles/catchdistribution.catches.agedist.len.agg", list(list(all=c(3,22)))))
# rm(aggdata)
# 


# aggdata<-mfdb_sample_count(mdb,c("vessel"),c(
#   
#   list(vessel=mfdb_group(seine="3.CQT"),sampling_type='SEA'),
#   defaults))
# 
# gadget_dir_write(gd, gadget_fleet_component(
#   'numberfleet',
#   name = 'seine',
#   suitability = "\n anch function expsuitfuncl50 #constant #l50",
#   data=aggdata[[1]]
# ))
# 
# rm(aggdata)
#################################33
#####################################3
###########################
#Para tener toda la base de datos de biomasa junta


# aggdata<-mfdb_sample_count(mdb, c("sampling_type","vessel"),
#                                                      c(list(sampling_type=c('pelago_bio','ecocadiz_bio','ecocadizrec_bio','sar_bio','SEA'),vessel=c("3.CQT","3.CDA","1.RSH")),defaults))
# 
# Biomass_summary<-aggdata[[1]]
# Biomass_summary$number<-Biomass_summary$number/1000 #in tonnes
# Biomass_summary$com[Biomass_summary$sampling_type=='SEA']<-1
# Biomass_summary$com[Biomass_summary$sampling_type!='SEA']<-0
# #ggplot(aggdata[[1]],aes(interaction(step,year),number,colour=sampling_type, group=1))+geom_line()
# rm(aggdata)
# ggplot(Biomass_summary,aes(interaction(step,year),number,colour=sampling_type, group=sampling_type))+geom_line()
# #dev.new()
# #dev.list()
# Biomass_summary_by_year<-aggregate(number~year+area+sampling_type, Biomass_summary, sum)
# as<-ggplot(Biomass_summary_by_year,aes(year,number,colour=sampling_type, group=sampling_type))+geom_line()+geom_point()+theme_bw()+theme(axis.text.x = element_text(angle = 90, hjust = 1))
# ggsave(as+scale_x_continuous(breaks=1989:2016,limits=c(1989,2016), labels=1989:2016)+ylab("Biomass (tonnes)")+scale_colour_discrete(name  = "",breaks=unique(Biomass_summary_by_year$sampling_type),labels=c( "ecocadiz",    "ecocadizrec", "pelago" ,     "sar"    ,     "Catches IXa South"       )),file="biomass_summary_year.pdf")
# 
# asi<-ggplot(Biomass_summary_by_year,aes(year,number,colour=sampling_type, group=sampling_type))+geom_point()+theme_bw()+theme(axis.text.x = element_text(angle = 90, hjust = 1))
# asi
# asii<-as+scale_x_continuous(breaks=1989:2016,limits=c(1989,2016), labels=1989:2016)+ylab("Biomass (tonnes)")+scale_colour_discrete(name  = "",breaks=unique(Biomass_summary_by_year$sampling_type),labels=c( "ecocadiz",    "ecocadizrec", "pelago" ,     "sar"    ,     "Catches IXa South"       ))+scale_y_log10(breaks=c(1000,10000,40000),labels=c(1000,10000,40000))
# ggsave(asii,file="biomass_summary_year_log.pdf")
##############################################################3
#Para Gadget con biomasa
# aggdata<-mfdb_sample_count(mdb,c("vessel"),c(
#   
#   list(vessel=mfdb_group(seine="3.CQT"),sampling_type='SEA'),
#   defaults))
# aggdata[[1]]$vessel<-"seine"
# gadget_dir_write(gd, gadget_fleet_component(
#   'totalfleet',
#   name = 'seine',
#   suitability = "\n anch function expsuitfuncl50 #constant #l50",
#   data=aggdata[[1]]
# ))
# 
# rm(aggdata)
# 
# 
# aggdata<-mfdb_sample_count(mdb,c("vessel"),c(
#   
#   list(vessel=mfdb_group(seineport="3.CDA"),sampling_type='SEA'),
#   defaults))
# aggdata[[1]]$vessel<-"PortBIO"
# gadget_dir_write(gd, gadget_fleet_component(
#   'totalfleet',
#   name = 'seineport',
#   suitability = "\n anch function expsuitfuncl50 #constant #l50",
#   data=aggdata[[1]]
# ))
# 
# rm(aggdata)
#Para Gadget con número de capturas
# aggdata<-mfdb_sample_count(mdb,c("vessel"),c(
# 
#   list(vessel=mfdb_group(seine="2.CQT"),sampling_type='SEA'),
#   defaults))
# aggdata[[1]]$vessel<-"seine"
# gadget_dir_write(gd, gadget_fleet_component(
#   'numberfleet',
#   name = 'seine',
#   suitability = "\n anch function expsuitfuncl50   Initfiles/anchalpha.tvf  Initfiles/anchL50.tvf" ,
#   data=aggdata[[1]]
# ))
#########################################################3
#Para Gadget con all fleets
# aggdata<-mfdb_sample_count(mdb,c("sampling_type"),c(
#   
#   list(sampling_type='SEAS2'),
#   defaults))

#aggdata<-mfdb_sample_count(mdb, c("sampling_type"),
 #                          c(list(sampling_type=c('SEAS2')),defaults))

aggdata<-mfdb_sample_count(mdb,NULL,c(
  
  list(vessel=mfdb_group(all="2.CDA")),
  defaults))
aggdata[[1]]$area<-NULL

save(aggdata, file="demo-anchovy/data/seine_landings.Rdata")
rm(aggdata)
#aggdata[[1]]$vessel<-"seine"
# gadget_dir_write(gd, gadget_fleet_component(
#   'numberfleet',
#   name = 'seine',
#   suitability = "\n anch function expsuitfuncl50   Initfiles/anchalpha.tvf  Initfiles/anchL50.tvf" ,
#   data=aggdata[[1]]
# ))

# aggdata<-mfdb_sample_count(mdb,c("vessel"),c(
#   
#   list(vessel=mfdb_group(seine="3.CQT"),sampling_type='SEA'),
#   defaults))
# aggdata[[1]]$vessel<-"ARSA"
# aggdata[[1]]$number<-1
# gadget_dir_write(gd, gadget_fleet_component(
#   'totalfleet',
#   name = 'ARSA',
#   suitability = "\n anch function expsuitfuncl50 #constantarsa #l50arsa ",
#   data=aggdata[[1]]
# ))

aggdata<-mfdb_sample_count(mdb,NULL,c(
  
  list(vessel=mfdb_group(seine="1.RSH"),sampling_type='ecocadiz_bio'),
  defaults))
aggdata[[1]]$area<-NULL
aggdata[[1]]$number<-1

save(aggdata, file="demo-anchovy/data/ECO_landings.Rdata")
rm(aggdata)




#gadget_dir_write(gd, gadget_fleet_component(
#   'totalfleet',
#   name = 'ECO',
#   suitability = "\n anch function expsuitfuncl50 #constanteco #l50eco ",
#   data=aggdata[[1]]
# ))


aggdata<-mfdb_sample_count(mdb,NULL,c(
  
  list(vessel=mfdb_group(seine="1.RSH"),sampling_type='pelago_bio'),
  defaults))
aggdata[[1]]$area<-NULL
aggdata[[1]]$number<-1


save(aggdata, file="demo-anchovy/data/PEL_landings.Rdata")
rm(aggdata)

#################################33 ecorec fleet
# # aggdata[[1]]$vessel<-"ECOREC"
# # gadget_dir_write(gd, gadget_fleet_component(
# #   'totalfleet',
# #   name = 'ECOREC',
# #   suitability = "\n anch function expsuitfuncl50 #constantecorec #l50ecorec ",
# #   data=aggdata[[1]]
# # ))
# # rm(aggdata)
##############################################3



# agg <- mfdb_survey_index_mean(mdb, cols = c('data_source'), list(
#   index_type = 'acoustic',
#aggdata<- mfdb_sample_count(mdb, c( 'length'), c(
#defaults))
#agg <- mfdb_survey_index_mean(mdb, c("survey"), c(list(index_type='acoustic'),defaults))

########################################################3
#anterior pelago number...ahora con biomasa
aggdata<-mfdb_sample_count(mdb, c('length'), c(list(sampling_type='pelago_bio'),defaults))
# 
#gadget_dir_write(gd, gadget_likelihood_component("surveyindices",
                                                 # name = "pelagonumber.survey",
                                                 # weight = 1,
                                                 # data = aggdata[[1]],
                                                 # fittype = 'fixedslopeloglinearfit',
                                                 # slope=1,
                                                 # biomass=1,
                                                 # stocknames = c("anch"),
                                                 # surveynames='pelago'))
save(aggdata, file="demo-anchovy/data/pelago.bioindex.Rdata")
rm(aggdata)
# gadget_dir_write(gd, gadget_file("Aggfiles/surveyindices.pelagonumber.survey.age.agg", list(list(all=c(0,3)))))
# gadget_dir_write(gd, gadget_file("Aggfiles/surveyindices.pelagonumber.survey.len.agg", list(list(all=c(3,22)))))
######################################################33

# # aggdata <- mfdb_sample_count(mdb, c('age','length'), c(list(
# #   sampling_type='pelago_comp',length = mfdb_interval("len", seq(3.5,19.5,0.5))),
# #   defaults))
# 
# aggdata <- mfdb_sample_count(mdb, c('age','length'), c(list(
#   sampling_type='pelago_comp',age=c(0,1,2,3),length = mfdb_interval("len", seq(3.5,19.5,0.5))),
#   defaults))
# 
# 
# # aggdata <- mfdb_sample_count(mdb, c('age', 'length'), c(list(
# #   sampling_type = 'IGFS',
# #   species = 'COD',
# #   length = mfdb_interval("len", seq(0, 150, by = 2))),
# #   defaults))
# 
# # gadget_dir_write(gd, gadget_likelihood_component("catchdistribution",
# #                                                  name = "ldist.ecocadiz0813",                                                                                                                            
# #                                                  stocknames = c("anch"),                                           
# #                                                  weight = 1,
# #                                                  fleetnames = c("seine"),
# #                                                  data = aggdata[[1]]
# # ))
# # gadget_dir_write(gd, gadget_file("Aggfiles/catchdistribution.ldist.ecocadiz0813.age.agg", list(list(all=c(0,3)))))
# # 
# #ECO O SEINE De flota
# gadget_dir_write(gd, gadget_likelihood_component("catchdistribution",
#                                                  name = "ldist.pelago",                                                                                                                            
#                                                  stocknames = c("anch"),                                           
#                                                  weight = 1,
#                                                  fleetnames = c("PEL"),
#                                                  data = aggdata[[1]]
# ))
# # gadget_dir_write(gd, gadget_file("Aggfiles/catchdistribution.ldist.ecocadiz0813.age.agg", list(list(all=c(0,3)))))
# 


#ecocadiz rec
##############################33
# rm(aggdata)
# 
# 
# aggdata <- mfdb_sample_count(mdb, c('age','length'), c(list(
#   sampling_type='ecocadiz_rec_comp',age=c(0,1,2,3),length = mfdb_interval("len", seq(3.5,19.5,0.5))),
#   defaults))
# 
# 
# # aggdata <- mfdb_sample_count(mdb, c('age', 'length'), c(list(
# #   sampling_type = 'IGFS',
# #   species = 'COD',
# #   length = mfdb_interval("len", seq(0, 150, by = 2))),
# #   defaults))
# 
# # gadget_dir_write(gd, gadget_likelihood_component("catchdistribution",
# #                                                  name = "ldist.ecocadiz0813",                                                                                                                            
# #                                                  stocknames = c("anch"),                                           
# #                                                  weight = 1,
# #                                                  fleetnames = c("seine"),
# #                                                  data = aggdata[[1]]
# # ))
# # gadget_dir_write(gd, gadget_file("Aggfiles/catchdistribution.ldist.ecocadiz0813.age.agg", list(list(all=c(0,3)))))
# # 
# #ECO O SEINE De flota
# gadget_dir_write(gd, gadget_likelihood_component("catchdistribution",
#                                                  name = "ldist.ecocadizrec",                                                                                                                            
#                                                  stocknames = c("anch"),                                           
#                                                  weight = 1,
#                                                  fleetnames = c("ECOREC"),
#                                                  data = aggdata[[1]]
# ))
# # gadget_dir_write(gd, gadget_file("Aggfiles/catchdistribution.ldist.ecocadiz0813.age.agg", list(list(all=c(0,3)))))
# 
# 
# 
# 
# rm(aggdata)
##################33este a?n no lo veo claro

aggdata<-mfdb_sample_count(mdb, c('length'), c(list(sampling_type='ecocadiz_bio'),defaults))

gadget_dir_write(gd, gadget_likelihood_component("surveyindices",
                                                 name = "ecocadiz.survey",
                                                 weight = 1,
                                                 data = aggdata[[1]],
                                                 fittype = 'fixedslopeloglinearfit',
                                                 slope=1,
                                                 stocknames = c("anch"),
                                                 biomass=1,
                                                 surveynames='ecocadiz'))

rm(aggdata)
gadget_dir_write(gd, gadget_file("Aggfiles/surveyindices.ecocadiz.survey.age.agg", list(list(all=c(0,3)))))
gadget_dir_write(gd, gadget_file("Aggfiles/surveyindices.ecocadiz.survey.len.agg", list(list(all=c(3,22)))))
########################################################
# aggdata<-mfdb_sample_count(mdb, c('length'), c(list(sampling_type='ecocadizrec_bio'),defaults))
# 
# gadget_dir_write(gd, gadget_likelihood_component("surveyindices",
#                                                  name = "ecocadizrec.survey",
#                                                  weight = 1,
#                                                  data = aggdata[[1]],
#                                                  fittype = 'fixedslopeloglinearfit',
#                                                  slope=1,
#                                                  stocknames = c("anch"),
#                                                  biomass=1,
#                                                  surveynames='ecocadizrec'))
# 
# rm(aggdata)
# gadget_dir_write(gd, gadget_file("Aggfiles/surveyindices.ecocadizrec.survey.age.agg", list(list(all=c(0,3)))))
# gadget_dir_write(gd, gadget_file("Aggfiles/surveyindices.ecocadizrec.survey.len.agg", list(list(all=c(3,22)))))
# 
# 
# 
# aggdata<-mfdb_sample_count(mdb, c('length'), c(list(sampling_type='sar_bio'),defaults))
# 
# 
# gadget_dir_write(gd, gadget_likelihood_component("surveyindices",
#                                                  name = "sarnumber.survey",
#                                                  weight = 1,
#                                                  data = aggdata[[1]],
#                                                  fittype = 'fixedslopeloglinearfit',
#                                                  slope=1,
#                                                  biomass=1,
#                                                  stocknames = c("anch")))
# 
# 
# rm(aggdata)
# gadget_dir_write(gd, gadget_file("Aggfiles/surveyindices.sarnumber.survey.age.agg", list(list(all=c(0,3)))))
# gadget_dir_write(gd, gadget_file("Aggfiles/surveyindices.sarnumber.survey.len.agg", list(list(all=c(3,22)))))



#este ya no

aggdata<-mfdb_sample_count(mdb, c('length'), c(list(sampling_type='bocadeva_bio'),defaults))


gadget_dir_write(gd, gadget_likelihood_component("surveyindices",
                                                 name = "bocadeva.survey",
                                                 weight = 1,
                                                 data = aggdata[[1]],
                                                 fittype = 'fixedslopeloglinearfit',
                                                 slope=1,
                                                 biomass=1,
                                                 stocknames = c("anch")))


rm(aggdata)
gadget_dir_write(gd, gadget_file("Aggfiles/surveyindices.bocadeva.survey.age.agg", list(list(all=c(0,3)))))
gadget_dir_write(gd, gadget_file("Aggfiles/surveyindices.bocadeva.survey.len.agg", list(list(all=c(3,22)))))

# aggdata<-mfdb_sample_count(mdb, c('length'), c(list(sampling_type='arsa_bio'),defaults))
# 
# 
# gadget_dir_write(gd, gadget_likelihood_component("surveyindices",
#                                                  name = "arsa.survey",
#                                                  weight = 1,
#                                                  data = aggdata[[1]],
#                                                  fittype = 'fixedslopeloglinearfit',
#                                                  slope=1,
#                                                  biomass=1,
#                                                  stocknames = c("anch")))
# 
# 
# rm(aggdata)
# gadget_dir_write(gd, gadget_file("Aggfiles/surveyindices.arsa.survey.age.agg", list(list(all=c(0,3)))))
# gadget_dir_write(gd, gadget_file("Aggfiles/surveyindices.arsa.survey.len.agg", list(list(all=c(3,22)))))

# aggdata <- mfdb_sample_count(mdb, c('age','length'), c(list(
#   sampling_type='arsa_comp',length = mfdb_interval("len", seq(3,20,1)), age=c(0,1,2,3)),
#   defaults))
# 
# 
# 
# 
# gadget_dir_write(gd, gadget_likelihood_component("catchdistribution",
#                                                  name = "ldist.arsa",                                                                                                                            
#                                                  stocknames = c("anch"),                                           
#                                                  weight = 1,
#                                                  fleetnames = c("ARSA"),
#                                                  data = aggdata[[1]]
# ))
# gadget_dir_write(gd, gadget_file("Aggfiles/catchdistribution.ldist.ecocadiz0813.age.agg", list(list(all=c(0,3)))))




#rm(aggdata)




















#este ya no
aggdata<-mfdb_sample_meanlength(mdb, c('age'), c(list(sampling_type='SEA',age =c(0,1,2,3)), defaults))

gadget_dir_write(gd, gadget_likelihood_component("catchstatistics",
                                                 name = "length.at.age",
                                                 weight = 1,
                                                 data = na.omit(aggdata[[1]]),
                                                 fleetnames = c("seine"),
                                                 stocknames = c("anch")))


########
#Suitability for the survey

alpha<-0.08
l<-seq(0,20,0.5)
l50<-50
expsuitl50_pre<-1+exp(-alpha*(l-l50)) 
expsuitl50<-expsuitl50_pre^-1
plot(l,expsuitl50,xlim=c(0,20))

#Para fleet.seine.data
sum(as.numeric(as.character(def_ecocadiz0813$count)))

#####################################################################
## Age IGFS
aggdata <-
  mfdb_sample_count(mdb, c('age', 'length'),
                    c(list(sampling_type = 'IGFS',
                           age = mfdb_step_interval('age',by=1,from=1,to=12),
                           species='COD',
                           length = mfdb_interval("len", seq(0, 150, by = 4))),
                      defaults))
gadget_dir_write(gd,
                 gadget_likelihood_component("catchdistribution",
                                             name = "aldist.igfs",
                                             weight = 1,
                                             data = aggdata[[1]],
                                             fleetnames = c("igfs"),
                                             stocknames = c("codimm", "codmat")))
rm(aggdata)

## Maturity @3 from IGFS
aggdata <- mfdb_sample_count(mdb, c('maturity_stage', 'length'),
                             append(defaults,
                                    list(sampling_type='IGFS',
                                         age=mfdb_group(age=3),
                                         length = mfdb_step_interval('len', by = 2, to = 100),
                                         maturity_stage = mfdb_group(codimm = 1, codmat = 2:5))))

gadget_dir_write(gd,
                 gadget_likelihood_component("stockdistribution",
                                             name = "matp.igfs",
                                             weight = 1,
                                             data = aggdata[[1]],
                                             fleetnames = c("igfs"),
                                             stocknames = c("codimm", "codmat")))



## Query length data to create AUT catchdistribution components
aggdata <- mfdb_sample_count(mdb, c('age', 'length'), c(list(
  sampling_type = 'AUT',
  species = 'COD',
  length = mfdb_interval("len", seq(0, 150, by = 2))),
  defaults))

gadget_dir_write(gd, gadget_likelihood_component("catchdistribution",
                                                 name = "ldist.aut",
                                                 weight = 1,
                                                 data = aggdata[[1]],
                                                 fleetnames = c("aut"),
                                                 stocknames = c("codimm", "codmat")))
rm(aggdata)
## Age AUT
aggdata <-
  mfdb_sample_count(mdb, c('age', 'length'),
                    c(list(sampling_type = 'AUT',
                           age = mfdb_step_interval('age',by=1,from=1,to=12),
                           length = mfdb_interval("len", seq(0, 150, by = 4))),
                      defaults))
gadget_dir_write(gd,
                 gadget_likelihood_component("catchdistribution",
                                             name = "aldist.aut",
                                             weight = 1,
                                             data = aggdata[[1]],
                                             fleetnames = c("aut"),
                                             stocknames = c("codimm", "codmat")))
rm(aggdata)


## Query length data to create COMM catchdistribution components
aggdata <- mfdb_sample_count(mdb, c('age', 'length'), c(list(
  sampling_type = 'SEA',
  species = 'COD',
  length = mfdb_interval("len", seq(0, 150, by = 2))),
  defaults))

gadget_dir_write(gd, gadget_likelihood_component("catchdistribution",
                                                 name = "ldist.comm",
                                                 weight = 1,
                                                 data = aggdata[[1]],
                                                 fleetnames = c("comm"),
                                                 stocknames = c("codimm", "codmat")))
rm(aggdata)
## Age AUT
aggdata <-
  mfdb_sample_count(mdb, c('age', 'length'),
                    c(list(sampling_type = 'SEA',
                           age = mfdb_step_interval('age',by=1,from=1,to=12),
                           length = mfdb_interval("len", seq(0, 150, by = 4))),
                      defaults))
gadget_dir_write(gd,
                 gadget_likelihood_component("catchdistribution",
                                             name = "aldist.comm",
                                             weight = 1,
                                             data = aggdata[[1]],
                                             fleetnames = c("comm"),
                                             stocknames = c("codimm", "codmat")))
rm(aggdata)






## IGFS survey indices

igfs.SI1 <- mfdb_sample_count(mdb, c('length'), c(list(
  sampling_type = 'IGFS',
  length = mfdb_interval("len", c(4,17))),
  defaults))

igfs.SI2 <- mfdb_sample_count(mdb, c('length'), c(list(
  sampling_type = 'IGFS',
  length = mfdb_interval("len", c(17,33))),
  defaults))

igfs.SI3 <- mfdb_sample_count(mdb, c( 'length'), c(list(
  sampling_type = 'IGFS',
  length = mfdb_interval("len", c(33,140))),
  defaults))


gadget_dir_write(gd, gadget_likelihood_component("surveyindicies",
                                                 name = "si.gp1",
                                                 weight = 1,
                                                 data = igfs.SI1[[1]],
                                                 fittype = 'fixedslopeloglinearfit',
                                                 slope=1,
                                                 stocknames = c("codimm")))

gadget_dir_write(gd, gadget_likelihood_component("surveyindicies",
                                                 name = "si.gp2",
                                                 weight = 1,
                                                 data = igfs.SI2[[1]],
                                                 fittype = 'fixedslopeloglinearfit',
                                                 slope=1,
                                                 stocknames = c("codimm","codmat")))

gadget_dir_write(gd, gadget_likelihood_component("surveyindicies",
                                                 name = "si.gp3",
                                                 weight = 1,
                                                 data = igfs.SI3[[1]],
                                                 fittype = 'fixedslopeloglinearfit',
                                                 slope=1,
                                                 stocknames = c("codimm","codmat")))
## AUT survey indices

igfs.SI1 <- mfdb_sample_count(mdb, c('length'), c(list(
  sampling_type = 'IGFS',
  length = mfdb_interval("len", c(16,27))),
  defaults))

igfs.SI2 <- mfdb_sample_count(mdb, c('length'), c(list(
  sampling_type = 'IGFS',
  length = mfdb_interval("len", c(27,39))),
  defaults))

igfs.SI3 <- mfdb_sample_count(mdb, c( 'length'), c(list(
  sampling_type = 'IGFS',
  length = mfdb_interval("len", c(39,140))),
  defaults))


gadget_dir_write(gd, gadget_likelihood_component("surveyindicies",
                                                 name = "si.gp1a",
                                                 weight = 1,
                                                 data = igfs.SI1[[1]],
                                                 fittype = 'fixedslopeloglinearfit',
                                                 slope=1,
                                                 stocknames = c("codimm")))

gadget_dir_write(gd, gadget_likelihood_component("surveyindicies",
                                                 name = "si.gp2a",
                                                 weight = 1,
                                                 data = igfs.SI2[[1]],
                                                 fittype = 'fixedslopeloglinearfit',
                                                 slope=1,
                                                 stocknames = c("codimm","codmat")))

gadget_dir_write(gd, gadget_likelihood_component("surveyindicies",
                                                 name = "si.gp3a",
                                                 weight = 1,
                                                 data = igfs.SI3[[1]],
                                                 fittype = 'fixedslopeloglinearfit',
                                                 slope=1,
                                                 stocknames = c("codimm","codmat")))
# For plots from Bjarki
# ggplot(seine.ldist,aes(length,count))+geom_line() + facet_wrap(~year+month)
# > ggplot(seine.ldist,aes(length,count))+geom_line() + facet_wrap(~year+month,scale='free_y')
# > ggplot(subset(seine.ldist,year>2010),aes(length,count))+geom_line() + facet_wrap(~year+month,scale='free_y')

#out$catchdist.fleets %>% filter(name=='catches.agedist') %>% group_by(year,step,age) %>% summarise(o.ml = sum(observed*avg.length)/sum(observed), p.ml=sum(predicted*avg.length)/sum(predicted))  %>% ggplot(aes(age,o.ml)) + geom_point()

#Para ver la distribuci?n original
#out$catchdist.fleets %>% filter(name=='ldist.pelago') %>%  ggplot(aes(age,number.x))+geom_point()+facet_wrap(~year+step)