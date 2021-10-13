## -----------------------------------------------------------------------------
## Collect catches by fleet:
## -----------------------------------------------------------------------------

## Surveys
# igfs_landings <- 
#   structure(data.frame(year=defaults$year,step=2,area=1,total_weight=1),
#             area_group = mfdb_group(`1` = 1))

## Surveys
aggdata<-mfdb_sample_count(mdb,NULL,c(
  
  list(vessel=mfdb_group(seine="1.RSH"),sampling_type='ecocadiz_bio'),
  defaults))
#aggdata[[1]]$area<-NULL
aggdata[[1]]$number<-1
ECO_landings<-aggdata
if (TRUE){
save(ECO_landings, file="demo-anchovy/data/ECO_landings.Rdata")
rm(aggdata)
}

aggdata<-mfdb_sample_count(mdb,NULL,c(
  
  list(vessel=mfdb_group(seine="1.RSH"),sampling_type='pelago_bio'),
  defaults))
#aggdata[[1]]$area<-NULL
aggdata[[1]]$number<-1
PEL_landings<-aggdata
if (TRUE){
save(PEL_landings, file="demo-anchovy/data/PEL_landings.Rdata")
rm(aggdata)
}


## Commercial
# lln_landings <- mfdb_sample_totalweight(mdb, NULL, c(list(
#   gear=c('HLN','LLN'),
#   sampling_type = 'LND',
#   species = defaults$species),
#   defaults))
# 
# bmt_landings <- mfdb_sample_totalweight(mdb, NULL, c(list(
#   gear=c('BMT','NPT','DSE','PSE','PGT','SHT'),
#   sampling_type = 'LND',
#   species = defaults$species),
#   defaults))
# 
# gil_landings <- mfdb_sample_totalweight(mdb, NULL, c(list(
#   gear='GIL',
#   sampling_type = 'LND',
#   species = defaults$species),
#   defaults))
# 
# foreign_landings <-
#   mfdb_sample_totalweight(mdb, NULL,
#                           c(list(
#                             sampling_type = 'FLND',
#                             data_source = c('lods.foreign.landings','statlant.foreign.landings'),
#                             species = defaults$species),
#                             defaults))

## Commercial
aggdata<-mfdb_sample_count(mdb,NULL,c(
  
  list(vessel=mfdb_group(all="2.CDA")),
  defaults))
#aggdata[[1]]$area<-NULL
seine_landings<-aggdata
if (TRUE){
save(seine_landings, file="demo-anchovy/data/seine_landings.Rdata")
rm(aggdata)
}



# if (TRUE){
#   save(lln_landings, file="demo-ling/data/lln_landings.Rdata")
#   save(bmt_landings, file="demo-ling/data/bmt_landings.Rdata")
#   save(gil_landings, file="demo-ling/data/gil_landings.Rdata")
#   save(foreign_landings, file="demo-ling/data/foreign_landings.Rdata")
#   save(igfs_landings, file="demo-ling/data/igfs_landings.Rdata")
# }


