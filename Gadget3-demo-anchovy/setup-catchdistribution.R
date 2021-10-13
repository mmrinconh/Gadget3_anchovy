## -----------------------------------------------------------------------------
## Catch age and length distributions:
## -----------------------------------------------------------------------------

# minage <- gadget3:::stock_definition(ling_imm, 'minage')
# maxage <- gadget3:::stock_definition(ling_mat, 'maxage')
# minlength <- gadget3:::stock_definition(ling_imm, 'lengthgroups') %>% min()
# maxlength <- gadget3:::stock_definition(ling_mat, 'lengthgroups') %>% max()
# dl <- gadget3:::stock_definition(ling_mat, 'stock__dl') %>% min()

minage <- gadget3:::stock_definition(anch, 'minage')
maxage <- gadget3:::stock_definition(anch, 'maxage')
minlength <- gadget3:::stock_definition(anch, 'lengthgroups') %>% min()
maxlength <- gadget3:::stock_definition(anch, 'lengthgroups') %>% max()
dl <- gadget3:::stock_definition(anch, 'stock__dl') %>% min()

## Query length data to create seine catch distribution components
aggdata <- 
  mfdb_sample_count(mdb, c('age', 'length'), c(list(
  sampling_type='SEA',
  length = mfdb_interval("len", seq(minlength, maxlength, by = dl),
                         open_ended = c("upper","lower")), #, seq(3,22,0.5))),
  age = mfdb_interval("all",c(minage,maxage),
                      open_ended = c("upper","lower"))),
  defaults))



#aggdata[[1]]$area<-NULL
ldist.seine<-aggdata
ldist.seine$`0.0.0.0.0`$age<-NULL
save(ldist.seine, file="demo-anchovy/data/ldist.seine.Rdata")
rm(aggdata)

# ## Query length data to create IGFS catch distribution components
# ldist.igfs <-
#   mfdb_sample_count(mdb,
#                     c('age', 'length'),
#                     c(list(
#                       data_source = 'iceland-ldist',
#                       sampling_type = 'IGFS',
#                       age = mfdb_interval("all",c(minage,maxage),
#                                        open_ended = c("upper","lower")),
#                       length = mfdb_interval("len",
#                                              seq(minlength, maxlength, by = dl),
#                                              open_ended = c("upper","lower"))),
#                       defaults))

# for(i in seq_along(ldist.igfs)){
#   attributes(ldist.igfs[[i]])$age$all <- minage:maxage
#   attr(attributes(ldist.igfs[[i]])$length$len0,'min') <- minlength
# }

## Age seine
aggdata <- mfdb_sample_count(mdb, 
                             c('age','length'), 
                             c(list(sampling_type='alkcatches_comp',
                                    age = mfdb_interval('age',c(minage:maxage),open_ended = c('upper')),
                                    length = mfdb_interval("len",
                                                           seq(minlength, maxlength, by = dl),
                                                           open_ended = c("upper","lower"))),        
                             #length = mfdb_interval("len", seq(3.5,19.5,0.5)), 
                            #age=c(0,1,2,3)),
  defaults))
#aggdata[[1]]$area<-NULL
aldist.seine<-aggdata
save(aldist.seine, file="demo-anchovy/data/aldist.seine.Rdata")
rm(aggdata)

# ## Age IGFS
# aldist.igfs <-
#   mfdb_sample_count(mdb,
#                     c('age', 'length'),
#                     c(list(sampling_type = 'IGFS',
#                            data_source = 'iceland-aldist',
#                            age = mfdb_interval('age',c(minage:maxage),open_ended = c('upper')),
# #                           age = mfdb_interval('age',c(minage:maxage),open_ended = c('upper')),
#                            length = mfdb_interval("len",
#                                                   seq(minlength, maxlength, by = dl),
#                                                   open_ended = c("upper","lower"))),
#                       defaults))
# # for(i in seq_along(aldist.igfs)){
# #   attr(attributes(aldist.igfs[[i]])$length$len0,'min') <- minlength
# # }

# matp.igfs <-
#   mfdb_sample_count(mdb, c('maturity_stage','age','length'),
#                     append(defaults,
#                            list(sampling_type='IGFS',
#                                 age=mfdb_group(mat_ages=minage:maxage),
#                                 length = mfdb_interval('len',
#                                                        seq(minlength, maxlength, by = 2*dl),
#                                                        open_ended = c('lower','upper')),
#                                 maturity_stage = mfdb_group(lingimm = 1, lingmat = 2:5))))
# 


#survey PEL length data
aggdata <- mfdb_sample_count(mdb, c('age','length'), 
                             c(list(  
                               sampling_type='pelago_comp_ld',
                               age = mfdb_interval("all",c(minage,maxage),
                                                   open_ended = c("upper","lower")),
                               length = mfdb_interval("len",
                                                      seq(minlength, maxlength, by = dl),
                                                      open_ended = c("upper","lower"))),
                               
                               
                                      #length = mfdb_interval("len", seq(3,22,0.5))),
  defaults))

#aggdata[[1]]$area<-NULL
ldist.pelago<-aggdata
save(ldist.pelago, file="demo-anchovy/data/ldist.pelago.Rdata")
rm(aggdata)

# ldist.lln <-
#   mfdb_sample_count(mdb,
#                     c('age', 'length'),
#                     c(list(
#                       sampling_type = 'SEA',
#                       data_source = 'iceland-ldist',
#                       gear = c('LLN','HLN'),
#                       age = mfdb_interval("all",c(minage,maxage),
#                                           open_ended = c("upper","lower")),
#                       length = mfdb_interval("len",
#                                              seq(minlength, maxlength, by = dl),
#                                              open_ended = c("upper","lower"))),
#                       defaults))

aggdata <- mfdb_sample_count(mdb, c('age','length'),
                             c(list(  sampling_type='pelago_comp_ald',
                                      age =  mfdb_interval('age',c(minage:maxage),open_ended = c('upper')),
                                      length = mfdb_interval("len",
                                                             seq(minlength, maxlength, by = dl),
                                                             open_ended = c("upper","lower"))),
                                      
                                      #length = mfdb_interval("len", seq(3.5,19.5,0.5)), 
                                      #age=c(0,1,2,3)),
  defaults))

#aggdata[[1]]$area<-NULL
aldist.pelago<-aggdata
save(aldist.pelago, file="demo-anchovy/data/aldist.pelago.Rdata")
rm(aggdata)

# aldist.lln <-
#   mfdb_sample_count(mdb,
#                     c('age', 'length'),
#                     c(list(sampling_type = 'SEA',
#                            data_source = 'iceland-aldist',
#                            gear = c('LLN','HLN'),
#                            age =  mfdb_interval('age',c(minage:maxage),open_ended = c('upper')),
# #                           age =  mfdb_interval('age',c(minage:maxage),open_ended = c('upper')),
#                            length = mfdb_interval("len",
#                                                   seq(minlength, maxlength, by = dl),
#                                                   open_ended = c("upper","lower"))),
#                       defaults))

#ojo, estoy quitando los bichos de la edad cero de la aldecocadiz
aggdata <- mfdb_sample_count(mdb, c('age','length'), 
                             c(list(  sampling_type='ecocadiz_comp_ald',
                                      age=mfdb_interval('age',c(1:maxage),open_ended = c('upper')),
                                      length = mfdb_interval("len",
                                                             seq(minlength, maxlength, by = dl),
                                                             open_ended = c("upper","lower"))),
                                      #length = mfdb_interval("len", seq(3.5,19.5,0.5)), 
                                     # age=c(1,2,3)),
                               
  defaults))
#aggdata[[1]]$area<-NULL
aldist.ecocadiz<-aggdata
save(aldist.ecocadiz, file="demo-anchovy/data/aldist.ecocadiz.Rdata")
rm(aggdata)

# aldist.bmt <-
#   mfdb_sample_count(mdb,
#                     c('age', 'length'),
#                     c(list(sampling_type = 'SEA',
#                            data_source = 'iceland-aldist',
#                            gear=c('BMT','NPT','DSE','PSE','PGT','SHT'),
#                            age = mfdb_interval('age',c(minage:maxage),open_ended = c('upper')),
#                            #                           age = mfdb_interval('age',c(minage:maxage),open_ended = c('upper')),
#                            length = mfdb_interval("len",
#                                                   seq(minlength, maxlength, by = dl),
#                                                   open_ended = c("upper","lower"))),
#                       defaults))


#ojo estoy quitando de la length distribution los bichos de edad 0
aggdata <- mfdb_sample_count(mdb, c('age','length'), 
                             c(list(  sampling_type='ecocadiz_comp_ld', 
                                      #length = mfdb_interval("len", seq(3,22,0.5))),
                                      age = mfdb_interval("all",c(1,maxage),
                                                          open_ended = c("upper","lower")),
                                      length = mfdb_interval("len",
                                                             seq(minlength, maxlength, by = dl),
                                                             open_ended = c("upper","lower"))),
  defaults))
#aggdata[[1]]$area<-NULL
ldist.ecocadiz<-aggdata
save(ldist.ecocadiz, file="demo-anchovy/data/ldist.ecocadiz.Rdata")
rm(aggdata)



# ldist.bmt <-
#   mfdb_sample_count(mdb,
#                     c('age', 'length'),
#                     c(list(
#                       sampling_type = 'SEA',
#                       data_source = 'iceland-ldist',
#                       gear=c('BMT','NPT','DSE','PSE','PGT','SHT'),
#                       age = mfdb_interval("all",c(minage,maxage),
#                                           open_ended = c("upper","lower")),
#                       length = mfdb_interval("len",
#                                              seq(minlength, maxlength, by = dl),
#                                              open_ended = c("upper","lower"))),
#                       defaults))
# 
# 
# ldist.gil <-
#   mfdb_sample_count(mdb, c('age', 'length'),
#                     c(list(
#                       data_source = 'iceland-ldist',
#                       sampling_type = 'SEA',
#                       gear='GIL',
#                       age = mfdb_interval("all",c(minage,maxage),
#                                           open_ended = c("lower")),
#                       length = mfdb_interval("len",
#                                              seq(minlength, maxlength, by = dl),
#                                              open_ended = c("upper","lower"))),
#                       defaults))
# 
# 
# aldist.gil <-
#   mfdb_sample_count(mdb, c('age', 'length'),
#                     c(list(sampling_type = 'SEA',
#                            data_source = 'iceland-aldist',
#                            gear='GIL',
#                            age =  mfdb_interval('age',c(minage:maxage),open_ended = c('upper')),
# #                           age =  mfdb_interval('age',c(minage:maxage),open_ended = c('upper')),
#                            length = mfdb_interval("len",
#                                                   seq(minlength, maxlength, by = dl),
#                                                   open_ended = c("upper","lower"))),
#                       defaults))
# 
# 
# if (TRUE){
#   save(aldist.bmt,file = 'demo-ling/data/aldist.bmt.Rdata')
#   save(aldist.lln,file = 'demo-ling/data/aldist.lln.Rdata')
#   save(aldist.igfs,file = 'demo-ling/data/aldist.igfs.Rdata')
#   save(aldist.gil,file = 'demo-ling/data/aldist.gil.Rdata')
#   save(ldist.bmt,file = 'demo-ling/data/ldist.bmt.Rdata')
#   save(ldist.lln,file = 'demo-ling/data/ldist.lln.Rdata')
#   save(ldist.igfs,file = 'demo-ling/data/ldist.igfs.Rdata')
#   save(ldist.gil,file = 'demo-ling/data/ldist.gil.Rdata')
#   save(matp.igfs,file = 'demo-ling/data/matp.igfs.Rdata')
# }
