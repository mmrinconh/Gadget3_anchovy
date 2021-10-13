## Useful constansts

## weight length relationship
# lw.constants <- 
#   mfdb_dplyr_sample(mdb) %>% 
#   filter(species == local(defaults$species),
#          sampling_type == 'IGFS',
#          !is.na(weight)) %>% 
#   select(length,weight) %>% 
#   collect(n=Inf) %>% 
#   lm(log(weight/1e3)~log(length),.) %>% 
#   broom::tidy() %>% 
#   select(estimate)
# ## transport back to right dimension
# lw.constants$estimate[1] <- exp(lw.constants$estimate[1])

## initial conditions sigma
init.sigma <- 
  mfdb_dplyr_sample(mdb) %>% 
  dplyr::filter(species == local(defaults$species),age >=0,!is.na(length))  %>% 
  dplyr::select(age,length,count) %>% 
  dplyr::collect(n=Inf) %>% 
  dplyr::group_by(age) %>% mutate(LC=sum(length*count/sum(count,na.rm=TRUE)), LC2=sum(length*length*count/sum(count,na.rm=TRUE))) %>% mutate(LC2mLC=LC2-(LC*LC))%>% mutate(ms=sqrt(LC2mLC), ml=LC)%>%distinct(age,ml,ms)%>%select(age,ml,ms)
  

#init.sigma$ml<-c(9.76, 13.6, 15.2,16.1) #these are the ones from the original model
#init.sigma$ms<-c(0.5, 0.531, 1, 1.2)
## initial guess for the maturity ogive:
# mat.l50 <- 
#   mfdb_dplyr_sample(mdb) %>% 
#   filter(species == local(defaults$species),
#          sampling_type == 'IGFS',
#          !is.na(maturity_stage)) %>% 
#   select(length,maturity_stage) %>% 
#   group_by(length,maturity_stage) %>% 
#   dplyr::summarise(n=n()) %>% 
#   group_by(length) %>% 
#   dplyr::mutate(p=n/sum(n)) %>% 
#   ungroup() %>% 
#   filter(maturity_stage=='2',p>0.50,length>25) %>% 
#   dplyr::summarise(l50=min(length)) %>% 
#   collect(n=Inf)

if (TRUE){
#  save(mat.l50, file="demo-ling/data/mat.l50.Rdata")
 # save(lw.constants, file="demo-ling/data/lw.constants.Rdata")
  save(init.sigma, file="demo-anchovy/data/init.sigma.Rdata")
}