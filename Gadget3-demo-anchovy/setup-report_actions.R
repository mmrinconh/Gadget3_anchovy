## -----------------------------------------------------------------------------
## Set up report actions:

# Disaggregated report storage for *_imm stock (we store with same age/step/length as ling itself)
anch_report <- g3s_clone(anch, 'anch_report') %>%
  g3s_time(year = local(year_range), step = 1:4)

# Disaggregated report storage for *_mat (we store with same age/step/length as ling itself)
#mat_report <- g3s_clone(ling_mat, 'mat_report') %>%
 # g3s_time(year = local(year_range), step = 1:4)


report_actions <- list(
  
  # Report numbers
  g3a_report_stock(anch_report, anch, 
                   gadget3:::f_substitute(~stock_ss(x), list(x=as.symbol(paste0("anch", "__num"))))),
  #g3a_report_stock(mat_report, ling_mat, 
   #               gadget3:::f_substitute(~stock_ss(x), list(x=as.symbol(paste0("ling_mat", "__num"))))),
  
  # Report mean weight
  #g3a_report_stock(imm_report, ling_imm,
    #               gadget3:::f_substitute(~stock_ss(x), list(x=as.symbol(paste0("ling_imm", "__wgt"))))),
  #g3a_report_stock(mat_report, ling_mat,
   #                gadget3:::f_substitute(~stock_ss(x), list(x=as.symbol(paste0("ling_mat", "__wgt"))))),

  # Report biomass caught by surveys
  g3a_report_stock(anch_report, anch,
                   gadget3:::f_substitute(~stock_ss(x), list(x=as.symbol(paste0("anch", "__ECO"))))),
  g3a_report_stock(anch_report, anch,
                   gadget3:::f_substitute(~stock_ss(x), list(x=as.symbol(paste0("anch", "__PEL"))))),

  # Report biomass caught by commercial, longline
  g3a_report_stock(anch_report, anch,
                   gadget3:::f_substitute(~stock_ss(x), list(x=as.symbol(paste0("anch", "__seine1"))))),
  g3a_report_stock(anch_report, anch,
                   gadget3:::f_substitute(~stock_ss(x), list(x=as.symbol(paste0("anch", "__seine2"))))),

  # # Bottom trawl
  # g3a_report_stock(imm_report, ling_imm,
  #                 gadget3:::f_substitute(~stock_ss(x), list(x=as.symbol(paste0("ling_imm", "__bmt"))))),
  # g3a_report_stock(mat_report, ling_mat,
  #                 gadget3:::f_substitute(~stock_ss(x), list(x=as.symbol(paste0("ling_mat", "__bmt"))))),
  # 
  # # Gillnet
  # g3a_report_stock(imm_report, ling_imm,
  #                  gadget3:::f_substitute(~stock_ss(x), list(x=as.symbol(paste0("ling_imm", "__gil"))))),
  # g3a_report_stock(mat_report, ling_mat,
  #                  gadget3:::f_substitute(~stock_ss(x), list(x=as.symbol(paste0("ling_mat", "__gil"))))),
  # 
  # # Foreign
  # g3a_report_stock(imm_report, ling_imm,
  #                  gadget3:::f_substitute(~stock_ss(x), list(x=as.symbol(paste0("ling_imm", "__foreign"))))),
  # g3a_report_stock(mat_report, ling_mat,
  #                  gadget3:::f_substitute(~stock_ss(x), list(x=as.symbol(paste0("ling_mat", "__foreign"))))),

  # Recruitment numbers and weight
  g3a_report_stock(anch_report, anch,
                   gadget3:::f_substitute(~stock_ss(x), list(x=as.symbol(paste0("anch", "__renewalnum"))))),
  g3a_report_stock(anch_report, anch,
                   gadget3:::f_substitute(~stock_ss(x), list(x=as.symbol(paste0("anch", "__renewalwgt"))))),

  # Report suitability (survey)
  g3a_report_stock(anch_report, anch,
                   gadget3:::f_substitute(~stock_ss(x), list(x=as.symbol(paste0("anch", "__suit_ECO"))))),
  g3a_report_stock(anch_report, anch,
                   gadget3:::f_substitute(~stock_ss(x), list(x=as.symbol(paste0("anch", "__suit_PEL"))))))
