## -----------------------------------------------------------------------------
##
## Setup likelihood 
##
## -----------------------------------------------------------------------------

## weird inconsistencies in Gadget
#aldist.seine[[1]]$step
#aldist.igfs[[1]]$step <- 2
#ldist.igfs[[1]]$step <- 2
#matp.igfs[[1]]$step <- 2

nll_breakdown <- TRUE  # Turn to TRUE to get per-step nll
lik_report <- TRUE


#needs to put some length in attributes but it also can be solved in the setup-indices.r code by specifying the length 
attributes(ecocadiz.bioindex[[1]])$length$all <- c(3,22)
attributes(pelago.bioindex[[1]])$length$all <- c(3,22)



anch_likelihood_actions <- list(
  g3l_understocking(list(anch), nll_breakdown = nll_breakdown, weight = 1e6),
  
  g3l_catchdistribution(
    'ldist_seine',
    ldist.seine[[1]], #%>% ## tow == 60228 was wrongly assigned, omit samples from that quarter
      #filter(!(year==1993&step==4)),
    fleets = list(seine1,seine2),
    stocks = list(anch),
    g3l_distribution_sumofsquares(),
    nll_breakdown = nll_breakdown,
    report = lik_report),
  
  g3l_catchdistribution(
    'aldist_seine',
    aldist.seine[[1]],# %>%  ## only 20 fish aged taken in those quarters
     # filter(year>1998,!((year==2002|year==2003)&step==2)),
    fleets = list(seine1,seine2),
    stocks = list(anch),
    g3l_distribution_sumofsquares(),
    nll_breakdown = nll_breakdown,
    report = lik_report),
  
  g3l_catchdistribution(
    'ldist_ecocadiz',
    (ldist.ecocadiz[[1]]), #%>% ## to few samples (<=20 fish lengths)
    #   filter(!(year==1982&step==4),
    #          !(year==1984&step==1),
    #          !(year==1992&step==4),
    #          !(year==1994&step==1),
    #          !(year==1998&step==3),
    #          !(year==1989&step==3)),
    fleets = list(ECO),
    stocks = list(anch),
    g3l_distribution_sumofsquares(),
    nll_breakdown = nll_breakdown,     report = lik_report),
  
  g3l_catchdistribution(
    'aldist_ecocadiz',
    (aldist.ecocadiz[[1]]),# %>%
      #filter(year>1998),
    fleets = list(ECO),
    stocks = list(anch),
    g3l_distribution_sumofsquares(),
    nll_breakdown = nll_breakdown,     report = lik_report),
  
  g3l_catchdistribution(
    'ldist_pelago',
    (ldist.pelago[[1]]), #%>% ## only one fish lengthmeasured
      #filter(!(year==2005&step==2)),
    fleets = list(PEL),
    stocks = list(anch),
    g3l_distribution_sumofsquares(),
    nll_breakdown = nll_breakdown,     report = lik_report),
  
  g3l_catchdistribution(
    'aldist_pelago',
    (aldist.pelago[[1]]), #%>%
      #filter(year>1998),
    fleets = list(PEL),
    stocks = list(anch),
    g3l_distribution_sumofsquares(),
    nll_breakdown = nll_breakdown,     report = lik_report),
  
  # g3l_catchdistribution(
  #   'ldist_igfs',
  #   (ldist.igfs[[1]]),
  #   fleets = list(igfs),
  #   stocks = list(ling_imm, ling_mat),
  #   g3l_distribution_sumofsquares(),
  #   nll_breakdown = nll_breakdown,     report = lik_report),
  # 
  # g3l_catchdistribution(
  #   'aldist_igfs',
  #   (aldist.igfs[[1]]) %>% ## only two age samples in 1989
  #     filter(year>1998),
  #   fleets = list(igfs),
  #   stocks = list(ling_imm, ling_mat),
  #   g3l_distribution_sumofsquares(),
  #   nll_breakdown = nll_breakdown,     report = lik_report),
  # 
  # g3l_catchdistribution(
  #   'matp_igfs',
  #   (matp.igfs[[1]] %>%
  #      rename(stock = maturity_stage) %>%
  #      mutate(stock = recode(as.factor(stock), lingimm = "ling_imm", lingmat = "ling_mat"))),
  #   fleets = list(igfs),
  #   stocks = list(ling_imm, ling_mat),
  #   g3l_distribution_sumofsquares(),
  #   nll_breakdown = nll_breakdown,     report = lik_report),

  #ecocadiz
  g3l_abundancedistribution(
    'ecocadiz_bioindex',
    (ecocadiz.bioindex[[1]]),
    fleets = list(),
    stocks = list(anch),
    g3l_distribution_surveyindices_log(alpha = g3_stock_param(anch, "eco_alpha1", id = 'species'),
                                       beta = 1),
    nll_breakdown = nll_breakdown,     report = lik_report),
  
#  attributes(pelago.bioindex[[1]])$length$all <- c(3,22)
  g3l_abundancedistribution(
    'pelago_bioindex',
    (pelago.bioindex[[1]]),
    fleets = list(),
    stocks = list(anch),
    g3l_distribution_surveyindices_log(alpha = g3_stock_param(anch, "pel_alpha2", id = 'species'),
                                       beta = 1),
    nll_breakdown = nll_breakdown,     report = lik_report),
  
  # g3l_abundancedistribution(
  #   'si_igfs_si2b',
  #   (igfs.SI2b[[1]]),
  #   fleets = list(),
  #   stocks = list(ling_imm, ling_mat),
  #   g3l_distribution_surveyindices_log(alpha = g3_stock_param(ling_imm, "si_alpha3", id = 'species'),
  #                                      beta = 1),
  #   nll_breakdown = nll_breakdown,     report = lik_report),
  # 
  # g3l_abundancedistribution(
  #   'si_igfs_si3a',
  #   (igfs.SI3a[[1]]),
  #   fleets = list(),
  #   stocks = list(ling_imm, ling_mat),
  #   g3l_distribution_surveyindices_log(alpha = g3_stock_param(ling_imm, "si_alpha4", id = 'species'),
  #                                      beta = 1),
  #   nll_breakdown = nll_breakdown,     report = lik_report),
  # 
  # g3l_abundancedistribution(
  #   'si_igfs_si3b',
  #   (igfs.SI3b[[1]]),
  #   fleets = list(),
  #   stocks = list(ling_imm, ling_mat),
  #   g3l_distribution_surveyindices_log(alpha = g3_stock_param(ling_imm, "si_alpha5", id = 'species'),
  #                                      beta = 1),
  #   nll_breakdown = nll_breakdown,     report = lik_report),
  # 
  # g3l_abundancedistribution(
  #   'si_igfs_si3c',
  #   (igfs.SI3b[[1]]),
  #   fleets = list(),
  #   stocks = list(ling_imm, ling_mat),
  #   g3l_distribution_surveyindices_log(alpha = g3_stock_param(ling_imm, "si_alpha6", id = 'species'),
  #                                      beta = 1),
  #   nll_breakdown = nll_breakdown,     report = lik_report),
  # 
  # g3l_abundancedistribution(
  #   'si_igfs_si3d',
  #   (igfs.SI3d[[1]]),
  #   fleets = list(),
  #   stocks = list(ling_imm, ling_mat),
  #   g3l_distribution_surveyindices_log(alpha = g3_stock_param(ling_imm, "si_alpha7", id = 'species'),
  #                                      beta = 1),
  #   nll_breakdown = nll_breakdown,     report = lik_report),
  
  list()
)
