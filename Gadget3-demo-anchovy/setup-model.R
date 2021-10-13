## -----------------------------------------------------------------------------
##
## SETUP MODEL
##
## -----------------------------------------------------------------------------

# -----------------------------
# Define bounded parameters
# -----------------------------

## MODEL PARAMETERS
# List containing the parameter name, its lower and upper bounds.
# The function "g3_stock_param" is a wrapper for g3_param that inserts the species/stock name into the parameter reference
# if lower and upper are NULL, then the parameter will be unbounded e.g. ~g3_param("ling.k")
# if the lower and upper parameters are integers a reference to a bounded parameter will be created e.g. ~bounded(g3_param(ling.k), lower, upper)
# "g3_stock_param_table" is an equivalent function that creates a reference to a table of parameters e.g. g3_param_table(ling.init, minage:maxage)


model_params <- list(
  
  ## Initial conditions:
  #init0	1	1e-06	2	1
  # #init1	1	1e-06	3	1	
  # init2	1	1e-06	1.5	1
  # init3	1	1e-07	1.1	1
  
  #from anch.init
  # 0 	1	(* 60000 #init0 )	1	9.76	0.5	1
  #       1 	1	(* 60000  #init1 )	1	13.6	0.531	1
  #             2 	1	(* 60000  #init2 )	1	15.2	1	1
  #                   3 	1	(* 0.000001 #init3)	1	16.1	1.2	1
 # 'init0' = list(lower = 1e-06, upper = 2),
  #'init1' = list(lower = 1e-06, upper = 3),
  #'init2' = list(lower = 1e-06, upper = 1.5),
  #'init3' = list(lower = 1e-07, upper = 1.1),
  # alpha	3.128958e-06	1e-07	10	0
  # beta	3.277667619	1e-04	10	0
  'walpha' = list(lower = 1e-07, upper = 10),
  'wbeta' = list(lower = 1e-04, upper = 10),
  # 'walpha' = list(lower = NULL, upper = NULL),
  # 'wbeta' = list(lower = NULL, upper = NULL),
  # 'init.F' = list(lower = 0.2, upper = 0.8),
   'init.sd' = list(lower = NULL, upper = NULL),
   'scalar' = list(lower = 1, upper = 100),      ## Scalar for initial abundance and recruitment (all stocks)
  'init' = list(lower = 0.001, upper = 200),
  'renew' = list(lower = 0.001, upper = 200),
  
  
  
  
  ## Renewal:
  # recl	8	3	15	1
  # sdrecl	1	0.5	4	1
  # reclm	5	3	15	1
  # sdreclm	1	0.5	3	1
  # sdrecl4	1	0.5	4	1
  # sdrecl2	           1	0.5	4	1
  'reclm'=list(lower = 3, upper = 15),
  'sdreclm'=list(lower = 0.5, upper = 3),
  'recl'=list(lower = 3, upper = 15),
  'sdrecl'=list(lower = 0.5, upper = 4),
  'sdrecl4'=list(lower = 0.5, upper = 4),
  'sdrecl2'=list(lower = 0.5, upper = 4),
  # 'rec.sd' = list(lower = 1, upper = 5),
  # 'recl' = list(lower = -5, upper = 30),
  ## Growth:
  # Linf	19	14	30	1
  # kappa	0.89	0.05	1.2	1
  # bbeta	1	0.01	5000	1
  'Linf' = list(lower = 14, upper = 30),
  #'kappa'= list(lower = 0.05, upper = 1.2),
  'K'= list(lower = 50, upper = 120), #this is the same as kappa but later is multiplied by 0.01 that helps to optimize better
  #'K' = list(lower = 40, upper = 120),      #What is this, is it growth rate, isn't so big????     it goes mul  
  'bbin' = list(lower = 0.01, upper = 5000),          
  
  # 'Linf' = list(lower = 150, upper = 200),          
  # 'K' = list(lower = 40, upper = 120),             
  # 'bbin' = list(lower = 1, upper = 1000),          
  
  ## Maturity:
  # 'mat1' = list(lower = NULL, upper = NULL),
  # 'mat2' = list(lower = 20, upper = 120),                 
  # 'mat.a' = list(lower = 0.5, upper = 2), 
  # 'mat.a50' = list(lower = min(gadget3:::stock_definition(ling_imm, 'minage'),
  #                               gadget3:::stock_definition(ling_mat, 'minage')),
  #                   upper = max(gadget3:::stock_definition(ling_imm, 'maxage'),
  #                               gadget3:::stock_definition(ling_mat, 'maxage'))),
  
  ## Mortality
  #'M' = list(lower = NULL, upper = NULL), #????
  
  ## Age bounds as symbols
 anch_minage = as.symbol(paste0(anch$name, "__minage")),
anch_maxage = as.symbol(paste0(anch$name, "__maxage"))
 # mat_minage = as.symbol(paste0(ling_mat$name, "__minage")),
  #mat_maxage = as.symbol(paste0(ling_mat$name, "__maxage"))

)

## OTHER
# INITIAL ABUNDANCE
init_abund <- gadget3:::f_substitute(~scalar * bounded(
  g3_param_table(init, expand.grid(age = seq(anch__minage,
                                          anch__maxage))), lower, upper),
  c(model_params,
    model_params$init,
    scalar = bounded_param(anch, "scalar", model_params, id = 'species'),
    init = paste(stock_species(anch), "init", sep=".")))

# RENEWAL
renewal <- gadget3:::f_substitute(~scalar * bounded(
  g3_param_table(renew, expand.grid(cur_year = seq(start_year, end_year),cur_step=seq(1:length(defaults$timestep)))), lower, upper),
  #to setup a time-variable action
  c(model_params,
    model_params$renew,
    scalar = bounded_param(anch, "scalar", model_params, id = 'species'),
    renew = paste(stock_species(anch), "renew", sep=".")))

renewalsd <- #gadget3:::f_substitute(
  ~bounded(g3_param_table('sdrecl', expand.grid(cur_step=seq(1:length(defaults$timestep)))),0.01, 4)

M<-
~g3_param_table('M', expand.grid(age = seq(anch__minage,
                                          anch__maxage)))

  #to setup a time-variable action
  # c(model_params,
  #   model_params$renew,
  #   scalar = bounded_param(anch, "scalar", model_params, id = 'species'),
  #   renew = paste(stock_species(anch), "renew", sep=".")))



## Ensure that old fish are not immature
# a50 is bounded
# prop_m_age <- 
#   gadget3:::f_substitute(~ 1/(1 + exp(-mat.a*(age - a50))), 
#                          list('a50' = bounded_param(ling_imm, "mat.a50", model_params, id = 'species'),
#                               'mat.a' = bounded_param(ling_imm, "mat.a", model_params, id = 'species')))

## mean length is estimated based on a Von B relationship used for immature and mature
mean_l <-
  gadget3:::f_substitute(~Linf * (1 - exp(-1 * K * (age - (1 + log(1 - recl/Linf)/K)))),
                         list('recl' = bounded_param(anch, "recl", model_params, id = 'species'), 
                              'Linf' = bounded_param(anch, "Linf", model_params, id = 'species'), 
                              'K' = gadget3:::f_substitute(~0.001 * K, 
                                                           list(K = bounded_param(anch, "K", model_params, id = 'species')))))

anch_actions <- list(
  
  g3a_initialconditions_normalparam(anch,
                                    # NB: area & age factor together (gadget2 just multiplied them)
                                    # initial abundance at age is 1e4 * q
                                    factor_f =
                                      gadget3:::f_substitute(
                                        ~init_abund * exp(-1 * (M + init.F) * (age - anch__minage)),# * (1 - prop_m_age),
                                        c(model_params,
                                          init_abund = init_abund,
                                          M = M,
                                         # prop_m_age = prop_m_age,
                                          init.F = ~bounded(g3_param('anch.init.F'),0,3))),
                                          #M = bounded_table(anch, "M", model_params))),
                                    mean_f = mean_l,
                                    stddev_f = bounded_table(anch, "init.sd", model_params),
                                    alpha_f = bounded_param(anch, "walpha", model_params),
                                    beta_f = bounded_param(anch, "wbeta", model_params)),
  
  g3a_renewal_normalparam(anch,
                          factor_f = renewal,
                          # gadget3:::f_substitute(~rec*exp(-g3_param_table("lingimm.M",
                          #                                                 data.frame(age = seq(ling_imm__minage, ling_imm__maxage)))),
                          #                        list(rec=ling_init_abund)),
                          mean_f = mean_l,
                          stddev_f = bounded_param(anch, "sdrecl", model_params, id = 'species'),
                          alpha_f = bounded_param(anch, "walpha", model_params),
                          beta_f = bounded_param(anch, "wbeta", model_params),
                          #run_f = gadget3:::f_substitute(~cur_step == 1 && age == anch_minage && cur_time > 0, model_params)),
                          run_f = gadget3:::f_substitute(~cur_step == c(2,3,4) && age == anch_minage && cur_year < 1989 && cur_time > 0, model_params)),
  #cur_time bigger than zero to guarantee that model does not go to initial conditions and mess things up 
  g3a_renewal_normalparam(anch,
                          factor_f = renewal,
                          # gadget3:::f_substitute(~rec*exp(-g3_param_table("lingimm.M",
                          #                                                 data.frame(age = seq(ling_imm__minage, ling_imm__maxage)))),
                          #                        list(rec=ling_init_abund)),
                          mean_f = mean_l,
                          stddev_f = bounded_param(anch, "sdrecl", model_params, id = 'species'),
                          alpha_f = bounded_param(anch, "walpha", model_params),
                          beta_f = bounded_param(anch, "wbeta", model_params),
                          run_f = gadget3:::f_substitute(~cur_step == 1 && age == anch_minage && cur_year>1988, model_params)),
  
  # g3a_growmature(ling_imm,
  #                impl_f = g3a_grow_impl_bbinom(
  #                  g3a_grow_lengthvbsimple(bounded_param(ling_imm, "Linf", model_params, id = 'species'),
  #                                          gadget3:::f_substitute(~0.001 * K, 
  #                                                                 list(K = bounded_param(ling_imm, "K", model_params, id = 'species')))),      
  #                  g3a_grow_weightsimple(bounded_param(ling_imm, "walpha", model_params),  
  #                                        bounded_param(ling_imm, "wbeta", model_params)),   
  #                  beta_f = bounded_param(ling_imm, "bbin", model_params, id = 'species'),
  #                  maxlengthgroupgrowth = mlgg),
  #                maturity_f = g3a_mature_continuous(
  #                  alpha = gadget3:::f_substitute(~(0.001 * exp(mat1)), 
  #                                                 list(mat1 = bounded_param(ling_imm, "mat1", model_params, id = 'species'))),
  #                  l50 = bounded_param(ling_imm, "mat2", model_params, id = 'species')),
  #                output_stocks = list(ling_mat)),
  # 
  g3a_naturalmortality(anch,
                       g3a_naturalmortality_exp(M)), 
  
 # g3a_age(ling_imm,
    #      output_stocks = list(ling_mat)),
  list())

## MATURE STOCK
# ling_mat_actions <- list(
#   g3a_initialconditions_normalparam(ling_mat,
#                                     # NB: area & age factor together (gadget2 just multiplied them)
#                                     factor_f =
#                                       gadget3:::f_substitute(~init_abund *
#                                                                exp(-1 * (g3_param_table(M, data.frame(age = seq(imm_minage, mat_maxage))) +
#                                                                            init.F) * (age - imm_minage)) * prop_m_age,
#                                                              c(model_params,
#                                                                init_abund = init_abund,
#                                                                prop_m_age = prop_m_age,
#                                                                init.F = bounded_param(ling_mat, "init.F", model_params, id = 'species'),
#                                                                M = paste(ling_mat$name, "M", sep="."))),
#                                     mean_f = mean_l,
#                                     stddev_f = bounded_table(ling_mat, "init.sd", model_params),
#                                     alpha_f = bounded_param(ling_mat, "walpha", model_params),
#                                     beta_f = bounded_param(ling_mat, "wbeta", model_params)),
#   
#   g3a_growmature(ling_mat,
#                  impl_f = g3a_grow_impl_bbinom(
#                    g3a_grow_lengthvbsimple(bounded_param(ling_mat, "Linf", model_params, id = 'species'),
#                                            gadget3:::f_substitute(~0.001 * K, 
#                                                                   list(K = bounded_param(ling_mat, "K", model_params, id = 'species')))),  
#                    g3a_grow_weightsimple(bounded_param(ling_mat, "walpha", model_params),  
#                                          bounded_param(ling_mat, "wbeta", model_params)),   
#                    beta_f = bounded_param(ling_mat, "bbin", model_params, id = 'species'),
#                    maxlengthgroupgrowth = mlgg)),
#   
#   g3a_naturalmortality(ling_mat,
#                        g3a_naturalmortality_exp(bounded_table(ling_mat, "M", model_params))),
#   
#   g3a_age(ling_mat),
#   list())



