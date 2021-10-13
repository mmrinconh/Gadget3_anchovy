## -----------------------------------------------------------------------------
##
## Fleet actions:
##
## -----------------------------------------------------------------------------

## Bounded parameters for fleet suitabilities
# anch
# data
# ;year	step	value  
# 1979	1	1
# 1988	1	#anchalpha88
# 2001	1	#anchalpha01
# 
# anch
# data
# ;year	step	value  
# 1979	1	7
# 1988	1	#anchL5088
# 2001    1	#anchL5001

#switch	value	lower	upper	optimise
# anchalpha88	1	0.1	1.5	1
# anchalpha01	1	0.1	1.5	1
# anchL5088	8	1	20	1
# anchL5001	10	6	15	1
# constanteco	random	0.2	2.2	1
# l50eco		10	2	20	1
# constantpel	random	0.2	1.5	1
# l50pel		10	2	20	1


fleet_bounds <- list(
  
  'seine1.l50' = list(lower = 1, upper = 20),
  'seine1.alpha' = list(lower = 0.1, upper = 1.5),
  
  'seine2.l50' = list(lower = 6, upper = 15),
  'seine2.alpha' = list(lower = 0.1, upper = 1.5),
  
  'ECO.l50' = list(lower = 2, upper = 20),
  'ECO.alpha' = list(lower = 0.2, upper = 2.2),
  
  'PEL.l50' = list(lower = 2, upper = 20),
  'PEL.alpha' = list(lower = 0.2, upper = 1.5)
  
)

## create fleet actions
fleet_actions <-
  list(
    seine1 %>%
      g3a_predate_fleet(list(anch),
                        suitabilities = list(
                          anch = g3_suitability_exponentiall50(~g3_param('seine1.alpha'),
                                                                   bounded_param(anch, "seine1.l50", fleet_bounds, id = 'species'))),
                          #ling_mat = g3_suitability_exponentiall50(bounded_param(ling_mat, "lln.alpha", fleet_bounds, id = 'species'),
                           #                                        bounded_param(ling_mat, "lln.l50", fleet_bounds, id = 'species'))),
                          #ojo I changed totalfleet by numberfleet 
                        catchability_f = g3a_predate_catchability_numberfleet(g3_timeareadata('seine1_landings', seine_landings[[1]] %>%
                                                                                           select(year,step,area,total_weight=number) %>%
                                                                                               filter(year<2001)%>%
                                                                                                mutate(area = as.numeric(area),
                                                                                                      step = as.numeric(step),
                                                                                                      year = as.numeric(year))))),
    seine2 %>%
      g3a_predate_fleet(list(anch),
                        suitabilities = list(
                          anch = g3_suitability_exponentiall50(~g3_param('seine2.alpha'),
                                                               bounded_param(anch, "seine2.l50", fleet_bounds, id = 'species'))),
                        #ling_mat = g3_suitability_exponentiall50(bounded_param(ling_mat, "lln.alpha", fleet_bounds, id = 'species'),
                        #                                        bounded_param(ling_mat, "lln.l50", fleet_bounds, id = 'species'))),
                        #ojo I changed totalfleet by numberfleet 
                        catchability_f = g3a_predate_catchability_numberfleet(g3_timeareadata('seine2_landings', seine_landings[[1]] %>%
                                                                                           select(year,step,area,total_weight=number) %>%
                                                                                                filter(year>2000)%>%
                                                                                                mutate(area = as.numeric(area),
                                                                                                  step = as.numeric(step),
                                                                                                  year = as.numeric(year))))),
    
    
    ECO %>%
      g3a_predate_fleet(list(anch),
                        suitabilities = list(
                         # ling_imm = g3_suitability_exponentiall50(bounded_param(ling_imm, "bmt.alpha", fleet_bounds, id = 'species'),
                                                                  # bounded_param(ling_imm, "bmt.l50", fleet_bounds, id = 'species')),
                          anch = g3_suitability_exponentiall50(bounded_param(anch, "ECO.alpha", fleet_bounds, id = 'species'),
                                                                   bounded_param(anch, "ECO.l50", fleet_bounds, id = 'species'))),
                        catchability_f = g3a_predate_catchability_totalfleet(g3_timeareadata('ECO_landings', ECO_landings[[1]] %>%
                                                                                             select(year,step,area,total_weight=number)%>%
                                                                                               mutate(area = as.numeric(area),
                                                                                                      step = as.numeric(step),
                                                                                                      year = as.numeric(year))))),
    PEL %>%
      g3a_predate_fleet(list(anch),
                        suitabilities = list(
                         # ling_imm = g3_suitability_exponentiall50(bounded_param(ling_imm, "gil.alpha", fleet_bounds, id = 'species'),
                          #                                         bounded_param(ling_imm, "gil.l50", fleet_bounds, id = 'species')),
                          anch = g3_suitability_exponentiall50(bounded_param(anch, "PEL.alpha", fleet_bounds, id = 'species'),
                                                                   bounded_param(anch, "PEL.l50", fleet_bounds, id = 'species'))),
                        catchability_f = g3a_predate_catchability_totalfleet(g3_timeareadata('PEL_landings', PEL_landings[[1]] %>%
                                                                                             select(year,step,area,total_weight=number)%>% 
                                                                                               mutate(area = as.numeric(area),
                                                                                                      step = as.numeric(step),
                                                                                                      year = as.numeric(year))))))
    # foreign  %>%
    #   g3a_predate_fleet(list(ling_imm, ling_mat),
    #                     suitabilities = list(
    #                       ling_imm = g3_suitability_exponentiall50(bounded_param(ling_imm, "lln.alpha", fleet_bounds, id = 'species'),
    #                                                                bounded_param(ling_imm, "lln.l50", fleet_bounds, id = 'species')),
    #                       ling_mat = g3_suitability_exponentiall50(bounded_param(ling_mat, "lln.alpha", fleet_bounds, id = 'species'),
    #                                                                bounded_param(ling_mat, "lln.l50", fleet_bounds, id = 'species'))),
    #                     catchability_f = g3a_predate_catchability_totalfleet(g3_timeareadata('foreign_landings', foreign_landings[[1]] %>%
    #                                                                                            mutate(area = as.numeric(area),
    #                                                                                                   step = as.numeric(step),
    #                                                                                                   year = as.numeric(year))))),
    # 
    # igfs %>%
    #   g3a_predate_fleet(list(ling_imm, ling_mat),
    #                     suitabilities = list(
    #                       ling_imm = g3_suitability_exponentiall50(bounded_param(ling_imm, "igfs.alpha", fleet_bounds, id = 'species'),
    #                                                                bounded_param(ling_imm, "igfs.l50", fleet_bounds, id = 'species')),
    #                       ling_mat = g3_suitability_exponentiall50(bounded_param(ling_mat, "igfs.alpha", fleet_bounds, id = 'species'),
    #                                                                bounded_param(ling_mat, "igfs.l50", fleet_bounds, id = 'species'))),
    #                     catchability_f = g3a_predate_catchability_totalfleet(g3_timeareadata('igfs_landings', igfs_landings %>%
    #                                                                                            mutate(area = as.numeric(area),
    #                                                                                                   step = as.numeric(step),
    #                                                                                                   year = as.numeric(year))))))


# fleet_actions <-
#   list(
#     lln %>%
#       g3a_predate_fleet(list(ling_imm, ling_mat),
#                         suitabilities = list(
#                           ling_imm = g3_suitability_exponentiall50(~g3_param('lln.alpha'),
#                                                                    bounded_param(ling_imm, "lln.l50", fleet_bounds, id = 'species')),
#                           ling_mat = g3_suitability_exponentiall50(bounded_param(ling_mat, "lln.alpha", fleet_bounds, id = 'species'),
#                                                                    bounded_param(ling_mat, "lln.l50", fleet_bounds, id = 'species'))),
#                         catchability_f = g3a_predate_catchability_totalfleet(g3_timeareadata('lln_landings', lln_landings[[1]] %>%
#                                                                                                mutate(area = as.numeric(area),
#                                                                                                       step = as.numeric(step),
#                                                                                                       year = as.numeric(year))))),
#     bmt %>%
#       g3a_predate_fleet(list(ling_imm, ling_mat),
#                         suitabilities = list(
#                           ling_imm = g3_suitability_exponentiall50(bounded_param(ling_imm, "bmt.alpha", fleet_bounds, id = 'species'),
#                                                                    bounded_param(ling_imm, "bmt.l50", fleet_bounds, id = 'species')),
#                           ling_mat = g3_suitability_exponentiall50(bounded_param(ling_mat, "bmt.alpha", fleet_bounds, id = 'species'),
#                                                                    bounded_param(ling_mat, "bmt.l50", fleet_bounds, id = 'species'))),
#                         catchability_f = g3a_predate_catchability_totalfleet(g3_timeareadata('bmt_landings', bmt_landings[[1]] %>%
#                                                                                                mutate(area = as.numeric(area),
#                                                                                                       step = as.numeric(step),
#                                                                                                       year = as.numeric(year))))),
#     gil %>%
#       g3a_predate_fleet(list(ling_imm, ling_mat),
#                         suitabilities = list(
#                           ling_imm = g3_suitability_exponentiall50(bounded_param(ling_imm, "gil.alpha", fleet_bounds, id = 'species'),
#                                                                    bounded_param(ling_imm, "gil.l50", fleet_bounds, id = 'species')),
#                           ling_mat = g3_suitability_exponentiall50(bounded_param(ling_mat, "gil.alpha", fleet_bounds, id = 'species'),
#                                                                    bounded_param(ling_mat, "gil.l50", fleet_bounds, id = 'species'))),
#                         catchability_f = g3a_predate_catchability_totalfleet(g3_timeareadata('gil_landings', gil_landings[[1]] %>%
#                                                                                                mutate(area = as.numeric(area),
#                                                                                                       step = as.numeric(step),
#                                                                                                       year = as.numeric(year))))),
#     foreign  %>%
#       g3a_predate_fleet(list(ling_imm, ling_mat),
#                         suitabilities = list(
#                           ling_imm = g3_suitability_exponentiall50(bounded_param(ling_imm, "lln.alpha", fleet_bounds, id = 'species'),
#                                                                    bounded_param(ling_imm, "lln.l50", fleet_bounds, id = 'species')),
#                           ling_mat = g3_suitability_exponentiall50(bounded_param(ling_mat, "lln.alpha", fleet_bounds, id = 'species'),
#                                                                    bounded_param(ling_mat, "lln.l50", fleet_bounds, id = 'species'))),
#                         catchability_f = g3a_predate_catchability_totalfleet(g3_timeareadata('foreign_landings', foreign_landings[[1]] %>%
#                                                                                                mutate(area = as.numeric(area),
#                                                                                                       step = as.numeric(step),
#                                                                                                       year = as.numeric(year))))),
# 
#     igfs %>%
#       g3a_predate_fleet(list(ling_imm, ling_mat),
#                         suitabilities = list(
#                           ling_imm = g3_suitability_exponentiall50(bounded_param(ling_imm, "igfs.alpha", fleet_bounds, id = 'species'),
#                                                                    bounded_param(ling_imm, "igfs.l50", fleet_bounds, id = 'species')),
#                           ling_mat = g3_suitability_exponentiall50(bounded_param(ling_mat, "igfs.alpha", fleet_bounds, id = 'species'),
#                                                                    bounded_param(ling_mat, "igfs.l50", fleet_bounds, id = 'species'))),
#                         catchability_f = g3a_predate_catchability_totalfleet(g3_timeareadata('igfs_landings', igfs_landings %>%
#                                                                                                mutate(area = as.numeric(area),
#                                                                                                       step = as.numeric(step),
#                                                                                                       year = as.numeric(year))))))
# 
# 
# 
