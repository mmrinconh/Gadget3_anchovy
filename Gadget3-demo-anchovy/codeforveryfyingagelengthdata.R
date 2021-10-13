mfdb_dplyr_sample(mdb) %>% 
  dplyr::filter(species == local(defaults$species),age >=0,!is.na(length))  %>% 
  dplyr::select(age,length) %>% 
  dplyr::collect(n=Inf) %>% 
  dplyr::group_by(age) %>% ggplot(aes(length))+geom_histogram()+facet_wrap(~age,ncol=1)

ALKcatches_comp %>% 
  dplyr::filter(!is.na(length), year<=1993)  %>% 
     dplyr::select(year,'1',length) %>% 
    # dplyr::collect(n=Inf) %>% 
     ggplot(aes(length,'1'))+geom_point()#histogram()+facet_wrap(~year)

ALKcatches_def%>%filter(variable=="0") %>% ggplot(aes(year,value))+geom_point()
ALKcatches_def%>%filter(variable=="1") %>% ggplot(aes(year,value))+geom_point()
ALKcatches.ldist%>%filter(age=="0") %>% ggplot(aes(year,count))+geom_point()
ALKcatches.ldist%>%filter(age=="1") %>% ggplot(aes(year,count))+geom_point()
ALKcatches.ldist%>% dplyr::filter(!is.na(length))  %>% 
  dplyr::select(age,length) %>% 
  dplyr::collect(n=Inf) %>% 
  dplyr::group_by(age) %>% ggplot(aes(length))+geom_histogram()+facet_wrap(~age,ncol=1)
str(ALKcatches.ldist$age)
ALKcatches.ldist$age<-as.numeric(as.character(ALKcatches.ldist$age))
ALKcatches.ldist%>%filter(year==1990, month==1) %>% ggplot(aes(length,count))+geom_point()+facet_wrap(~age,ncol=1)

ALKcatches.ldist%>%filter(year==1991, month==1) %>% ggplot(aes(length,count))+geom_point()+facet_wrap(~age,ncol=1)
ALKcatches.ldist%>% dplyr::filter(!is.na(length))  %>% 
  dplyr::select(age,length,count) %>% 
  dplyr::collect(n=Inf) %>% 
  dplyr::group_by(age) %>% ggplot(aes(length,count))+geom_point()+facet_wrap(~age,ncol=1)
ALKcatches.ldist$age<-as.numeric(as.character(ALKcatches.ldist$age))
ALKcatches.ldist$age

mfdb_dplyr_sample(mdb) %>% 
  dplyr::filter(species == local(defaults$species),age >=0,!is.na(length))  %>% 
  dplyr::select(age,length, data_source) %>% 
  dplyr::collect(n=Inf) %>% 
  dplyr::group_by(age) %>% ggplot(aes(length))+geom_histogram()+facet_wrap(data_source~age)



aggdata <- mfdb_sample_count(mdb, c('age','length'), c(list(
   sampling_type='alkcatches_comp',length = mfdb_interval("len", seq(3.5,19.5,0.5)), age=c(0,1,2,3)),
     defaults))

aggdata[[1]]%>% dplyr::filter(!is.na(length))  %>% 
  dplyr::select(age,length,number) %>% 
  dplyr::collect(n=Inf) %>% 
  dplyr::group_by(age) %>% ggplot(aes(length,number))+geom_point()+facet_wrap(~age,ncol=1)

str(aggdata[[1]])


