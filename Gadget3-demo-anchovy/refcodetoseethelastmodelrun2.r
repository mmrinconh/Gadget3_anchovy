param=anch_param
#function (param) 
{
  stopifnot("anch.Linf" %in% names(param))
  stopifnot("anch.K" %in% names(param))
  stopifnot("anch.recl" %in% names(param))
  stopifnot("anch.init.sd.0" %in% names(param))
  stopifnot("anch.init.sd.1" %in% names(param))
  stopifnot("anch.init.sd.2" %in% names(param))
  stopifnot("anch.init.sd.3" %in% names(param))
  stopifnot("anch.scalar" %in% names(param))
  stopifnot("anch.init.0" %in% names(param))
  stopifnot("anch.init.1" %in% names(param))
  stopifnot("anch.init.2" %in% names(param))
  stopifnot("anch.init.3" %in% names(param))
  stopifnot("M.0" %in% names(param))
  stopifnot("M.1" %in% names(param))
  stopifnot("M.2" %in% names(param))
  stopifnot("M.3" %in% names(param))
  stopifnot("anch.init.F" %in% names(param))
  stopifnot("anch.walpha" %in% names(param))
  stopifnot("anch.wbeta" %in% names(param))
  stopifnot("anch.ECO.alpha" %in% names(param))
  stopifnot("anch.ECO.l50" %in% names(param))
  stopifnot("anch.PEL.alpha" %in% names(param))
  stopifnot("anch.PEL.l50" %in% names(param))
  stopifnot("seine1.alpha" %in% names(param))
  stopifnot("anch.seine1.l50" %in% names(param))
  stopifnot("seine2.alpha" %in% names(param))
  stopifnot("anch.seine2.l50" %in% names(param))
  stopifnot("anch.sdrecl" %in% names(param))
  stopifnot("anch.renew.1988.1" %in% names(param))
  stopifnot("anch.renew.1989.1" %in% names(param))
  stopifnot("anch.renew.1990.1" %in% names(param))
  stopifnot("anch.renew.1991.1" %in% names(param))
  stopifnot("anch.renew.1992.1" %in% names(param))
  stopifnot("anch.renew.1993.1" %in% names(param))
  stopifnot("anch.renew.1994.1" %in% names(param))
  stopifnot("anch.renew.1995.1" %in% names(param))
  stopifnot("anch.renew.1996.1" %in% names(param))
  stopifnot("anch.renew.1997.1" %in% names(param))
  stopifnot("anch.renew.1998.1" %in% names(param))
  stopifnot("anch.renew.1999.1" %in% names(param))
  stopifnot("anch.renew.2000.1" %in% names(param))
  stopifnot("anch.renew.2001.1" %in% names(param))
  stopifnot("anch.renew.2002.1" %in% names(param))
  stopifnot("anch.renew.2003.1" %in% names(param))
  stopifnot("anch.renew.2004.1" %in% names(param))
  stopifnot("anch.renew.2005.1" %in% names(param))
  stopifnot("anch.renew.2006.1" %in% names(param))
  stopifnot("anch.renew.2007.1" %in% names(param))
  stopifnot("anch.renew.2008.1" %in% names(param))
  stopifnot("anch.renew.2009.1" %in% names(param))
  stopifnot("anch.renew.2010.1" %in% names(param))
  stopifnot("anch.renew.2011.1" %in% names(param))
  stopifnot("anch.renew.2012.1" %in% names(param))
  stopifnot("anch.renew.2013.1" %in% names(param))
  stopifnot("anch.renew.2014.1" %in% names(param))
  stopifnot("anch.renew.2015.1" %in% names(param))
  stopifnot("anch.renew.2016.1" %in% names(param))
  stopifnot("anch.renew.2017.1" %in% names(param))
  stopifnot("anch.renew.2018.1" %in% names(param))
  stopifnot("anch.renew.2019.1" %in% names(param))
  stopifnot("anch.renew.2020.1" %in% names(param))
  stopifnot("anch.renew.2021.1" %in% names(param))
  stopifnot("anch.renew.1988.2" %in% names(param))
  stopifnot("anch.renew.1989.2" %in% names(param))
  stopifnot("anch.renew.1990.2" %in% names(param))
  stopifnot("anch.renew.1991.2" %in% names(param))
  stopifnot("anch.renew.1992.2" %in% names(param))
  stopifnot("anch.renew.1993.2" %in% names(param))
  stopifnot("anch.renew.1994.2" %in% names(param))
  stopifnot("anch.renew.1995.2" %in% names(param))
  stopifnot("anch.renew.1996.2" %in% names(param))
  stopifnot("anch.renew.1997.2" %in% names(param))
  stopifnot("anch.renew.1998.2" %in% names(param))
  stopifnot("anch.renew.1999.2" %in% names(param))
  stopifnot("anch.renew.2000.2" %in% names(param))
  stopifnot("anch.renew.2001.2" %in% names(param))
  stopifnot("anch.renew.2002.2" %in% names(param))
  stopifnot("anch.renew.2003.2" %in% names(param))
  stopifnot("anch.renew.2004.2" %in% names(param))
  stopifnot("anch.renew.2005.2" %in% names(param))
  stopifnot("anch.renew.2006.2" %in% names(param))
  stopifnot("anch.renew.2007.2" %in% names(param))
  stopifnot("anch.renew.2008.2" %in% names(param))
  stopifnot("anch.renew.2009.2" %in% names(param))
  stopifnot("anch.renew.2010.2" %in% names(param))
  stopifnot("anch.renew.2011.2" %in% names(param))
  stopifnot("anch.renew.2012.2" %in% names(param))
  stopifnot("anch.renew.2013.2" %in% names(param))
  stopifnot("anch.renew.2014.2" %in% names(param))
  stopifnot("anch.renew.2015.2" %in% names(param))
  stopifnot("anch.renew.2016.2" %in% names(param))
  stopifnot("anch.renew.2017.2" %in% names(param))
  stopifnot("anch.renew.2018.2" %in% names(param))
  stopifnot("anch.renew.2019.2" %in% names(param))
  stopifnot("anch.renew.2020.2" %in% names(param))
  stopifnot("anch.renew.2021.2" %in% names(param))
  stopifnot("anch.renew.1988.3" %in% names(param))
  stopifnot("anch.renew.1989.3" %in% names(param))
  stopifnot("anch.renew.1990.3" %in% names(param))
  stopifnot("anch.renew.1991.3" %in% names(param))
  stopifnot("anch.renew.1992.3" %in% names(param))
  stopifnot("anch.renew.1993.3" %in% names(param))
  stopifnot("anch.renew.1994.3" %in% names(param))
  stopifnot("anch.renew.1995.3" %in% names(param))
  stopifnot("anch.renew.1996.3" %in% names(param))
  stopifnot("anch.renew.1997.3" %in% names(param))
  stopifnot("anch.renew.1998.3" %in% names(param))
  stopifnot("anch.renew.1999.3" %in% names(param))
  stopifnot("anch.renew.2000.3" %in% names(param))
  stopifnot("anch.renew.2001.3" %in% names(param))
  stopifnot("anch.renew.2002.3" %in% names(param))
  stopifnot("anch.renew.2003.3" %in% names(param))
  stopifnot("anch.renew.2004.3" %in% names(param))
  stopifnot("anch.renew.2005.3" %in% names(param))
  stopifnot("anch.renew.2006.3" %in% names(param))
  stopifnot("anch.renew.2007.3" %in% names(param))
  stopifnot("anch.renew.2008.3" %in% names(param))
  stopifnot("anch.renew.2009.3" %in% names(param))
  stopifnot("anch.renew.2010.3" %in% names(param))
  stopifnot("anch.renew.2011.3" %in% names(param))
  stopifnot("anch.renew.2012.3" %in% names(param))
  stopifnot("anch.renew.2013.3" %in% names(param))
  stopifnot("anch.renew.2014.3" %in% names(param))
  stopifnot("anch.renew.2015.3" %in% names(param))
  stopifnot("anch.renew.2016.3" %in% names(param))
  stopifnot("anch.renew.2017.3" %in% names(param))
  stopifnot("anch.renew.2018.3" %in% names(param))
  stopifnot("anch.renew.2019.3" %in% names(param))
  stopifnot("anch.renew.2020.3" %in% names(param))
  stopifnot("anch.renew.2021.3" %in% names(param))
  stopifnot("anch.renew.1988.4" %in% names(param))
  stopifnot("anch.renew.1989.4" %in% names(param))
  stopifnot("anch.renew.1990.4" %in% names(param))
  stopifnot("anch.renew.1991.4" %in% names(param))
  stopifnot("anch.renew.1992.4" %in% names(param))
  stopifnot("anch.renew.1993.4" %in% names(param))
  stopifnot("anch.renew.1994.4" %in% names(param))
  stopifnot("anch.renew.1995.4" %in% names(param))
  stopifnot("anch.renew.1996.4" %in% names(param))
  stopifnot("anch.renew.1997.4" %in% names(param))
  stopifnot("anch.renew.1998.4" %in% names(param))
  stopifnot("anch.renew.1999.4" %in% names(param))
  stopifnot("anch.renew.2000.4" %in% names(param))
  stopifnot("anch.renew.2001.4" %in% names(param))
  stopifnot("anch.renew.2002.4" %in% names(param))
  stopifnot("anch.renew.2003.4" %in% names(param))
  stopifnot("anch.renew.2004.4" %in% names(param))
  stopifnot("anch.renew.2005.4" %in% names(param))
  stopifnot("anch.renew.2006.4" %in% names(param))
  stopifnot("anch.renew.2007.4" %in% names(param))
  stopifnot("anch.renew.2008.4" %in% names(param))
  stopifnot("anch.renew.2009.4" %in% names(param))
  stopifnot("anch.renew.2010.4" %in% names(param))
  stopifnot("anch.renew.2011.4" %in% names(param))
  stopifnot("anch.renew.2012.4" %in% names(param))
  stopifnot("anch.renew.2013.4" %in% names(param))
  stopifnot("anch.renew.2014.4" %in% names(param))
  stopifnot("anch.renew.2015.4" %in% names(param))
  stopifnot("anch.renew.2016.4" %in% names(param))
  stopifnot("anch.renew.2017.4" %in% names(param))
  stopifnot("anch.renew.2018.4" %in% names(param))
  stopifnot("anch.renew.2019.4" %in% names(param))
  stopifnot("anch.renew.2020.4" %in% names(param))
  stopifnot("anch.renew.2021.4" %in% names(param))
  stopifnot("anch.eco_alpha1" %in% names(param))
  stopifnot("adist_surveyindices_log_ecocadiz_bioindex_weight" %in% 
              names(param))
  stopifnot("anch.pel_alpha2" %in% names(param))
  stopifnot("adist_surveyindices_log_pelago_bioindex_weight" %in% 
              names(param))
  stopifnot("cdist_sumofsquares_aldist_ecocadiz_weight" %in% 
              names(param))
  stopifnot("cdist_sumofsquares_aldist_pelago_weight" %in% 
              names(param))
  stopifnot("cdist_sumofsquares_aldist_seine_weight" %in% 
              names(param))
  stopifnot("cdist_sumofsquares_ldist_ecocadiz_weight" %in% 
              names(param))
  stopifnot("cdist_sumofsquares_ldist_pelago_weight" %in% 
              names(param))
  stopifnot("cdist_sumofsquares_ldist_seine_weight" %in% names(param))
  assert_msg <- function (expr, message) 
  {
    if (isFALSE(expr)) 
      warning(message)
  }
  Rprintf <- function (...) 
  {
    cat(sprintf(...))
  }
  bounded <- function (x, a, b) 
  {
    a + (b - a)/(1 + exp(x))
  }
  nvl <- function (...) 
  {
    for (i in seq_len(...length())) if (!is.null(...elt(i))) 
      return(...elt(i))
    return(NULL)
  }
  inttypelookup_getdefault <- function (lookup, key, def) 
  {
    out <- if (is.environment(lookup)) 
      lookup[[as.character(key)]]
    else lookup[key][[1]]
    return(if (is.null(out)) def else out)
  }
  avoid_zero_vec <- function (a) 
  {
    (pmax(a * 1000, 0) + log1p(exp(pmin(a * 1000, 0) - pmax(a * 
                                                              1000, 0))))/1000
  }
  logspace_add_vec <- function (a, b) 
  {
    pmax(a, b) + log1p(exp(pmin(a, b) - pmax(a, b)))
  }
  ratio_add_vec <- function (orig_vec, orig_amount, new_vec, 
                             new_amount) 
  {
    (orig_vec * orig_amount + new_vec * new_amount)/avoid_zero_vec(orig_amount + 
                                                                     new_amount)
  }
  intintlookup_getdefault <- function (lookup, key, def) 
  {
    out <- if (is.environment(lookup)) 
      lookup[[as.character(key)]]
    else lookup[key][[1]]
    return(if (is.null(out)) def else out)
  }
  g3_matrix_vec <- function (tf, vec) 
  {
    return((tf %*% vec)[, 1])
  }
  avoid_zero <- function (a) 
  {
    (pmax(a * 1000, 0) + log1p(exp(pmin(a * 1000, 0) - pmax(a * 
                                                              1000, 0))))/1000
  }
  surveyindices_linreg <- function (N, I, fixed_alpha, fixed_beta) 
  {
    meanI <- mean(I)
    meanN <- mean(N)
    beta <- if (is.na(fixed_beta)) 
      sum((I - meanI) * (N - meanN))/avoid_zero(sum((N - 
                                                       meanN)^2))
    else fixed_beta
    alpha <- if (is.na(fixed_alpha)) 
      meanI - beta * meanN
    else fixed_alpha
    return(c(alpha = alpha, beta = beta))
  }
  #I put this here to  have the model_data object
  environment(anch_model) -> tmp
  model_data <-get('model_data',envir = tmp) #%>% get("times_cdist_sumofsquares_ldist_seine_obs__keys" , 
  
  cur_time <- -1L
  nll <- 0
  step_lengths <- model_data$step_lengths
  end_year <- 2021L
  start_year <- 1988L
  total_steps <- length(step_lengths) * (end_year - start_year + 
                                           0L) + length(step_lengths) - 1L
  cur_year <- 0L
  step_count <- length(step_lengths)
  cur_step <- 0L
  cur_step_final <- FALSE
  anch__minage <- 0L
  anch__maxage <- 3L
  anch__area <- 1L
  anch__num <- array(0, dim = c(39L, 1L, 4L), dimnames = list(
    c("len3", "len3.5", "len4", "len4.5", "len5", "len5.5", 
      "len6", "len6.5", "len7", "len7.5", "len8", "len8.5", 
      "len9", "len9.5", "len10", "len10.5", "len11", "len11.5", 
      "len12", "len12.5", "len13", "len13.5", "len14", "len14.5", 
      "len15", "len15.5", "len16", "len16.5", "len17", "len17.5", 
      "len18", "len18.5", "len19", "len19.5", "len20", "len20.5", 
      "len21", "len21.5", "len22"), "1", c("age0", "age1", 
                                           "age2", "age3")))
  anch__midlen <- model_data$anch__midlen
  anch__wgt <- model_data$anch__wgt
  anch__totalpredate <- array(dim = c(39L, 1L, 4L), dimnames = list(
    c("len3", "len3.5", "len4", "len4.5", "len5", "len5.5", 
      "len6", "len6.5", "len7", "len7.5", "len8", "len8.5", 
      "len9", "len9.5", "len10", "len10.5", "len11", "len11.5", 
      "len12", "len12.5", "len13", "len13.5", "len14", "len14.5", 
      "len15", "len15.5", "len16", "len16.5", "len17", "len17.5", 
      "len18", "len18.5", "len19", "len19.5", "len20", "len20.5", 
      "len21", "len21.5", "len22"), "1", c("age0", "age1", 
                                           "age2", "age3")))
  ECO__catch <- array(dim = 1L, dimnames = list("1"))
  PEL__catch <- array(dim = 1L, dimnames = list("1"))
  seine1__catch <- array(dim = 1L, dimnames = list("1"))
  seine1__catchnum <- array(dim = 1L, dimnames = list("1"))
  seine2__catch <- array(dim = 1L, dimnames = list("1"))
  seine2__catchnum <- array(dim = 1L, dimnames = list("1"))
  anch__ECO <- array(dim = c(39L, 1L, 4L), dimnames = list(
    c("len3", "len3.5", "len4", "len4.5", "len5", "len5.5", 
      "len6", "len6.5", "len7", "len7.5", "len8", "len8.5", 
      "len9", "len9.5", "len10", "len10.5", "len11", "len11.5", 
      "len12", "len12.5", "len13", "len13.5", "len14", "len14.5", 
      "len15", "len15.5", "len16", "len16.5", "len17", "len17.5", 
      "len18", "len18.5", "len19", "len19.5", "len20", "len20.5", 
      "len21", "len21.5", "len22"), "1", c("age0", "age1", 
                                           "age2", "age3")))
  ECO__area <- 1L
  anch__suit_ECO <- array(0, dim = c(39L, 1L, 4L), dimnames = list(
    c("len3", "len3.5", "len4", "len4.5", "len5", "len5.5", 
      "len6", "len6.5", "len7", "len7.5", "len8", "len8.5", 
      "len9", "len9.5", "len10", "len10.5", "len11", "len11.5", 
      "len12", "len12.5", "len13", "len13.5", "len14", "len14.5", 
      "len15", "len15.5", "len16", "len16.5", "len17", "len17.5", 
      "len18", "len18.5", "len19", "len19.5", "len20", "len20.5", 
      "len21", "len21.5", "len22"), "1", c("age0", "age1", 
                                           "age2", "age3")))
  anch__PEL <- array(dim = c(39L, 1L, 4L), dimnames = list(
    c("len3", "len3.5", "len4", "len4.5", "len5", "len5.5", 
      "len6", "len6.5", "len7", "len7.5", "len8", "len8.5", 
      "len9", "len9.5", "len10", "len10.5", "len11", "len11.5", 
      "len12", "len12.5", "len13", "len13.5", "len14", "len14.5", 
      "len15", "len15.5", "len16", "len16.5", "len17", "len17.5", 
      "len18", "len18.5", "len19", "len19.5", "len20", "len20.5", 
      "len21", "len21.5", "len22"), "1", c("age0", "age1", 
                                           "age2", "age3")))
  PEL__area <- 1L
  anch__suit_PEL <- array(0, dim = c(39L, 1L, 4L), dimnames = list(
    c("len3", "len3.5", "len4", "len4.5", "len5", "len5.5", 
      "len6", "len6.5", "len7", "len7.5", "len8", "len8.5", 
      "len9", "len9.5", "len10", "len10.5", "len11", "len11.5", 
      "len12", "len12.5", "len13", "len13.5", "len14", "len14.5", 
      "len15", "len15.5", "len16", "len16.5", "len17", "len17.5", 
      "len18", "len18.5", "len19", "len19.5", "len20", "len20.5", 
      "len21", "len21.5", "len22"), "1", c("age0", "age1", 
                                           "age2", "age3")))
  anch__seine1 <- array(dim = c(39L, 1L, 4L), dimnames = list(
    c("len3", "len3.5", "len4", "len4.5", "len5", "len5.5", 
      "len6", "len6.5", "len7", "len7.5", "len8", "len8.5", 
      "len9", "len9.5", "len10", "len10.5", "len11", "len11.5", 
      "len12", "len12.5", "len13", "len13.5", "len14", "len14.5", 
      "len15", "len15.5", "len16", "len16.5", "len17", "len17.5", 
      "len18", "len18.5", "len19", "len19.5", "len20", "len20.5", 
      "len21", "len21.5", "len22"), "1", c("age0", "age1", 
                                           "age2", "age3")))
  seine1__area <- 1L
  anch__suit_seine1 <- array(0, dim = c(39L, 1L, 4L), dimnames = list(
    c("len3", "len3.5", "len4", "len4.5", "len5", "len5.5", 
      "len6", "len6.5", "len7", "len7.5", "len8", "len8.5", 
      "len9", "len9.5", "len10", "len10.5", "len11", "len11.5", 
      "len12", "len12.5", "len13", "len13.5", "len14", "len14.5", 
      "len15", "len15.5", "len16", "len16.5", "len17", "len17.5", 
      "len18", "len18.5", "len19", "len19.5", "len20", "len20.5", 
      "len21", "len21.5", "len22"), "1", c("age0", "age1", 
                                           "age2", "age3")))
  anch__seine2 <- array(dim = c(39L, 1L, 4L), dimnames = list(
    c("len3", "len3.5", "len4", "len4.5", "len5", "len5.5", 
      "len6", "len6.5", "len7", "len7.5", "len8", "len8.5", 
      "len9", "len9.5", "len10", "len10.5", "len11", "len11.5", 
      "len12", "len12.5", "len13", "len13.5", "len14", "len14.5", 
      "len15", "len15.5", "len16", "len16.5", "len17", "len17.5", 
      "len18", "len18.5", "len19", "len19.5", "len20", "len20.5", 
      "len21", "len21.5", "len22"), "1", c("age0", "age1", 
                                           "age2", "age3")))
  seine2__area <- 1L
  anch__suit_seine2 <- array(0, dim = c(39L, 1L, 4L), dimnames = list(
    c("len3", "len3.5", "len4", "len4.5", "len5", "len5.5", 
      "len6", "len6.5", "len7", "len7.5", "len8", "len8.5", 
      "len9", "len9.5", "len10", "len10.5", "len11", "len11.5", 
      "len12", "len12.5", "len13", "len13.5", "len14", "len14.5", 
      "len15", "len15.5", "len16", "len16.5", "len17", "len17.5", 
      "len18", "len18.5", "len19", "len19.5", "len20", "len20.5", 
      "len21", "len21.5", "len22"), "1", c("age0", "age1", 
                                           "age2", "age3")))
  inttypelookup_zip <- function (keys, values) 
  {
    if (max(keys) < 1e+05) {
      out <- list()
      out[as.integer(keys)] <- as.list(values)
    }
    else {
      out <- as.list(values)
      names(out) <- keys
      out <- as.environment(out)
    }
    return(out)
  }
  ECO_landings__keys <- model_data$ECO_landings__keys
  ECO_landings__values <- model_data$ECO_landings__values
  ECO_landings__lookup <- inttypelookup_zip(ECO_landings__keys, 
                                            ECO_landings__values)
  PEL_landings__keys <- model_data$PEL_landings__keys
  PEL_landings__values <- model_data$PEL_landings__values
  PEL_landings__lookup <- inttypelookup_zip(PEL_landings__keys, 
                                            PEL_landings__values)
  seine1_landings__keys <- model_data$seine1_landings__keys
  seine1_landings__values <- model_data$seine1_landings__values
  seine1_landings__lookup <- inttypelookup_zip(seine1_landings__keys, 
                                               seine1_landings__values)
  seine2_landings__keys <- model_data$seine2_landings__keys
  seine2_landings__values <- model_data$seine2_landings__values
  seine2_landings__lookup <- inttypelookup_zip(seine2_landings__keys, 
                                               seine2_landings__values)
  anch__consratio <- array(dim = c(39L, 1L, 4L), dimnames = list(
    c("len3", "len3.5", "len4", "len4.5", "len5", "len5.5", 
      "len6", "len6.5", "len7", "len7.5", "len8", "len8.5", 
      "len9", "len9.5", "len10", "len10.5", "len11", "len11.5", 
      "len12", "len12.5", "len13", "len13.5", "len14", "len14.5", 
      "len15", "len15.5", "len16", "len16.5", "len17", "len17.5", 
      "len18", "len18.5", "len19", "len19.5", "len20", "len20.5", 
      "len21", "len21.5", "len22"), "1", c("age0", "age1", 
                                           "age2", "age3")))
  anch__overconsumption <- structure(0, desc = "Total overconsumption of anch")
  cur_step_size <- step_lengths[[1]]/12
  anch__renewalnum <- array(0, dim = c(39L, 1L, 4L), dimnames = list(
    c("len3", "len3.5", "len4", "len4.5", "len5", "len5.5", 
      "len6", "len6.5", "len7", "len7.5", "len8", "len8.5", 
      "len9", "len9.5", "len10", "len10.5", "len11", "len11.5", 
      "len12", "len12.5", "len13", "len13.5", "len14", "len14.5", 
      "len15", "len15.5", "len16", "len16.5", "len17", "len17.5", 
      "len18", "len18.5", "len19", "len19.5", "len20", "len20.5", 
      "len21", "len21.5", "len22"), "1", c("age0", "age1", 
                                           "age2", "age3")))
  anch__renewalwgt <- array(0, dim = c(39L, 1L, 4L), dimnames = list(
    c("len3", "len3.5", "len4", "len4.5", "len5", "len5.5", 
      "len6", "len6.5", "len7", "len7.5", "len8", "len8.5", 
      "len9", "len9.5", "len10", "len10.5", "len11", "len11.5", 
      "len12", "len12.5", "len13", "len13.5", "len14", "len14.5", 
      "len15", "len15.5", "len16", "len16.5", "len17", "len17.5", 
      "len18", "len18.5", "len19", "len19.5", "len20", "len20.5", 
      "len21", "len21.5", "len22"), "1", c("age0", "age1", 
                                           "age2", "age3")))
  intintlookup_zip <- function (keys, values) 
  {
    if (max(keys) < 1e+05) {
      out <- list()
      out[as.integer(keys)] <- as.list(values)
    }
    else {
      out <- as.list(values)
      names(out) <- keys
      out <- as.environment(out)
    }
    return(out)
  }
  adist_surveyindices_log_ecocadiz_bioindex_model__keys <- structure(1L, 
                                                                     .Dim = 1L)
  adist_surveyindices_log_ecocadiz_bioindex_model__values <- structure(1L, 
                                                                       .Dim = 1L)
  adist_surveyindices_log_ecocadiz_bioindex_model__lookup <- intintlookup_zip(adist_surveyindices_log_ecocadiz_bioindex_model__keys, 
                                                                              adist_surveyindices_log_ecocadiz_bioindex_model__values)
  times_adist_surveyindices_log_ecocadiz_bioindex_model__keys <- model_data$times_adist_surveyindices_log_ecocadiz_bioindex_model__keys
  times_adist_surveyindices_log_ecocadiz_bioindex_model__values <- model_data$times_adist_surveyindices_log_ecocadiz_bioindex_model__values
  times_adist_surveyindices_log_ecocadiz_bioindex_model__lookup <- intintlookup_zip(times_adist_surveyindices_log_ecocadiz_bioindex_model__keys, 
                                                                                    times_adist_surveyindices_log_ecocadiz_bioindex_model__values)
  adist_surveyindices_log_ecocadiz_bioindex_model__num <- array(0, 
                                                                dim = c(1L, 13L, 1L), dimnames = list("all", c("2004-01", 
                                                                                                               "2006-01", "2007-02", "2009-02", "2010-02", "2013-02", 
                                                                                                               "2014-02", "2015-02", "2016-02", "2017-02", "2018-02", 
                                                                                                               "2019-02", "2020-02"), "1"))
  anch_adist_surveyindices_log_ecocadiz_bioindex_model_lgmatrix <- model_data$anch_adist_surveyindices_log_ecocadiz_bioindex_model_lgmatrix
  adist_surveyindices_log_ecocadiz_bioindex_model__minareas <- structure(c(`1` = 1L), 
                                                                         .Dim = 1L, .Dimnames = list("1"))
  adist_surveyindices_log_ecocadiz_bioindex_obs__keys <- structure(1L, 
                                                                   .Dim = 1L)
  adist_surveyindices_log_ecocadiz_bioindex_obs__values <- structure(1L, 
                                                                     .Dim = 1L)
  adist_surveyindices_log_ecocadiz_bioindex_obs__lookup <- intintlookup_zip(adist_surveyindices_log_ecocadiz_bioindex_obs__keys, 
                                                                            adist_surveyindices_log_ecocadiz_bioindex_obs__values)
  times_adist_surveyindices_log_ecocadiz_bioindex_obs__keys <- model_data$times_adist_surveyindices_log_ecocadiz_bioindex_obs__keys
  times_adist_surveyindices_log_ecocadiz_bioindex_obs__values <- model_data$times_adist_surveyindices_log_ecocadiz_bioindex_obs__values
  times_adist_surveyindices_log_ecocadiz_bioindex_obs__lookup <- intintlookup_zip(times_adist_surveyindices_log_ecocadiz_bioindex_obs__keys, 
                                                                                  times_adist_surveyindices_log_ecocadiz_bioindex_obs__values)
  adist_surveyindices_log_ecocadiz_bioindex_model__params <- model_data$adist_surveyindices_log_ecocadiz_bioindex_model__params
  adist_surveyindices_log_ecocadiz_bioindex_obs__num <- model_data$adist_surveyindices_log_ecocadiz_bioindex_obs__num
  as_integer <- as.integer
  total_years <- end_year - start_year + 0L + 1L
  nll_adist_surveyindices_log_ecocadiz_bioindex__num <- array(0, 
                                                              dim = c(time = as_integer(total_steps + 1)), dimnames = list(time = sprintf("%d-%02d", 
                                                                                                                                          rep(seq(start_year, start_year + total_years - 1L), 
                                                                                                                                              each = length(step_lengths)), rep(seq_along(step_lengths), 
                                                                                                                                                                                times = total_years))))
  nll_adist_surveyindices_log_ecocadiz_bioindex__weight <- array(0, 
                                                                 dim = c(time = as_integer(total_steps + 1)), dimnames = list(time = sprintf("%d-%02d", 
                                                                                                                                             rep(seq(start_year, start_year + total_years - 1L), 
                                                                                                                                                 each = length(step_lengths)), rep(seq_along(step_lengths), 
                                                                                                                                                                                   times = total_years))))
  adist_surveyindices_log_pelago_bioindex_model__keys <- structure(1L, 
                                                                   .Dim = 1L)
  adist_surveyindices_log_pelago_bioindex_model__values <- structure(1L, 
                                                                     .Dim = 1L)
  adist_surveyindices_log_pelago_bioindex_model__lookup <- intintlookup_zip(adist_surveyindices_log_pelago_bioindex_model__keys, 
                                                                            adist_surveyindices_log_pelago_bioindex_model__values)
  times_adist_surveyindices_log_pelago_bioindex_model__keys <- model_data$times_adist_surveyindices_log_pelago_bioindex_model__keys
  times_adist_surveyindices_log_pelago_bioindex_model__values <- model_data$times_adist_surveyindices_log_pelago_bioindex_model__values
  times_adist_surveyindices_log_pelago_bioindex_model__lookup <- intintlookup_zip(times_adist_surveyindices_log_pelago_bioindex_model__keys, 
                                                                                  times_adist_surveyindices_log_pelago_bioindex_model__values)
  adist_surveyindices_log_pelago_bioindex_model__num <- array(0, 
                                                              dim = c(1L, 19L, 1L), dimnames = list("all", c("1998-04", 
                                                                                                             "2000-04", "2001-04", "2002-04", "2005-01", "2006-01", 
                                                                                                             "2007-01", "2008-01", "2009-01", "2010-01", "2013-01", 
                                                                                                             "2014-01", "2015-01", "2016-01", "2017-01", "2018-01", 
                                                                                                             "2019-01", "2020-01", "2021-01"), "1"))
  anch_adist_surveyindices_log_pelago_bioindex_model_lgmatrix <- model_data$anch_adist_surveyindices_log_pelago_bioindex_model_lgmatrix
  adist_surveyindices_log_pelago_bioindex_model__minareas <- structure(c(`1` = 1L), 
                                                                       .Dim = 1L, .Dimnames = list("1"))
  adist_surveyindices_log_pelago_bioindex_obs__keys <- structure(1L, 
                                                                 .Dim = 1L)
  adist_surveyindices_log_pelago_bioindex_obs__values <- structure(1L, 
                                                                   .Dim = 1L)
  adist_surveyindices_log_pelago_bioindex_obs__lookup <- intintlookup_zip(adist_surveyindices_log_pelago_bioindex_obs__keys, 
                                                                          adist_surveyindices_log_pelago_bioindex_obs__values)
  times_adist_surveyindices_log_pelago_bioindex_obs__keys <- model_data$times_adist_surveyindices_log_pelago_bioindex_obs__keys
  times_adist_surveyindices_log_pelago_bioindex_obs__values <- model_data$times_adist_surveyindices_log_pelago_bioindex_obs__values
  times_adist_surveyindices_log_pelago_bioindex_obs__lookup <- intintlookup_zip(times_adist_surveyindices_log_pelago_bioindex_obs__keys, 
                                                                                times_adist_surveyindices_log_pelago_bioindex_obs__values)
  adist_surveyindices_log_pelago_bioindex_model__params <- model_data$adist_surveyindices_log_pelago_bioindex_model__params
  adist_surveyindices_log_pelago_bioindex_obs__num <- model_data$adist_surveyindices_log_pelago_bioindex_obs__num
  nll_adist_surveyindices_log_pelago_bioindex__num <- array(0, 
                                                            dim = c(time = as_integer(total_steps + 1)), dimnames = list(time = sprintf("%d-%02d", 
                                                                                                                                        rep(seq(start_year, start_year + total_years - 1L), 
                                                                                                                                            each = length(step_lengths)), rep(seq_along(step_lengths), 
                                                                                                                                                                              times = total_years))))
  nll_adist_surveyindices_log_pelago_bioindex__weight <- array(0, 
                                                               dim = c(time = as_integer(total_steps + 1)), dimnames = list(time = sprintf("%d-%02d", 
                                                                                                                                           rep(seq(start_year, start_year + total_years - 1L), 
                                                                                                                                               each = length(step_lengths)), rep(seq_along(step_lengths), 
                                                                                                                                                                                 times = total_years))))
  cdist_sumofsquares_aldist_ecocadiz_model__keys <- structure(1L, 
                                                              .Dim = 1L)
  cdist_sumofsquares_aldist_ecocadiz_model__values <- structure(1L, 
                                                                .Dim = 1L)
  cdist_sumofsquares_aldist_ecocadiz_model__lookup <- intintlookup_zip(cdist_sumofsquares_aldist_ecocadiz_model__keys, 
                                                                       cdist_sumofsquares_aldist_ecocadiz_model__values)
  times_cdist_sumofsquares_aldist_ecocadiz_model__keys <- model_data$times_cdist_sumofsquares_aldist_ecocadiz_model__keys
  times_cdist_sumofsquares_aldist_ecocadiz_model__values <- model_data$times_cdist_sumofsquares_aldist_ecocadiz_model__values
  times_cdist_sumofsquares_aldist_ecocadiz_model__lookup <- intintlookup_zip(times_cdist_sumofsquares_aldist_ecocadiz_model__keys, 
                                                                             times_cdist_sumofsquares_aldist_ecocadiz_model__values)
  ages_cdist_sumofsquares_aldist_ecocadiz_model__keys <- model_data$ages_cdist_sumofsquares_aldist_ecocadiz_model__keys
  ages_cdist_sumofsquares_aldist_ecocadiz_model__values <- model_data$ages_cdist_sumofsquares_aldist_ecocadiz_model__values
  ages_cdist_sumofsquares_aldist_ecocadiz_model__lookup <- intintlookup_zip(ages_cdist_sumofsquares_aldist_ecocadiz_model__keys, 
                                                                            ages_cdist_sumofsquares_aldist_ecocadiz_model__values)
  cdist_sumofsquares_aldist_ecocadiz_model__num <- array(0, 
                                                         dim = c(38L, 2L, 13L, 1L), dimnames = list(c("len3", 
                                                                                                      "len3.5", "len4", "len4.5", "len5", "len5.5", "len6", 
                                                                                                      "len6.5", "len7", "len7.5", "len8", "len8.5", "len9", 
                                                                                                      "len9.5", "len10", "len10.5", "len11", "len11.5", "len12", 
                                                                                                      "len12.5", "len13", "len13.5", "len14", "len14.5", "len15", 
                                                                                                      "len15.5", "len16", "len16.5", "len17", "len17.5", "len18", 
                                                                                                      "len18.5", "len19", "len19.5", "len20", "len20.5", "len21", 
                                                                                                      "len21.5"), c("age1", "age2"), c("2004-01", "2006-01", 
                                                                                                                                       "2007-02", "2009-02", "2010-02", "2013-02", "2014-02", 
                                                                                                                                       "2015-02", "2016-02", "2017-02", "2018-02", "2019-02", 
                                                                                                                                       "2020-02"), "1"))
  anch_cdist_sumofsquares_aldist_ecocadiz_model_lgmatrix <- model_data$anch_cdist_sumofsquares_aldist_ecocadiz_model_lgmatrix
  cdist_sumofsquares_aldist_ecocadiz_model__minareas <- structure(c(`1` = 1L), 
                                                                  .Dim = 1L, .Dimnames = list("1"))
  cdist_sumofsquares_aldist_ecocadiz_model__minages <- model_data$cdist_sumofsquares_aldist_ecocadiz_model__minages
  cdist_sumofsquares_aldist_ecocadiz_obs__keys <- structure(1L, 
                                                            .Dim = 1L)
  cdist_sumofsquares_aldist_ecocadiz_obs__values <- structure(1L, 
                                                              .Dim = 1L)
  cdist_sumofsquares_aldist_ecocadiz_obs__lookup <- intintlookup_zip(cdist_sumofsquares_aldist_ecocadiz_obs__keys, 
                                                                     cdist_sumofsquares_aldist_ecocadiz_obs__values)
  times_cdist_sumofsquares_aldist_ecocadiz_obs__keys <- model_data$times_cdist_sumofsquares_aldist_ecocadiz_obs__keys
  times_cdist_sumofsquares_aldist_ecocadiz_obs__values <- model_data$times_cdist_sumofsquares_aldist_ecocadiz_obs__values
  times_cdist_sumofsquares_aldist_ecocadiz_obs__lookup <- intintlookup_zip(times_cdist_sumofsquares_aldist_ecocadiz_obs__keys, 
                                                                           times_cdist_sumofsquares_aldist_ecocadiz_obs__values)
  cdist_sumofsquares_aldist_ecocadiz_obs__num <- model_data$cdist_sumofsquares_aldist_ecocadiz_obs__num
  nll_cdist_sumofsquares_aldist_ecocadiz__num <- array(0, 
                                                       dim = c(time = as_integer(total_steps + 1)), dimnames = list(time = sprintf("%d-%02d", 
                                                                                                                                   rep(seq(start_year, start_year + total_years - 1L), 
                                                                                                                                       each = length(step_lengths)), rep(seq_along(step_lengths), 
                                                                                                                                                                         times = total_years))))
  nll_cdist_sumofsquares_aldist_ecocadiz__weight <- array(0, 
                                                          dim = c(time = as_integer(total_steps + 1)), dimnames = list(time = sprintf("%d-%02d", 
                                                                                                                                      rep(seq(start_year, start_year + total_years - 1L), 
                                                                                                                                          each = length(step_lengths)), rep(seq_along(step_lengths), 
                                                                                                                                                                            times = total_years))))
  cdist_sumofsquares_aldist_pelago_model__keys <- structure(1L, 
                                                            .Dim = 1L)
  cdist_sumofsquares_aldist_pelago_model__values <- structure(1L, 
                                                              .Dim = 1L)
  cdist_sumofsquares_aldist_pelago_model__lookup <- intintlookup_zip(cdist_sumofsquares_aldist_pelago_model__keys, 
                                                                     cdist_sumofsquares_aldist_pelago_model__values)
  times_cdist_sumofsquares_aldist_pelago_model__keys <- model_data$times_cdist_sumofsquares_aldist_pelago_model__keys
  times_cdist_sumofsquares_aldist_pelago_model__values <- model_data$times_cdist_sumofsquares_aldist_pelago_model__values
  times_cdist_sumofsquares_aldist_pelago_model__lookup <- intintlookup_zip(times_cdist_sumofsquares_aldist_pelago_model__keys, 
                                                                           times_cdist_sumofsquares_aldist_pelago_model__values)
  ages_cdist_sumofsquares_aldist_pelago_model__keys <- model_data$ages_cdist_sumofsquares_aldist_pelago_model__keys
  ages_cdist_sumofsquares_aldist_pelago_model__values <- model_data$ages_cdist_sumofsquares_aldist_pelago_model__values
  ages_cdist_sumofsquares_aldist_pelago_model__lookup <- intintlookup_zip(ages_cdist_sumofsquares_aldist_pelago_model__keys, 
                                                                          ages_cdist_sumofsquares_aldist_pelago_model__values)
  cdist_sumofsquares_aldist_pelago_model__num <- array(0, 
                                                       dim = c(38L, 3L, 8L, 1L), dimnames = list(c("len3", 
                                                                                                   "len3.5", "len4", "len4.5", "len5", "len5.5", "len6", 
                                                                                                   "len6.5", "len7", "len7.5", "len8", "len8.5", "len9", 
                                                                                                   "len9.5", "len10", "len10.5", "len11", "len11.5", "len12", 
                                                                                                   "len12.5", "len13", "len13.5", "len14", "len14.5", "len15", 
                                                                                                   "len15.5", "len16", "len16.5", "len17", "len17.5", "len18", 
                                                                                                   "len18.5", "len19", "len19.5", "len20", "len20.5", "len21", 
                                                                                                   "len21.5"), c("age0", "age1", "age2"), c("2014-01", 
                                                                                                                                            "2015-01", "2016-01", "2017-01", "2018-01", "2019-01", 
                                                                                                                                            "2020-01", "2021-01"), "1"))
  anch_cdist_sumofsquares_aldist_pelago_model_lgmatrix <- model_data$anch_cdist_sumofsquares_aldist_pelago_model_lgmatrix
  cdist_sumofsquares_aldist_pelago_model__minareas <- structure(c(`1` = 1L), 
                                                                .Dim = 1L, .Dimnames = list("1"))
  cdist_sumofsquares_aldist_pelago_model__minages <- model_data$cdist_sumofsquares_aldist_pelago_model__minages
  cdist_sumofsquares_aldist_pelago_obs__keys <- structure(1L, 
                                                          .Dim = 1L)
  cdist_sumofsquares_aldist_pelago_obs__values <- structure(1L, 
                                                            .Dim = 1L)
  cdist_sumofsquares_aldist_pelago_obs__lookup <- intintlookup_zip(cdist_sumofsquares_aldist_pelago_obs__keys, 
                                                                   cdist_sumofsquares_aldist_pelago_obs__values)
  times_cdist_sumofsquares_aldist_pelago_obs__keys <- model_data$times_cdist_sumofsquares_aldist_pelago_obs__keys
  times_cdist_sumofsquares_aldist_pelago_obs__values <- model_data$times_cdist_sumofsquares_aldist_pelago_obs__values
  times_cdist_sumofsquares_aldist_pelago_obs__lookup <- intintlookup_zip(times_cdist_sumofsquares_aldist_pelago_obs__keys, 
                                                                         times_cdist_sumofsquares_aldist_pelago_obs__values)
  cdist_sumofsquares_aldist_pelago_obs__num <- model_data$cdist_sumofsquares_aldist_pelago_obs__num
  nll_cdist_sumofsquares_aldist_pelago__num <- array(0, dim = c(time = as_integer(total_steps + 
                                                                                    1)), dimnames = list(time = sprintf("%d-%02d", rep(seq(start_year, 
                                                                                                                                           start_year + total_years - 1L), each = length(step_lengths)), 
                                                                                                                        rep(seq_along(step_lengths), times = total_years))))
  nll_cdist_sumofsquares_aldist_pelago__weight <- array(0, 
                                                        dim = c(time = as_integer(total_steps + 1)), dimnames = list(time = sprintf("%d-%02d", 
                                                                                                                                    rep(seq(start_year, start_year + total_years - 1L), 
                                                                                                                                        each = length(step_lengths)), rep(seq_along(step_lengths), 
                                                                                                                                                                          times = total_years))))
  cdist_sumofsquares_aldist_seine_model__keys <- structure(1L, 
                                                           .Dim = 1L)
  cdist_sumofsquares_aldist_seine_model__values <- structure(1L, 
                                                             .Dim = 1L)
  cdist_sumofsquares_aldist_seine_model__lookup <- intintlookup_zip(cdist_sumofsquares_aldist_seine_model__keys, 
                                                                    cdist_sumofsquares_aldist_seine_model__values)
  times_cdist_sumofsquares_aldist_seine_model__keys <- model_data$times_cdist_sumofsquares_aldist_seine_model__keys
  times_cdist_sumofsquares_aldist_seine_model__values <- model_data$times_cdist_sumofsquares_aldist_seine_model__values
  times_cdist_sumofsquares_aldist_seine_model__lookup <- intintlookup_zip(times_cdist_sumofsquares_aldist_seine_model__keys, 
                                                                          times_cdist_sumofsquares_aldist_seine_model__values)
  ages_cdist_sumofsquares_aldist_seine_model__keys <- model_data$ages_cdist_sumofsquares_aldist_seine_model__keys
  ages_cdist_sumofsquares_aldist_seine_model__values <- model_data$ages_cdist_sumofsquares_aldist_seine_model__values
  ages_cdist_sumofsquares_aldist_seine_model__lookup <- intintlookup_zip(ages_cdist_sumofsquares_aldist_seine_model__keys, 
                                                                         ages_cdist_sumofsquares_aldist_seine_model__values)
  cdist_sumofsquares_aldist_seine_model__num <- array(0, dim = c(38L, 
                                                                 3L, 128L, 1L), dimnames = list(c("len3", "len3.5", "len4", 
                                                                                                  "len4.5", "len5", "len5.5", "len6", "len6.5", "len7", "len7.5", 
                                                                                                  "len8", "len8.5", "len9", "len9.5", "len10", "len10.5", 
                                                                                                  "len11", "len11.5", "len12", "len12.5", "len13", "len13.5", 
                                                                                                  "len14", "len14.5", "len15", "len15.5", "len16", "len16.5", 
                                                                                                  "len17", "len17.5", "len18", "len18.5", "len19", "len19.5", 
                                                                                                  "len20", "len20.5", "len21", "len21.5"), c("age0", "age1", 
                                                                                                                                             "age2"), c("1989-01", "1989-02", "1989-03", "1989-04", "1990-01", 
                                                                                                                                                        "1990-02", "1990-03", "1990-04", "1991-01", "1991-02", "1991-03", 
                                                                                                                                                        "1991-04", "1992-01", "1992-02", "1992-03", "1992-04", "1993-01", 
                                                                                                                                                        "1993-02", "1993-03", "1993-04", "1994-01", "1994-02", "1994-03", 
                                                                                                                                                        "1994-04", "1995-01", "1995-02", "1995-03", "1995-04", "1996-01", 
                                                                                                                                                        "1996-02", "1996-03", "1996-04", "1997-01", "1997-02", "1997-03", 
                                                                                                                                                        "1997-04", "1998-01", "1998-02", "1998-03", "1998-04", "1999-01", 
                                                                                                                                                        "1999-02", "1999-03", "1999-04", "2000-01", "2000-02", "2000-03", 
                                                                                                                                                        "2000-04", "2001-01", "2001-02", "2001-03", "2001-04", "2002-01", 
                                                                                                                                                        "2002-02", "2002-03", "2002-04", "2003-01", "2003-02", "2003-03", 
                                                                                                                                                        "2003-04", "2004-01", "2004-02", "2004-03", "2004-04", "2005-01", 
                                                                                                                                                        "2005-02", "2005-03", "2005-04", "2006-01", "2006-02", "2006-03", 
                                                                                                                                                        "2006-04", "2007-01", "2007-02", "2007-03", "2007-04", "2008-01", 
                                                                                                                                                        "2008-02", "2008-03", "2008-04", "2009-01", "2009-02", "2009-03", 
                                                                                                                                                        "2009-04", "2010-01", "2010-02", "2010-03", "2010-04", "2011-01", 
                                                                                                                                                        "2011-02", "2011-03", "2011-04", "2012-01", "2012-02", "2012-03", 
                                                                                                                                                        "2012-04", "2013-01", "2013-02", "2013-03", "2013-04", "2014-01", 
                                                                                                                                                        "2014-02", "2014-03", "2014-04", "2015-01", "2015-02", "2015-03", 
                                                                                                                                                        "2015-04", "2016-01", "2016-02", "2016-03", "2016-04", "2017-01", 
                                                                                                                                                        "2017-02", "2017-03", "2017-04", "2018-01", "2018-02", "2018-03", 
                                                                                                                                                        "2018-04", "2019-01", "2019-02", "2019-03", "2019-04", "2020-01", 
                                                                                                                                                        "2020-02", "2020-03", "2020-04"), "1"))
  anch_cdist_sumofsquares_aldist_seine_model_lgmatrix <- model_data$anch_cdist_sumofsquares_aldist_seine_model_lgmatrix
  cdist_sumofsquares_aldist_seine_model__minareas <- structure(c(`1` = 1L), 
                                                               .Dim = 1L, .Dimnames = list("1"))
  cdist_sumofsquares_aldist_seine_model__minages <- model_data$cdist_sumofsquares_aldist_seine_model__minages
  cdist_sumofsquares_aldist_seine_obs__keys <- structure(1L, 
                                                         .Dim = 1L)
  cdist_sumofsquares_aldist_seine_obs__values <- structure(1L, 
                                                           .Dim = 1L)
  cdist_sumofsquares_aldist_seine_obs__lookup <- intintlookup_zip(cdist_sumofsquares_aldist_seine_obs__keys, 
                                                                  cdist_sumofsquares_aldist_seine_obs__values)
  times_cdist_sumofsquares_aldist_seine_obs__keys <- model_data$times_cdist_sumofsquares_aldist_seine_obs__keys
  times_cdist_sumofsquares_aldist_seine_obs__values <- model_data$times_cdist_sumofsquares_aldist_seine_obs__values
  times_cdist_sumofsquares_aldist_seine_obs__lookup <- intintlookup_zip(times_cdist_sumofsquares_aldist_seine_obs__keys, 
                                                                        times_cdist_sumofsquares_aldist_seine_obs__values)
  cdist_sumofsquares_aldist_seine_obs__num <- model_data$cdist_sumofsquares_aldist_seine_obs__num
  nll_cdist_sumofsquares_aldist_seine__num <- array(0, dim = c(time = as_integer(total_steps + 
                                                                                   1)), dimnames = list(time = sprintf("%d-%02d", rep(seq(start_year, 
                                                                                                                                          start_year + total_years - 1L), each = length(step_lengths)), 
                                                                                                                       rep(seq_along(step_lengths), times = total_years))))
  nll_cdist_sumofsquares_aldist_seine__weight <- array(0, 
                                                       dim = c(time = as_integer(total_steps + 1)), dimnames = list(time = sprintf("%d-%02d", 
                                                                                                                                   rep(seq(start_year, start_year + total_years - 1L), 
                                                                                                                                       each = length(step_lengths)), rep(seq_along(step_lengths), 
                                                                                                                                                                         times = total_years))))
  cdist_sumofsquares_ldist_ecocadiz_model__keys <- structure(1L, 
                                                             .Dim = 1L)
  cdist_sumofsquares_ldist_ecocadiz_model__values <- structure(1L, 
                                                               .Dim = 1L)
  cdist_sumofsquares_ldist_ecocadiz_model__lookup <- intintlookup_zip(cdist_sumofsquares_ldist_ecocadiz_model__keys, 
                                                                      cdist_sumofsquares_ldist_ecocadiz_model__values)
  times_cdist_sumofsquares_ldist_ecocadiz_model__keys <- model_data$times_cdist_sumofsquares_ldist_ecocadiz_model__keys
  times_cdist_sumofsquares_ldist_ecocadiz_model__values <- model_data$times_cdist_sumofsquares_ldist_ecocadiz_model__values
  times_cdist_sumofsquares_ldist_ecocadiz_model__lookup <- intintlookup_zip(times_cdist_sumofsquares_ldist_ecocadiz_model__keys, 
                                                                            times_cdist_sumofsquares_ldist_ecocadiz_model__values)
  ages_cdist_sumofsquares_ldist_ecocadiz_model__keys <- model_data$ages_cdist_sumofsquares_ldist_ecocadiz_model__keys
  ages_cdist_sumofsquares_ldist_ecocadiz_model__values <- model_data$ages_cdist_sumofsquares_ldist_ecocadiz_model__values
  ages_cdist_sumofsquares_ldist_ecocadiz_model__lookup <- intintlookup_zip(ages_cdist_sumofsquares_ldist_ecocadiz_model__keys, 
                                                                           ages_cdist_sumofsquares_ldist_ecocadiz_model__values)
  cdist_sumofsquares_ldist_ecocadiz_model__num <- array(0, 
                                                        dim = c(38L, 1L, 13L, 1L), dimnames = list(c("len3", 
                                                                                                     "len3.5", "len4", "len4.5", "len5", "len5.5", "len6", 
                                                                                                     "len6.5", "len7", "len7.5", "len8", "len8.5", "len9", 
                                                                                                     "len9.5", "len10", "len10.5", "len11", "len11.5", "len12", 
                                                                                                     "len12.5", "len13", "len13.5", "len14", "len14.5", "len15", 
                                                                                                     "len15.5", "len16", "len16.5", "len17", "len17.5", "len18", 
                                                                                                     "len18.5", "len19", "len19.5", "len20", "len20.5", "len21", 
                                                                                                     "len21.5"), "all1", c("2004-01", "2006-01", "2007-02", 
                                                                                                                           "2009-02", "2010-02", "2013-02", "2014-02", "2015-02", 
                                                                                                                           "2016-02", "2017-02", "2018-02", "2019-02", "2020-02"
                                                                                                     ), "1"))
  anch_cdist_sumofsquares_ldist_ecocadiz_model_lgmatrix <- model_data$anch_cdist_sumofsquares_ldist_ecocadiz_model_lgmatrix
  cdist_sumofsquares_ldist_ecocadiz_model__minareas <- structure(c(`1` = 1L), 
                                                                 .Dim = 1L, .Dimnames = list("1"))
  cdist_sumofsquares_ldist_ecocadiz_model__minages <- structure(c(all1 = 1L), 
                                                                .Dim = 1L, .Dimnames = list("all1"))
  cdist_sumofsquares_ldist_ecocadiz_obs__keys <- structure(1L, 
                                                           .Dim = 1L)
  cdist_sumofsquares_ldist_ecocadiz_obs__values <- structure(1L, 
                                                             .Dim = 1L)
  cdist_sumofsquares_ldist_ecocadiz_obs__lookup <- intintlookup_zip(cdist_sumofsquares_ldist_ecocadiz_obs__keys, 
                                                                    cdist_sumofsquares_ldist_ecocadiz_obs__values)
  times_cdist_sumofsquares_ldist_ecocadiz_obs__keys <- model_data$times_cdist_sumofsquares_ldist_ecocadiz_obs__keys
  times_cdist_sumofsquares_ldist_ecocadiz_obs__values <- model_data$times_cdist_sumofsquares_ldist_ecocadiz_obs__values
  times_cdist_sumofsquares_ldist_ecocadiz_obs__lookup <- intintlookup_zip(times_cdist_sumofsquares_ldist_ecocadiz_obs__keys, 
                                                                          times_cdist_sumofsquares_ldist_ecocadiz_obs__values)
  cdist_sumofsquares_ldist_ecocadiz_obs__num <- model_data$cdist_sumofsquares_ldist_ecocadiz_obs__num
  nll_cdist_sumofsquares_ldist_ecocadiz__num <- array(0, dim = c(time = as_integer(total_steps + 
                                                                                     1)), dimnames = list(time = sprintf("%d-%02d", rep(seq(start_year, 
                                                                                                                                            start_year + total_years - 1L), each = length(step_lengths)), 
                                                                                                                         rep(seq_along(step_lengths), times = total_years))))
  nll_cdist_sumofsquares_ldist_ecocadiz__weight <- array(0, 
                                                         dim = c(time = as_integer(total_steps + 1)), dimnames = list(time = sprintf("%d-%02d", 
                                                                                                                                     rep(seq(start_year, start_year + total_years - 1L), 
                                                                                                                                         each = length(step_lengths)), rep(seq_along(step_lengths), 
                                                                                                                                                                           times = total_years))))
  cdist_sumofsquares_ldist_pelago_model__keys <- structure(1L, 
                                                           .Dim = 1L)
  cdist_sumofsquares_ldist_pelago_model__values <- structure(1L, 
                                                             .Dim = 1L)
  cdist_sumofsquares_ldist_pelago_model__lookup <- intintlookup_zip(cdist_sumofsquares_ldist_pelago_model__keys, 
                                                                    cdist_sumofsquares_ldist_pelago_model__values)
  times_cdist_sumofsquares_ldist_pelago_model__keys <- model_data$times_cdist_sumofsquares_ldist_pelago_model__keys
  times_cdist_sumofsquares_ldist_pelago_model__values <- model_data$times_cdist_sumofsquares_ldist_pelago_model__values
  times_cdist_sumofsquares_ldist_pelago_model__lookup <- intintlookup_zip(times_cdist_sumofsquares_ldist_pelago_model__keys, 
                                                                          times_cdist_sumofsquares_ldist_pelago_model__values)
  ages_cdist_sumofsquares_ldist_pelago_model__keys <- model_data$ages_cdist_sumofsquares_ldist_pelago_model__keys
  ages_cdist_sumofsquares_ldist_pelago_model__values <- model_data$ages_cdist_sumofsquares_ldist_pelago_model__values
  ages_cdist_sumofsquares_ldist_pelago_model__lookup <- intintlookup_zip(ages_cdist_sumofsquares_ldist_pelago_model__keys, 
                                                                         ages_cdist_sumofsquares_ldist_pelago_model__values)
  cdist_sumofsquares_ldist_pelago_model__num <- array(0, dim = c(38L, 
                                                                 1L, 19L, 1L), dimnames = list(c("len3", "len3.5", "len4", 
                                                                                                 "len4.5", "len5", "len5.5", "len6", "len6.5", "len7", "len7.5", 
                                                                                                 "len8", "len8.5", "len9", "len9.5", "len10", "len10.5", 
                                                                                                 "len11", "len11.5", "len12", "len12.5", "len13", "len13.5", 
                                                                                                 "len14", "len14.5", "len15", "len15.5", "len16", "len16.5", 
                                                                                                 "len17", "len17.5", "len18", "len18.5", "len19", "len19.5", 
                                                                                                 "len20", "len20.5", "len21", "len21.5"), "all0", c("1998-04", 
                                                                                                                                                    "2000-04", "2001-04", "2002-04", "2005-01", "2006-01", "2007-01", 
                                                                                                                                                    "2008-01", "2009-01", "2010-01", "2013-01", "2014-01", "2015-01", 
                                                                                                                                                    "2016-01", "2017-01", "2018-01", "2019-01", "2020-01", "2021-01"
                                                                                                 ), "1"))
  anch_cdist_sumofsquares_ldist_pelago_model_lgmatrix <- model_data$anch_cdist_sumofsquares_ldist_pelago_model_lgmatrix
  cdist_sumofsquares_ldist_pelago_model__minareas <- structure(c(`1` = 1L), 
                                                               .Dim = 1L, .Dimnames = list("1"))
  cdist_sumofsquares_ldist_pelago_model__minages <- array(0L, 
                                                          dim = 1L, dimnames = list("all0"))
  cdist_sumofsquares_ldist_pelago_obs__keys <- structure(1L, 
                                                         .Dim = 1L)
  cdist_sumofsquares_ldist_pelago_obs__values <- structure(1L, 
                                                           .Dim = 1L)
  cdist_sumofsquares_ldist_pelago_obs__lookup <- intintlookup_zip(cdist_sumofsquares_ldist_pelago_obs__keys, 
                                                                  cdist_sumofsquares_ldist_pelago_obs__values)
  times_cdist_sumofsquares_ldist_pelago_obs__keys <- model_data$times_cdist_sumofsquares_ldist_pelago_obs__keys
  times_cdist_sumofsquares_ldist_pelago_obs__values <- model_data$times_cdist_sumofsquares_ldist_pelago_obs__values
  times_cdist_sumofsquares_ldist_pelago_obs__lookup <- intintlookup_zip(times_cdist_sumofsquares_ldist_pelago_obs__keys, 
                                                                        times_cdist_sumofsquares_ldist_pelago_obs__values)
  cdist_sumofsquares_ldist_pelago_obs__num <- model_data$cdist_sumofsquares_ldist_pelago_obs__num
  nll_cdist_sumofsquares_ldist_pelago__num <- array(0, dim = c(time = as_integer(total_steps + 
                                                                                   1)), dimnames = list(time = sprintf("%d-%02d", rep(seq(start_year, 
                                                                                                                                          start_year + total_years - 1L), each = length(step_lengths)), 
                                                                                                                       rep(seq_along(step_lengths), times = total_years))))
  nll_cdist_sumofsquares_ldist_pelago__weight <- array(0, 
                                                       dim = c(time = as_integer(total_steps + 1)), dimnames = list(time = sprintf("%d-%02d", 
                                                                                                                                   rep(seq(start_year, start_year + total_years - 1L), 
                                                                                                                                       each = length(step_lengths)), rep(seq_along(step_lengths), 
                                                                                                                                                                         times = total_years))))
  cdist_sumofsquares_ldist_seine_model__keys <- structure(1L, 
                                                          .Dim = 1L)
  cdist_sumofsquares_ldist_seine_model__values <- structure(1L, 
                                                            .Dim = 1L)
  cdist_sumofsquares_ldist_seine_model__lookup <- intintlookup_zip(cdist_sumofsquares_ldist_seine_model__keys, 
                                                                   cdist_sumofsquares_ldist_seine_model__values)
  times_cdist_sumofsquares_ldist_seine_model__keys <- model_data$times_cdist_sumofsquares_ldist_seine_model__keys
  times_cdist_sumofsquares_ldist_seine_model__values <- model_data$times_cdist_sumofsquares_ldist_seine_model__values
  times_cdist_sumofsquares_ldist_seine_model__lookup <- intintlookup_zip(times_cdist_sumofsquares_ldist_seine_model__keys, 
                                                                         times_cdist_sumofsquares_ldist_seine_model__values)
  ages_cdist_sumofsquares_ldist_seine_model__keys <- model_data$ages_cdist_sumofsquares_ldist_seine_model__keys
  ages_cdist_sumofsquares_ldist_seine_model__values <- model_data$ages_cdist_sumofsquares_ldist_seine_model__values
  ages_cdist_sumofsquares_ldist_seine_model__lookup <- intintlookup_zip(ages_cdist_sumofsquares_ldist_seine_model__keys, 
                                                                        ages_cdist_sumofsquares_ldist_seine_model__values)
  cdist_sumofsquares_ldist_seine_model__num <- array(0, dim = c(38L, 
                                                                1L, 132L, 1L), dimnames = list(c("len3", "len3.5", "len4", 
                                                                                                 "len4.5", "len5", "len5.5", "len6", "len6.5", "len7", "len7.5", 
                                                                                                 "len8", "len8.5", "len9", "len9.5", "len10", "len10.5", 
                                                                                                 "len11", "len11.5", "len12", "len12.5", "len13", "len13.5", 
                                                                                                 "len14", "len14.5", "len15", "len15.5", "len16", "len16.5", 
                                                                                                 "len17", "len17.5", "len18", "len18.5", "len19", "len19.5", 
                                                                                                 "len20", "len20.5", "len21", "len21.5"), "all0", c("1988-01", 
                                                                                                                                                    "1988-02", "1988-03", "1988-04", "1989-01", "1989-02", "1989-03", 
                                                                                                                                                    "1989-04", "1990-01", "1990-02", "1990-03", "1990-04", "1991-01", 
                                                                                                                                                    "1991-02", "1991-03", "1991-04", "1992-01", "1992-02", "1992-03", 
                                                                                                                                                    "1992-04", "1993-01", "1993-02", "1993-03", "1993-04", "1994-01", 
                                                                                                                                                    "1994-02", "1994-03", "1994-04", "1995-01", "1995-02", "1995-03", 
                                                                                                                                                    "1995-04", "1996-01", "1996-02", "1996-03", "1996-04", "1997-01", 
                                                                                                                                                    "1997-02", "1997-03", "1997-04", "1998-01", "1998-02", "1998-03", 
                                                                                                                                                    "1998-04", "1999-01", "1999-02", "1999-03", "1999-04", "2000-01", 
                                                                                                                                                    "2000-02", "2000-03", "2000-04", "2001-01", "2001-02", "2001-03", 
                                                                                                                                                    "2001-04", "2002-01", "2002-02", "2002-03", "2002-04", "2003-01", 
                                                                                                                                                    "2003-02", "2003-03", "2003-04", "2004-01", "2004-02", "2004-03", 
                                                                                                                                                    "2004-04", "2005-01", "2005-02", "2005-03", "2005-04", "2006-01", 
                                                                                                                                                    "2006-02", "2006-03", "2006-04", "2007-01", "2007-02", "2007-03", 
                                                                                                                                                    "2007-04", "2008-01", "2008-02", "2008-03", "2008-04", "2009-01", 
                                                                                                                                                    "2009-02", "2009-03", "2009-04", "2010-01", "2010-02", "2010-03", 
                                                                                                                                                    "2010-04", "2011-01", "2011-02", "2011-03", "2011-04", "2012-01", 
                                                                                                                                                    "2012-02", "2012-03", "2012-04", "2013-01", "2013-02", "2013-03", 
                                                                                                                                                    "2013-04", "2014-01", "2014-02", "2014-03", "2014-04", "2015-01", 
                                                                                                                                                    "2015-02", "2015-03", "2015-04", "2016-01", "2016-02", "2016-03", 
                                                                                                                                                    "2016-04", "2017-01", "2017-02", "2017-03", "2017-04", "2018-01", 
                                                                                                                                                    "2018-02", "2018-03", "2018-04", "2019-01", "2019-02", "2019-03", 
                                                                                                                                                    "2019-04", "2020-01", "2020-02", "2020-03", "2020-04"), 
                                                                                               "1"))
  anch_cdist_sumofsquares_ldist_seine_model_lgmatrix <- model_data$anch_cdist_sumofsquares_ldist_seine_model_lgmatrix
  cdist_sumofsquares_ldist_seine_model__minareas <- structure(c(`1` = 1L), 
                                                              .Dim = 1L, .Dimnames = list("1"))
  cdist_sumofsquares_ldist_seine_model__minages <- array(0L, 
                                                         dim = 1L, dimnames = list("all0"))
  cdist_sumofsquares_ldist_seine_obs__keys <- structure(1L, 
                                                        .Dim = 1L)
  cdist_sumofsquares_ldist_seine_obs__values <- structure(1L, 
                                                          .Dim = 1L)
  cdist_sumofsquares_ldist_seine_obs__lookup <- intintlookup_zip(cdist_sumofsquares_ldist_seine_obs__keys, 
                                                                 cdist_sumofsquares_ldist_seine_obs__values)
  times_cdist_sumofsquares_ldist_seine_obs__keys <- model_data$times_cdist_sumofsquares_ldist_seine_obs__keys
  times_cdist_sumofsquares_ldist_seine_obs__values <- model_data$times_cdist_sumofsquares_ldist_seine_obs__values
  times_cdist_sumofsquares_ldist_seine_obs__lookup <- intintlookup_zip(times_cdist_sumofsquares_ldist_seine_obs__keys, 
                                                                       times_cdist_sumofsquares_ldist_seine_obs__values)
  cdist_sumofsquares_ldist_seine_obs__num <- model_data$cdist_sumofsquares_ldist_seine_obs__num
  nll_cdist_sumofsquares_ldist_seine__num <- array(0, dim = c(time = as_integer(total_steps + 
                                                                                  1)), dimnames = list(time = sprintf("%d-%02d", rep(seq(start_year, 
                                                                                                                                         start_year + total_years - 1L), each = length(step_lengths)), 
                                                                                                                      rep(seq_along(step_lengths), times = total_years))))
  nll_cdist_sumofsquares_ldist_seine__weight <- array(0, dim = c(time = as_integer(total_steps + 
                                                                                     1)), dimnames = list(time = sprintf("%d-%02d", rep(seq(start_year, 
                                                                                                                                            start_year + total_years - 1L), each = length(step_lengths)), 
                                                                                                                         rep(seq_along(step_lengths), times = total_years))))
  g3l_understocking_total <- 0
  nll_understocking__wgt <- array(0, dim = c(time = as_integer(total_steps + 
                                                                 1)), dimnames = list(time = sprintf("%d-%02d", rep(seq(start_year, 
                                                                                                                        start_year + total_years - 1L), each = length(step_lengths)), 
                                                                                                     rep(seq_along(step_lengths), times = total_years))))
  nll_understocking__weight <- array(0, dim = c(time = as_integer(total_steps + 
                                                                    1)), dimnames = list(time = sprintf("%d-%02d", rep(seq(start_year, 
                                                                                                                           start_year + total_years - 1L), each = length(step_lengths)), 
                                                                                                        rep(seq_along(step_lengths), times = total_years))))
  anch_report__ECO <- array(dim = c(39L, 1L, 4L, 136L), dimnames = list(
    c("len3", "len3.5", "len4", "len4.5", "len5", "len5.5", 
      "len6", "len6.5", "len7", "len7.5", "len8", "len8.5", 
      "len9", "len9.5", "len10", "len10.5", "len11", "len11.5", 
      "len12", "len12.5", "len13", "len13.5", "len14", "len14.5", 
      "len15", "len15.5", "len16", "len16.5", "len17", "len17.5", 
      "len18", "len18.5", "len19", "len19.5", "len20", "len20.5", 
      "len21", "len21.5", "len22"), "1", c("age0", "age1", 
                                           "age2", "age3"), c("1988-01", "1988-02", "1988-03", 
                                                              "1988-04", "1989-01", "1989-02", "1989-03", "1989-04", 
                                                              "1990-01", "1990-02", "1990-03", "1990-04", "1991-01", 
                                                              "1991-02", "1991-03", "1991-04", "1992-01", "1992-02", 
                                                              "1992-03", "1992-04", "1993-01", "1993-02", "1993-03", 
                                                              "1993-04", "1994-01", "1994-02", "1994-03", "1994-04", 
                                                              "1995-01", "1995-02", "1995-03", "1995-04", "1996-01", 
                                                              "1996-02", "1996-03", "1996-04", "1997-01", "1997-02", 
                                                              "1997-03", "1997-04", "1998-01", "1998-02", "1998-03", 
                                                              "1998-04", "1999-01", "1999-02", "1999-03", "1999-04", 
                                                              "2000-01", "2000-02", "2000-03", "2000-04", "2001-01", 
                                                              "2001-02", "2001-03", "2001-04", "2002-01", "2002-02", 
                                                              "2002-03", "2002-04", "2003-01", "2003-02", "2003-03", 
                                                              "2003-04", "2004-01", "2004-02", "2004-03", "2004-04", 
                                                              "2005-01", "2005-02", "2005-03", "2005-04", "2006-01", 
                                                              "2006-02", "2006-03", "2006-04", "2007-01", "2007-02", 
                                                              "2007-03", "2007-04", "2008-01", "2008-02", "2008-03", 
                                                              "2008-04", "2009-01", "2009-02", "2009-03", "2009-04", 
                                                              "2010-01", "2010-02", "2010-03", "2010-04", "2011-01", 
                                                              "2011-02", "2011-03", "2011-04", "2012-01", "2012-02", 
                                                              "2012-03", "2012-04", "2013-01", "2013-02", "2013-03", 
                                                              "2013-04", "2014-01", "2014-02", "2014-03", "2014-04", 
                                                              "2015-01", "2015-02", "2015-03", "2015-04", "2016-01", 
                                                              "2016-02", "2016-03", "2016-04", "2017-01", "2017-02", 
                                                              "2017-03", "2017-04", "2018-01", "2018-02", "2018-03", 
                                                              "2018-04", "2019-01", "2019-02", "2019-03", "2019-04", 
                                                              "2020-01", "2020-02", "2020-03", "2020-04", "2021-01", 
                                                              "2021-02", "2021-03", "2021-04")))
  times_anch_report__keys <- model_data$times_anch_report__keys
  times_anch_report__values <- model_data$times_anch_report__values
  times_anch_report__lookup <- intintlookup_zip(times_anch_report__keys, 
                                                times_anch_report__values)
  anch_report__minage <- 0L
  anch_report__maxage <- 3L
  anch_report__area <- 1L
  anch_report__num <- array(dim = c(39L, 1L, 4L, 136L), dimnames = list(
    c("len3", "len3.5", "len4", "len4.5", "len5", "len5.5", 
      "len6", "len6.5", "len7", "len7.5", "len8", "len8.5", 
      "len9", "len9.5", "len10", "len10.5", "len11", "len11.5", 
      "len12", "len12.5", "len13", "len13.5", "len14", "len14.5", 
      "len15", "len15.5", "len16", "len16.5", "len17", "len17.5", 
      "len18", "len18.5", "len19", "len19.5", "len20", "len20.5", 
      "len21", "len21.5", "len22"), "1", c("age0", "age1", 
                                           "age2", "age3"), c("1988-01", "1988-02", "1988-03", 
                                                              "1988-04", "1989-01", "1989-02", "1989-03", "1989-04", 
                                                              "1990-01", "1990-02", "1990-03", "1990-04", "1991-01", 
                                                              "1991-02", "1991-03", "1991-04", "1992-01", "1992-02", 
                                                              "1992-03", "1992-04", "1993-01", "1993-02", "1993-03", 
                                                              "1993-04", "1994-01", "1994-02", "1994-03", "1994-04", 
                                                              "1995-01", "1995-02", "1995-03", "1995-04", "1996-01", 
                                                              "1996-02", "1996-03", "1996-04", "1997-01", "1997-02", 
                                                              "1997-03", "1997-04", "1998-01", "1998-02", "1998-03", 
                                                              "1998-04", "1999-01", "1999-02", "1999-03", "1999-04", 
                                                              "2000-01", "2000-02", "2000-03", "2000-04", "2001-01", 
                                                              "2001-02", "2001-03", "2001-04", "2002-01", "2002-02", 
                                                              "2002-03", "2002-04", "2003-01", "2003-02", "2003-03", 
                                                              "2003-04", "2004-01", "2004-02", "2004-03", "2004-04", 
                                                              "2005-01", "2005-02", "2005-03", "2005-04", "2006-01", 
                                                              "2006-02", "2006-03", "2006-04", "2007-01", "2007-02", 
                                                              "2007-03", "2007-04", "2008-01", "2008-02", "2008-03", 
                                                              "2008-04", "2009-01", "2009-02", "2009-03", "2009-04", 
                                                              "2010-01", "2010-02", "2010-03", "2010-04", "2011-01", 
                                                              "2011-02", "2011-03", "2011-04", "2012-01", "2012-02", 
                                                              "2012-03", "2012-04", "2013-01", "2013-02", "2013-03", 
                                                              "2013-04", "2014-01", "2014-02", "2014-03", "2014-04", 
                                                              "2015-01", "2015-02", "2015-03", "2015-04", "2016-01", 
                                                              "2016-02", "2016-03", "2016-04", "2017-01", "2017-02", 
                                                              "2017-03", "2017-04", "2018-01", "2018-02", "2018-03", 
                                                              "2018-04", "2019-01", "2019-02", "2019-03", "2019-04", 
                                                              "2020-01", "2020-02", "2020-03", "2020-04", "2021-01", 
                                                              "2021-02", "2021-03", "2021-04")))
  anch_report__PEL <- array(dim = c(39L, 1L, 4L, 136L), dimnames = list(
    c("len3", "len3.5", "len4", "len4.5", "len5", "len5.5", 
      "len6", "len6.5", "len7", "len7.5", "len8", "len8.5", 
      "len9", "len9.5", "len10", "len10.5", "len11", "len11.5", 
      "len12", "len12.5", "len13", "len13.5", "len14", "len14.5", 
      "len15", "len15.5", "len16", "len16.5", "len17", "len17.5", 
      "len18", "len18.5", "len19", "len19.5", "len20", "len20.5", 
      "len21", "len21.5", "len22"), "1", c("age0", "age1", 
                                           "age2", "age3"), c("1988-01", "1988-02", "1988-03", 
                                                              "1988-04", "1989-01", "1989-02", "1989-03", "1989-04", 
                                                              "1990-01", "1990-02", "1990-03", "1990-04", "1991-01", 
                                                              "1991-02", "1991-03", "1991-04", "1992-01", "1992-02", 
                                                              "1992-03", "1992-04", "1993-01", "1993-02", "1993-03", 
                                                              "1993-04", "1994-01", "1994-02", "1994-03", "1994-04", 
                                                              "1995-01", "1995-02", "1995-03", "1995-04", "1996-01", 
                                                              "1996-02", "1996-03", "1996-04", "1997-01", "1997-02", 
                                                              "1997-03", "1997-04", "1998-01", "1998-02", "1998-03", 
                                                              "1998-04", "1999-01", "1999-02", "1999-03", "1999-04", 
                                                              "2000-01", "2000-02", "2000-03", "2000-04", "2001-01", 
                                                              "2001-02", "2001-03", "2001-04", "2002-01", "2002-02", 
                                                              "2002-03", "2002-04", "2003-01", "2003-02", "2003-03", 
                                                              "2003-04", "2004-01", "2004-02", "2004-03", "2004-04", 
                                                              "2005-01", "2005-02", "2005-03", "2005-04", "2006-01", 
                                                              "2006-02", "2006-03", "2006-04", "2007-01", "2007-02", 
                                                              "2007-03", "2007-04", "2008-01", "2008-02", "2008-03", 
                                                              "2008-04", "2009-01", "2009-02", "2009-03", "2009-04", 
                                                              "2010-01", "2010-02", "2010-03", "2010-04", "2011-01", 
                                                              "2011-02", "2011-03", "2011-04", "2012-01", "2012-02", 
                                                              "2012-03", "2012-04", "2013-01", "2013-02", "2013-03", 
                                                              "2013-04", "2014-01", "2014-02", "2014-03", "2014-04", 
                                                              "2015-01", "2015-02", "2015-03", "2015-04", "2016-01", 
                                                              "2016-02", "2016-03", "2016-04", "2017-01", "2017-02", 
                                                              "2017-03", "2017-04", "2018-01", "2018-02", "2018-03", 
                                                              "2018-04", "2019-01", "2019-02", "2019-03", "2019-04", 
                                                              "2020-01", "2020-02", "2020-03", "2020-04", "2021-01", 
                                                              "2021-02", "2021-03", "2021-04")))
  anch_report__renewalnum <- array(dim = c(39L, 1L, 4L, 136L
  ), dimnames = list(c("len3", "len3.5", "len4", "len4.5", 
                       "len5", "len5.5", "len6", "len6.5", "len7", "len7.5", "len8", 
                       "len8.5", "len9", "len9.5", "len10", "len10.5", "len11", 
                       "len11.5", "len12", "len12.5", "len13", "len13.5", "len14", 
                       "len14.5", "len15", "len15.5", "len16", "len16.5", "len17", 
                       "len17.5", "len18", "len18.5", "len19", "len19.5", "len20", 
                       "len20.5", "len21", "len21.5", "len22"), "1", c("age0", 
                                                                       "age1", "age2", "age3"), c("1988-01", "1988-02", "1988-03", 
                                                                                                  "1988-04", "1989-01", "1989-02", "1989-03", "1989-04", "1990-01", 
                                                                                                  "1990-02", "1990-03", "1990-04", "1991-01", "1991-02", "1991-03", 
                                                                                                  "1991-04", "1992-01", "1992-02", "1992-03", "1992-04", "1993-01", 
                                                                                                  "1993-02", "1993-03", "1993-04", "1994-01", "1994-02", "1994-03", 
                                                                                                  "1994-04", "1995-01", "1995-02", "1995-03", "1995-04", "1996-01", 
                                                                                                  "1996-02", "1996-03", "1996-04", "1997-01", "1997-02", "1997-03", 
                                                                                                  "1997-04", "1998-01", "1998-02", "1998-03", "1998-04", "1999-01", 
                                                                                                  "1999-02", "1999-03", "1999-04", "2000-01", "2000-02", "2000-03", 
                                                                                                  "2000-04", "2001-01", "2001-02", "2001-03", "2001-04", "2002-01", 
                                                                                                  "2002-02", "2002-03", "2002-04", "2003-01", "2003-02", "2003-03", 
                                                                                                  "2003-04", "2004-01", "2004-02", "2004-03", "2004-04", "2005-01", 
                                                                                                  "2005-02", "2005-03", "2005-04", "2006-01", "2006-02", "2006-03", 
                                                                                                  "2006-04", "2007-01", "2007-02", "2007-03", "2007-04", "2008-01", 
                                                                                                  "2008-02", "2008-03", "2008-04", "2009-01", "2009-02", "2009-03", 
                                                                                                  "2009-04", "2010-01", "2010-02", "2010-03", "2010-04", "2011-01", 
                                                                                                  "2011-02", "2011-03", "2011-04", "2012-01", "2012-02", "2012-03", 
                                                                                                  "2012-04", "2013-01", "2013-02", "2013-03", "2013-04", "2014-01", 
                                                                                                  "2014-02", "2014-03", "2014-04", "2015-01", "2015-02", "2015-03", 
                                                                                                  "2015-04", "2016-01", "2016-02", "2016-03", "2016-04", "2017-01", 
                                                                                                  "2017-02", "2017-03", "2017-04", "2018-01", "2018-02", "2018-03", 
                                                                                                  "2018-04", "2019-01", "2019-02", "2019-03", "2019-04", "2020-01", 
                                                                                                  "2020-02", "2020-03", "2020-04", "2021-01", "2021-02", "2021-03", 
                                                                                                  "2021-04")))
  anch_report__renewalwgt <- array(dim = c(39L, 1L, 4L, 136L
  ), dimnames = list(c("len3", "len3.5", "len4", "len4.5", 
                       "len5", "len5.5", "len6", "len6.5", "len7", "len7.5", "len8", 
                       "len8.5", "len9", "len9.5", "len10", "len10.5", "len11", 
                       "len11.5", "len12", "len12.5", "len13", "len13.5", "len14", 
                       "len14.5", "len15", "len15.5", "len16", "len16.5", "len17", 
                       "len17.5", "len18", "len18.5", "len19", "len19.5", "len20", 
                       "len20.5", "len21", "len21.5", "len22"), "1", c("age0", 
                                                                       "age1", "age2", "age3"), c("1988-01", "1988-02", "1988-03", 
                                                                                                  "1988-04", "1989-01", "1989-02", "1989-03", "1989-04", "1990-01", 
                                                                                                  "1990-02", "1990-03", "1990-04", "1991-01", "1991-02", "1991-03", 
                                                                                                  "1991-04", "1992-01", "1992-02", "1992-03", "1992-04", "1993-01", 
                                                                                                  "1993-02", "1993-03", "1993-04", "1994-01", "1994-02", "1994-03", 
                                                                                                  "1994-04", "1995-01", "1995-02", "1995-03", "1995-04", "1996-01", 
                                                                                                  "1996-02", "1996-03", "1996-04", "1997-01", "1997-02", "1997-03", 
                                                                                                  "1997-04", "1998-01", "1998-02", "1998-03", "1998-04", "1999-01", 
                                                                                                  "1999-02", "1999-03", "1999-04", "2000-01", "2000-02", "2000-03", 
                                                                                                  "2000-04", "2001-01", "2001-02", "2001-03", "2001-04", "2002-01", 
                                                                                                  "2002-02", "2002-03", "2002-04", "2003-01", "2003-02", "2003-03", 
                                                                                                  "2003-04", "2004-01", "2004-02", "2004-03", "2004-04", "2005-01", 
                                                                                                  "2005-02", "2005-03", "2005-04", "2006-01", "2006-02", "2006-03", 
                                                                                                  "2006-04", "2007-01", "2007-02", "2007-03", "2007-04", "2008-01", 
                                                                                                  "2008-02", "2008-03", "2008-04", "2009-01", "2009-02", "2009-03", 
                                                                                                  "2009-04", "2010-01", "2010-02", "2010-03", "2010-04", "2011-01", 
                                                                                                  "2011-02", "2011-03", "2011-04", "2012-01", "2012-02", "2012-03", 
                                                                                                  "2012-04", "2013-01", "2013-02", "2013-03", "2013-04", "2014-01", 
                                                                                                  "2014-02", "2014-03", "2014-04", "2015-01", "2015-02", "2015-03", 
                                                                                                  "2015-04", "2016-01", "2016-02", "2016-03", "2016-04", "2017-01", 
                                                                                                  "2017-02", "2017-03", "2017-04", "2018-01", "2018-02", "2018-03", 
                                                                                                  "2018-04", "2019-01", "2019-02", "2019-03", "2019-04", "2020-01", 
                                                                                                  "2020-02", "2020-03", "2020-04", "2021-01", "2021-02", "2021-03", 
                                                                                                  "2021-04")))
  anch_report__seine1 <- array(dim = c(39L, 1L, 4L, 136L), 
                               dimnames = list(c("len3", "len3.5", "len4", "len4.5", 
                                                 "len5", "len5.5", "len6", "len6.5", "len7", "len7.5", 
                                                 "len8", "len8.5", "len9", "len9.5", "len10", "len10.5", 
                                                 "len11", "len11.5", "len12", "len12.5", "len13", "len13.5", 
                                                 "len14", "len14.5", "len15", "len15.5", "len16", "len16.5", 
                                                 "len17", "len17.5", "len18", "len18.5", "len19", "len19.5", 
                                                 "len20", "len20.5", "len21", "len21.5", "len22"), "1", 
                                               c("age0", "age1", "age2", "age3"), c("1988-01", 
                                                                                    "1988-02", "1988-03", "1988-04", "1989-01", "1989-02", 
                                                                                    "1989-03", "1989-04", "1990-01", "1990-02", "1990-03", 
                                                                                    "1990-04", "1991-01", "1991-02", "1991-03", "1991-04", 
                                                                                    "1992-01", "1992-02", "1992-03", "1992-04", "1993-01", 
                                                                                    "1993-02", "1993-03", "1993-04", "1994-01", "1994-02", 
                                                                                    "1994-03", "1994-04", "1995-01", "1995-02", "1995-03", 
                                                                                    "1995-04", "1996-01", "1996-02", "1996-03", "1996-04", 
                                                                                    "1997-01", "1997-02", "1997-03", "1997-04", "1998-01", 
                                                                                    "1998-02", "1998-03", "1998-04", "1999-01", "1999-02", 
                                                                                    "1999-03", "1999-04", "2000-01", "2000-02", "2000-03", 
                                                                                    "2000-04", "2001-01", "2001-02", "2001-03", "2001-04", 
                                                                                    "2002-01", "2002-02", "2002-03", "2002-04", "2003-01", 
                                                                                    "2003-02", "2003-03", "2003-04", "2004-01", "2004-02", 
                                                                                    "2004-03", "2004-04", "2005-01", "2005-02", "2005-03", 
                                                                                    "2005-04", "2006-01", "2006-02", "2006-03", "2006-04", 
                                                                                    "2007-01", "2007-02", "2007-03", "2007-04", "2008-01", 
                                                                                    "2008-02", "2008-03", "2008-04", "2009-01", "2009-02", 
                                                                                    "2009-03", "2009-04", "2010-01", "2010-02", "2010-03", 
                                                                                    "2010-04", "2011-01", "2011-02", "2011-03", "2011-04", 
                                                                                    "2012-01", "2012-02", "2012-03", "2012-04", "2013-01", 
                                                                                    "2013-02", "2013-03", "2013-04", "2014-01", "2014-02", 
                                                                                    "2014-03", "2014-04", "2015-01", "2015-02", "2015-03", 
                                                                                    "2015-04", "2016-01", "2016-02", "2016-03", "2016-04", 
                                                                                    "2017-01", "2017-02", "2017-03", "2017-04", "2018-01", 
                                                                                    "2018-02", "2018-03", "2018-04", "2019-01", "2019-02", 
                                                                                    "2019-03", "2019-04", "2020-01", "2020-02", "2020-03", 
                                                                                    "2020-04", "2021-01", "2021-02", "2021-03", "2021-04"
                                               )))
  anch_report__seine2 <- array(dim = c(39L, 1L, 4L, 136L), 
                               dimnames = list(c("len3", "len3.5", "len4", "len4.5", 
                                                 "len5", "len5.5", "len6", "len6.5", "len7", "len7.5", 
                                                 "len8", "len8.5", "len9", "len9.5", "len10", "len10.5", 
                                                 "len11", "len11.5", "len12", "len12.5", "len13", "len13.5", 
                                                 "len14", "len14.5", "len15", "len15.5", "len16", "len16.5", 
                                                 "len17", "len17.5", "len18", "len18.5", "len19", "len19.5", 
                                                 "len20", "len20.5", "len21", "len21.5", "len22"), "1", 
                                               c("age0", "age1", "age2", "age3"), c("1988-01", 
                                                                                    "1988-02", "1988-03", "1988-04", "1989-01", "1989-02", 
                                                                                    "1989-03", "1989-04", "1990-01", "1990-02", "1990-03", 
                                                                                    "1990-04", "1991-01", "1991-02", "1991-03", "1991-04", 
                                                                                    "1992-01", "1992-02", "1992-03", "1992-04", "1993-01", 
                                                                                    "1993-02", "1993-03", "1993-04", "1994-01", "1994-02", 
                                                                                    "1994-03", "1994-04", "1995-01", "1995-02", "1995-03", 
                                                                                    "1995-04", "1996-01", "1996-02", "1996-03", "1996-04", 
                                                                                    "1997-01", "1997-02", "1997-03", "1997-04", "1998-01", 
                                                                                    "1998-02", "1998-03", "1998-04", "1999-01", "1999-02", 
                                                                                    "1999-03", "1999-04", "2000-01", "2000-02", "2000-03", 
                                                                                    "2000-04", "2001-01", "2001-02", "2001-03", "2001-04", 
                                                                                    "2002-01", "2002-02", "2002-03", "2002-04", "2003-01", 
                                                                                    "2003-02", "2003-03", "2003-04", "2004-01", "2004-02", 
                                                                                    "2004-03", "2004-04", "2005-01", "2005-02", "2005-03", 
                                                                                    "2005-04", "2006-01", "2006-02", "2006-03", "2006-04", 
                                                                                    "2007-01", "2007-02", "2007-03", "2007-04", "2008-01", 
                                                                                    "2008-02", "2008-03", "2008-04", "2009-01", "2009-02", 
                                                                                    "2009-03", "2009-04", "2010-01", "2010-02", "2010-03", 
                                                                                    "2010-04", "2011-01", "2011-02", "2011-03", "2011-04", 
                                                                                    "2012-01", "2012-02", "2012-03", "2012-04", "2013-01", 
                                                                                    "2013-02", "2013-03", "2013-04", "2014-01", "2014-02", 
                                                                                    "2014-03", "2014-04", "2015-01", "2015-02", "2015-03", 
                                                                                    "2015-04", "2016-01", "2016-02", "2016-03", "2016-04", 
                                                                                    "2017-01", "2017-02", "2017-03", "2017-04", "2018-01", 
                                                                                    "2018-02", "2018-03", "2018-04", "2019-01", "2019-02", 
                                                                                    "2019-03", "2019-04", "2020-01", "2020-02", "2020-03", 
                                                                                    "2020-04", "2021-01", "2021-02", "2021-03", "2021-04"
                                               )))
  anch_report__suit_ECO <- array(dim = c(39L, 1L, 4L, 136L
  ), dimnames = list(c("len3", "len3.5", "len4", "len4.5", 
                       "len5", "len5.5", "len6", "len6.5", "len7", "len7.5", "len8", 
                       "len8.5", "len9", "len9.5", "len10", "len10.5", "len11", 
                       "len11.5", "len12", "len12.5", "len13", "len13.5", "len14", 
                       "len14.5", "len15", "len15.5", "len16", "len16.5", "len17", 
                       "len17.5", "len18", "len18.5", "len19", "len19.5", "len20", 
                       "len20.5", "len21", "len21.5", "len22"), "1", c("age0", 
                                                                       "age1", "age2", "age3"), c("1988-01", "1988-02", "1988-03", 
                                                                                                  "1988-04", "1989-01", "1989-02", "1989-03", "1989-04", "1990-01", 
                                                                                                  "1990-02", "1990-03", "1990-04", "1991-01", "1991-02", "1991-03", 
                                                                                                  "1991-04", "1992-01", "1992-02", "1992-03", "1992-04", "1993-01", 
                                                                                                  "1993-02", "1993-03", "1993-04", "1994-01", "1994-02", "1994-03", 
                                                                                                  "1994-04", "1995-01", "1995-02", "1995-03", "1995-04", "1996-01", 
                                                                                                  "1996-02", "1996-03", "1996-04", "1997-01", "1997-02", "1997-03", 
                                                                                                  "1997-04", "1998-01", "1998-02", "1998-03", "1998-04", "1999-01", 
                                                                                                  "1999-02", "1999-03", "1999-04", "2000-01", "2000-02", "2000-03", 
                                                                                                  "2000-04", "2001-01", "2001-02", "2001-03", "2001-04", "2002-01", 
                                                                                                  "2002-02", "2002-03", "2002-04", "2003-01", "2003-02", "2003-03", 
                                                                                                  "2003-04", "2004-01", "2004-02", "2004-03", "2004-04", "2005-01", 
                                                                                                  "2005-02", "2005-03", "2005-04", "2006-01", "2006-02", "2006-03", 
                                                                                                  "2006-04", "2007-01", "2007-02", "2007-03", "2007-04", "2008-01", 
                                                                                                  "2008-02", "2008-03", "2008-04", "2009-01", "2009-02", "2009-03", 
                                                                                                  "2009-04", "2010-01", "2010-02", "2010-03", "2010-04", "2011-01", 
                                                                                                  "2011-02", "2011-03", "2011-04", "2012-01", "2012-02", "2012-03", 
                                                                                                  "2012-04", "2013-01", "2013-02", "2013-03", "2013-04", "2014-01", 
                                                                                                  "2014-02", "2014-03", "2014-04", "2015-01", "2015-02", "2015-03", 
                                                                                                  "2015-04", "2016-01", "2016-02", "2016-03", "2016-04", "2017-01", 
                                                                                                  "2017-02", "2017-03", "2017-04", "2018-01", "2018-02", "2018-03", 
                                                                                                  "2018-04", "2019-01", "2019-02", "2019-03", "2019-04", "2020-01", 
                                                                                                  "2020-02", "2020-03", "2020-04", "2021-01", "2021-02", "2021-03", 
                                                                                                  "2021-04")))
  anch_report__suit_PEL <- array(dim = c(39L, 1L, 4L, 136L
  ), dimnames = list(c("len3", "len3.5", "len4", "len4.5", 
                       "len5", "len5.5", "len6", "len6.5", "len7", "len7.5", "len8", 
                       "len8.5", "len9", "len9.5", "len10", "len10.5", "len11", 
                       "len11.5", "len12", "len12.5", "len13", "len13.5", "len14", 
                       "len14.5", "len15", "len15.5", "len16", "len16.5", "len17", 
                       "len17.5", "len18", "len18.5", "len19", "len19.5", "len20", 
                       "len20.5", "len21", "len21.5", "len22"), "1", c("age0", 
                                                                       "age1", "age2", "age3"), c("1988-01", "1988-02", "1988-03", 
                                                                                                  "1988-04", "1989-01", "1989-02", "1989-03", "1989-04", "1990-01", 
                                                                                                  "1990-02", "1990-03", "1990-04", "1991-01", "1991-02", "1991-03", 
                                                                                                  "1991-04", "1992-01", "1992-02", "1992-03", "1992-04", "1993-01", 
                                                                                                  "1993-02", "1993-03", "1993-04", "1994-01", "1994-02", "1994-03", 
                                                                                                  "1994-04", "1995-01", "1995-02", "1995-03", "1995-04", "1996-01", 
                                                                                                  "1996-02", "1996-03", "1996-04", "1997-01", "1997-02", "1997-03", 
                                                                                                  "1997-04", "1998-01", "1998-02", "1998-03", "1998-04", "1999-01", 
                                                                                                  "1999-02", "1999-03", "1999-04", "2000-01", "2000-02", "2000-03", 
                                                                                                  "2000-04", "2001-01", "2001-02", "2001-03", "2001-04", "2002-01", 
                                                                                                  "2002-02", "2002-03", "2002-04", "2003-01", "2003-02", "2003-03", 
                                                                                                  "2003-04", "2004-01", "2004-02", "2004-03", "2004-04", "2005-01", 
                                                                                                  "2005-02", "2005-03", "2005-04", "2006-01", "2006-02", "2006-03", 
                                                                                                  "2006-04", "2007-01", "2007-02", "2007-03", "2007-04", "2008-01", 
                                                                                                  "2008-02", "2008-03", "2008-04", "2009-01", "2009-02", "2009-03", 
                                                                                                  "2009-04", "2010-01", "2010-02", "2010-03", "2010-04", "2011-01", 
                                                                                                  "2011-02", "2011-03", "2011-04", "2012-01", "2012-02", "2012-03", 
                                                                                                  "2012-04", "2013-01", "2013-02", "2013-03", "2013-04", "2014-01", 
                                                                                                  "2014-02", "2014-03", "2014-04", "2015-01", "2015-02", "2015-03", 
                                                                                                  "2015-04", "2016-01", "2016-02", "2016-03", "2016-04", "2017-01", 
                                                                                                  "2017-02", "2017-03", "2017-04", "2018-01", "2018-02", "2018-03", 
                                                                                                  "2018-04", "2019-01", "2019-02", "2019-03", "2019-04", "2020-01", 
                                                                                                  "2020-02", "2020-03", "2020-04", "2021-01", "2021-02", "2021-03", 
                                                                                                  "2021-04")))
  while (TRUE) {
    {
      comment("g3a_time")
      cur_time <- cur_time + 1L
      if (FALSE) 
        assert_msg(is.finite(nll), "g3a_time: nll became NaN/Inf in previous timestep")
      if (cur_time > total_steps) {
        {
          attr(nll, "adist_surveyindices_log_ecocadiz_bioindex_model__num") <- adist_surveyindices_log_ecocadiz_bioindex_model__num
          attr(nll, "adist_surveyindices_log_ecocadiz_bioindex_model__params") <- adist_surveyindices_log_ecocadiz_bioindex_model__params
          attr(nll, "adist_surveyindices_log_pelago_bioindex_model__num") <- adist_surveyindices_log_pelago_bioindex_model__num
          attr(nll, "adist_surveyindices_log_pelago_bioindex_model__params") <- adist_surveyindices_log_pelago_bioindex_model__params
          attr(nll, "anch__consratio") <- anch__consratio
          attr(nll, "anch__ECO") <- anch__ECO
          attr(nll, "anch__num") <- anch__num
          attr(nll, "anch__overconsumption") <- anch__overconsumption
          attr(nll, "anch__PEL") <- anch__PEL
          attr(nll, "anch__renewalnum") <- anch__renewalnum
          attr(nll, "anch__renewalwgt") <- anch__renewalwgt
          attr(nll, "anch_report__ECO") <- anch_report__ECO
          attr(nll, "anch_report__num") <- anch_report__num
          attr(nll, "anch_report__PEL") <- anch_report__PEL
          attr(nll, "anch_report__renewalnum") <- anch_report__renewalnum
          attr(nll, "anch_report__renewalwgt") <- anch_report__renewalwgt
          attr(nll, "anch_report__seine1") <- anch_report__seine1
          attr(nll, "anch_report__seine2") <- anch_report__seine2
          attr(nll, "anch_report__suit_ECO") <- anch_report__suit_ECO
          attr(nll, "anch_report__suit_PEL") <- anch_report__suit_PEL
          attr(nll, "anch__seine1") <- anch__seine1
          attr(nll, "anch__seine2") <- anch__seine2
          attr(nll, "anch__suit_ECO") <- anch__suit_ECO
          attr(nll, "anch__suit_PEL") <- anch__suit_PEL
          attr(nll, "anch__suit_seine1") <- anch__suit_seine1
          attr(nll, "anch__suit_seine2") <- anch__suit_seine2
          attr(nll, "anch__totalpredate") <- anch__totalpredate
          attr(nll, "anch__wgt") <- anch__wgt
          attr(nll, "cdist_sumofsquares_aldist_ecocadiz_model__num") <- cdist_sumofsquares_aldist_ecocadiz_model__num
          attr(nll, "cdist_sumofsquares_aldist_pelago_model__num") <- cdist_sumofsquares_aldist_pelago_model__num
          attr(nll, "cdist_sumofsquares_aldist_seine_model__num") <- cdist_sumofsquares_aldist_seine_model__num
          attr(nll, "cdist_sumofsquares_ldist_ecocadiz_model__num") <- cdist_sumofsquares_ldist_ecocadiz_model__num
          attr(nll, "cdist_sumofsquares_ldist_pelago_model__num") <- cdist_sumofsquares_ldist_pelago_model__num
          attr(nll, "cdist_sumofsquares_ldist_seine_model__num") <- cdist_sumofsquares_ldist_seine_model__num
          attr(nll, "cur_step") <- cur_step
          attr(nll, "cur_step_final") <- cur_step_final
          attr(nll, "cur_time") <- cur_time
          attr(nll, "cur_year") <- cur_year
          attr(nll, "ECO__catch") <- ECO__catch
          attr(nll, "g3l_understocking_total") <- g3l_understocking_total
          attr(nll, "nll") <- nll[[1]]
          attr(nll, "nll_adist_surveyindices_log_ecocadiz_bioindex__num") <- nll_adist_surveyindices_log_ecocadiz_bioindex__num
          attr(nll, "nll_adist_surveyindices_log_ecocadiz_bioindex__weight") <- nll_adist_surveyindices_log_ecocadiz_bioindex__weight
          attr(nll, "nll_adist_surveyindices_log_pelago_bioindex__num") <- nll_adist_surveyindices_log_pelago_bioindex__num
          attr(nll, "nll_adist_surveyindices_log_pelago_bioindex__weight") <- nll_adist_surveyindices_log_pelago_bioindex__weight
          attr(nll, "nll_cdist_sumofsquares_aldist_ecocadiz__num") <- nll_cdist_sumofsquares_aldist_ecocadiz__num
          attr(nll, "nll_cdist_sumofsquares_aldist_ecocadiz__weight") <- nll_cdist_sumofsquares_aldist_ecocadiz__weight
          attr(nll, "nll_cdist_sumofsquares_aldist_pelago__num") <- nll_cdist_sumofsquares_aldist_pelago__num
          attr(nll, "nll_cdist_sumofsquares_aldist_pelago__weight") <- nll_cdist_sumofsquares_aldist_pelago__weight
          attr(nll, "nll_cdist_sumofsquares_aldist_seine__num") <- nll_cdist_sumofsquares_aldist_seine__num
          attr(nll, "nll_cdist_sumofsquares_aldist_seine__weight") <- nll_cdist_sumofsquares_aldist_seine__weight
          attr(nll, "nll_cdist_sumofsquares_ldist_ecocadiz__num") <- nll_cdist_sumofsquares_ldist_ecocadiz__num
          attr(nll, "nll_cdist_sumofsquares_ldist_ecocadiz__weight") <- nll_cdist_sumofsquares_ldist_ecocadiz__weight
          attr(nll, "nll_cdist_sumofsquares_ldist_pelago__num") <- nll_cdist_sumofsquares_ldist_pelago__num
          attr(nll, "nll_cdist_sumofsquares_ldist_pelago__weight") <- nll_cdist_sumofsquares_ldist_pelago__weight
          attr(nll, "nll_cdist_sumofsquares_ldist_seine__num") <- nll_cdist_sumofsquares_ldist_seine__num
          attr(nll, "nll_cdist_sumofsquares_ldist_seine__weight") <- nll_cdist_sumofsquares_ldist_seine__weight
          attr(nll, "nll_understocking__weight") <- nll_understocking__weight
          attr(nll, "nll_understocking__wgt") <- nll_understocking__wgt
          attr(nll, "PEL__catch") <- PEL__catch
          attr(nll, "seine1__catch") <- seine1__catch
          attr(nll, "seine1__catchnum") <- seine1__catchnum
          attr(nll, "seine2__catch") <- seine2__catch
          attr(nll, "seine2__catchnum") <- seine2__catchnum
        }
        return(nll)
      }
      cur_year <- start_year + (cur_time%/%step_count)
      cur_step <- (cur_time%%step_count) + 1L
      cur_step_final <- cur_step == step_count
      if (FALSE) 
        Rprintf("** Tick: %d-%d\n", cur_year, cur_step)
    }
    {
      anch__area_idx <- (1)
      {
        comment("g3a_initialconditions_normalparam for anch")
        for (age in seq(anch__minage, anch__maxage, 
                        by = 1)) if (cur_time == 0L) {
                          anch__age_idx <- age - anch__minage + 1L
                          {
                            area <- anch__area
                            {
                              comment("Calculate exp(-(dnorm**2) * 0.5)")
                              anch__num[, anch__area_idx, anch__age_idx] <- exp(-(((anch__midlen - 
                                                                                      ((bounded(param[["anch.Linf"]], 14, 
                                                                                                30) * (1 - exp(-1 * (0.001 * bounded(param[["anch.K"]], 
                                                                                                                                     50, 120)) * (age - (1 + log(1 - bounded(param[["anch.recl"]], 
                                                                                                                                                                             3, 15)/bounded(param[["anch.Linf"]], 
                                                                                                                                                                                            14, 30))/(0.001 * bounded(param[["anch.K"]], 
                                                                                                                                                                                                                      50, 120))))))))) * (1/(nvl(param[[paste("anch.init.sd", 
                                                                                                                                                                                                                                                              age, sep = ".")]], stop("Out of range: ", 
                                                                                                                                                                                                                                                                                      "anch.init.sd")))))^2) * 0.5)
                              comment("scale results")
                              anch__num[, anch__area_idx, anch__age_idx] <- anch__num[, 
                                                                                      anch__area_idx, anch__age_idx] * (10000/sum(anch__num[, 
                                                                                                                                            anch__area_idx, anch__age_idx]))
                              anch__num[, anch__area_idx, anch__age_idx] <- anch__num[, 
                                                                                      anch__area_idx, anch__age_idx] * ((bounded(param[["anch.scalar"]], 
                                                                                                                                 1, 100) * bounded(nvl(param[[paste("anch.init", 
                                                                                                                                                                    age, sep = ".")]], stop("Out of range: ", 
                                                                                                                                                                                            "anch.init")), 0.001, 200)) * exp(-1 * 
                                                                                                                                                                                                                                (nvl(param[[paste("M", age, sep = ".")]], 
                                                                                                                                                                                                                                     stop("Out of range: ", "M")) + bounded(param[["anch.init.F"]], 
                                                                                                                                                                                                                                                                            0, 3)) * (age - anch__minage)))
                              comment("Generate corresponding mean weight")
                              anch__wgt[, anch__area_idx, anch__age_idx] <- bounded(param[["anch.walpha"]], 
                                                                                    1e-07, 10) * anch__midlen^bounded(param[["anch.wbeta"]], 
                                                                                                                      1e-04, 10)
                            }
                          }
                        }
      }
    }
    {
      comment("Zero total predation counter for anch")
      anch__totalpredate[] <- 0
    }
    {
      comment("Zero biomass-caught counter for ECO")
      ECO__catch[] <- 0
    }
    {
      comment("Zero biomass-caught counter for PEL")
      PEL__catch[] <- 0
    }
    {
      comment("Zero biomass-caught counter for seine1")
      seine1__catch[] <- 0
      seine1__catchnum[] <- 0
    }
    {
      comment("Zero biomass-caught counter for seine2")
      seine2__catch[] <- 0
      seine2__catchnum[] <- 0
    }
    {
      ECO__area_idx <- (1)
      anch__area_idx <- (1)
      {
        comment("g3a_predate_fleet for anch")
        comment("Zero ECO-anch biomass-consuming counter")
        anch__ECO[] <- 0
        for (age in seq(anch__minage, anch__maxage, 
                        by = 1)) {
          anch__age_idx <- age - anch__minage + 1L
          area <- anch__area
          if (area == ECO__area) {
            fleet_area <- area
            {
              comment("Collect all suitable anch biomass for ECO")
              anch__suit_ECO[, anch__area_idx, anch__age_idx] <- 1/(1 + 
                                                                      exp(-bounded(param[["anch.ECO.alpha"]], 
                                                                                   0.2, 2.2) * (anch__midlen - bounded(param[["anch.ECO.l50"]], 
                                                                                                                       2, 20))))
              anch__ECO[, anch__area_idx, anch__age_idx] <- anch__suit_ECO[, 
                                                                           anch__area_idx, anch__age_idx] * anch__num[, 
                                                                                                                      anch__area_idx, anch__age_idx] * anch__wgt[, 
                                                                                                                                                                 anch__area_idx, anch__age_idx]
              ECO__catch[ECO__area_idx] <- ECO__catch[ECO__area_idx] + 
                sum(anch__ECO[, anch__area_idx, anch__age_idx])
            }
          }
        }
      }
    }
    {
      PEL__area_idx <- (1)
      anch__area_idx <- (1)
      {
        comment("g3a_predate_fleet for anch")
        comment("Zero PEL-anch biomass-consuming counter")
        anch__PEL[] <- 0
        for (age in seq(anch__minage, anch__maxage, 
                        by = 1)) {
          anch__age_idx <- age - anch__minage + 1L
          area <- anch__area
          if (area == PEL__area) {
            fleet_area <- area
            {
              comment("Collect all suitable anch biomass for PEL")
              anch__suit_PEL[, anch__area_idx, anch__age_idx] <- 1/(1 + 
                                                                      exp(-bounded(param[["anch.PEL.alpha"]], 
                                                                                   0.2, 1.5) * (anch__midlen - bounded(param[["anch.PEL.l50"]], 
                                                                                                                       2, 20))))
              anch__PEL[, anch__area_idx, anch__age_idx] <- anch__suit_PEL[, 
                                                                           anch__area_idx, anch__age_idx] * anch__num[, 
                                                                                                                      anch__area_idx, anch__age_idx] * anch__wgt[, 
                                                                                                                                                                 anch__area_idx, anch__age_idx]
              PEL__catch[PEL__area_idx] <- PEL__catch[PEL__area_idx] + 
                sum(anch__PEL[, anch__area_idx, anch__age_idx])
            }
          }
        }
      }
    }
    {
      seine1__area_idx <- (1)
      anch__area_idx <- (1)
      {
        comment("g3a_predate_fleet for anch")
        comment("Zero seine1-anch biomass-consuming counter")
        anch__seine1[] <- 0
        for (age in seq(anch__minage, anch__maxage, 
                        by = 1)) {
          anch__age_idx <- age - anch__minage + 1L
          area <- anch__area
          if (area == seine1__area) {
            fleet_area <- area
            {
              comment("Collect all suitable anch biomass for seine1")
              anch__suit_seine1[, anch__area_idx, anch__age_idx] <- 1/(1 + 
                                                                         exp(-param[["seine1.alpha"]] * (anch__midlen - 
                                                                                                           bounded(param[["anch.seine1.l50"]], 
                                                                                                                   1, 20))))
              anch__seine1[, anch__area_idx, anch__age_idx] <- anch__suit_seine1[, 
                                                                                 anch__area_idx, anch__age_idx] * anch__num[, 
                                                                                                                            anch__area_idx, anch__age_idx] * anch__wgt[, 
                                                                                                                                                                       anch__area_idx, anch__age_idx]
              seine1__catch[seine1__area_idx] <- seine1__catch[seine1__area_idx] + 
                sum(anch__seine1[, anch__area_idx, anch__age_idx])
              seine1__catchnum[seine1__area_idx] <- seine1__catchnum[seine1__area_idx] + 
                sum(anch__suit_seine1[, anch__area_idx, 
                                      anch__age_idx] * anch__num[, anch__area_idx, 
                                                                 anch__age_idx])
            }
          }
        }
      }
    }
    {
      seine2__area_idx <- (1)
      anch__area_idx <- (1)
      {
        comment("g3a_predate_fleet for anch")
        comment("Zero seine2-anch biomass-consuming counter")
        anch__seine2[] <- 0
        for (age in seq(anch__minage, anch__maxage, 
                        by = 1)) {
          anch__age_idx <- age - anch__minage + 1L
          area <- anch__area
          if (area == seine2__area) {
            fleet_area <- area
            {
              comment("Collect all suitable anch biomass for seine2")
              anch__suit_seine2[, anch__area_idx, anch__age_idx] <- 1/(1 + 
                                                                         exp(-param[["seine2.alpha"]] * (anch__midlen - 
                                                                                                           bounded(param[["anch.seine2.l50"]], 
                                                                                                                   6, 15))))
              anch__seine2[, anch__area_idx, anch__age_idx] <- anch__suit_seine2[, 
                                                                                 anch__area_idx, anch__age_idx] * anch__num[, 
                                                                                                                            anch__area_idx, anch__age_idx] * anch__wgt[, 
                                                                                                                                                                       anch__area_idx, anch__age_idx]
              seine2__catch[seine2__area_idx] <- seine2__catch[seine2__area_idx] + 
                sum(anch__seine2[, anch__area_idx, anch__age_idx])
              seine2__catchnum[seine2__area_idx] <- seine2__catchnum[seine2__area_idx] + 
                sum(anch__suit_seine2[, anch__area_idx, 
                                      anch__age_idx] * anch__num[, anch__area_idx, 
                                                                 anch__age_idx])
            }
          }
        }
      }
    }
    {
      ECO__area_idx <- (1)
      anch__area_idx <- (1)
      {
        comment("Scale ECO catch of anch by total expected catch")
        for (age in seq(anch__minage, anch__maxage, 
                        by = 1)) {
          anch__age_idx <- age - anch__minage + 1L
          area <- anch__area
          if (area == ECO__area) {
            fleet_area <- area
            {
              anch__ECO[, anch__area_idx, anch__age_idx] <- anch__ECO[, 
                                                                      anch__area_idx, anch__age_idx] * ((if (area != 
                                                                                                             1) 
                                                                        0
                                                                        else inttypelookup_getdefault(ECO_landings__lookup, 
                                                                                                      (cur_year * 10L + cur_step), 0))/ECO__catch[ECO__area_idx])
              anch__totalpredate[, anch__area_idx, anch__age_idx] <- anch__totalpredate[, 
                                                                                        anch__area_idx, anch__age_idx] + anch__ECO[, 
                                                                                                                                   anch__area_idx, anch__age_idx]
            }
          }
        }
      }
    }
    {
      PEL__area_idx <- (1)
      anch__area_idx <- (1)
      {
        comment("Scale PEL catch of anch by total expected catch")
        for (age in seq(anch__minage, anch__maxage, 
                        by = 1)) {
          anch__age_idx <- age - anch__minage + 1L
          area <- anch__area
          if (area == PEL__area) {
            fleet_area <- area
            {
              anch__PEL[, anch__area_idx, anch__age_idx] <- anch__PEL[, 
                                                                      anch__area_idx, anch__age_idx] * ((if (area != 
                                                                                                             1) 
                                                                        0
                                                                        else inttypelookup_getdefault(PEL_landings__lookup, 
                                                                                                      (cur_year * 10L + cur_step), 0))/PEL__catch[PEL__area_idx])
              anch__totalpredate[, anch__area_idx, anch__age_idx] <- anch__totalpredate[, 
                                                                                        anch__area_idx, anch__age_idx] + anch__PEL[, 
                                                                                                                                   anch__area_idx, anch__age_idx]
            }
          }
        }
      }
    }
    {
      seine1__area_idx <- (1)
      anch__area_idx <- (1)
      {
        comment("Scale seine1 catch of anch by total expected catch")
        for (age in seq(anch__minage, anch__maxage, 
                        by = 1)) {
          anch__age_idx <- age - anch__minage + 1L
          area <- anch__area
          if (area == seine1__area) {
            fleet_area <- area
            {
              anch__seine1[, anch__area_idx, anch__age_idx] <- (anch__seine1[, 
                                                                             anch__area_idx, anch__age_idx]/anch__wgt[, 
                                                                                                                      anch__area_idx, anch__age_idx]) * ((if (area != 
                                                                                                                                                              1) 
                                                                                                                        0
                                                                                                                        else inttypelookup_getdefault(seine1_landings__lookup, 
                                                                                                                                                      (cur_year * 10L + cur_step), 0))/seine1__catchnum[seine1__area_idx])
              anch__totalpredate[, anch__area_idx, anch__age_idx] <- anch__totalpredate[, 
                                                                                        anch__area_idx, anch__age_idx] + anch__seine1[, 
                                                                                                                                      anch__area_idx, anch__age_idx]
            }
          }
        }
      }
    }
    {
      seine2__area_idx <- (1)
      anch__area_idx <- (1)
      {
        comment("Scale seine2 catch of anch by total expected catch")
        for (age in seq(anch__minage, anch__maxage, 
                        by = 1)) {
          anch__age_idx <- age - anch__minage + 1L
          area <- anch__area
          if (area == seine2__area) {
            fleet_area <- area
            {
              anch__seine2[, anch__area_idx, anch__age_idx] <- (anch__seine2[, 
                                                                             anch__area_idx, anch__age_idx]/anch__wgt[, 
                                                                                                                      anch__area_idx, anch__age_idx]) * ((if (area != 
                                                                                                                                                              1) 
                                                                                                                        0
                                                                                                                        else inttypelookup_getdefault(seine2_landings__lookup, 
                                                                                                                                                      (cur_year * 10L + cur_step), 0))/seine2__catchnum[seine2__area_idx])
              anch__totalpredate[, anch__area_idx, anch__age_idx] <- anch__totalpredate[, 
                                                                                        anch__area_idx, anch__age_idx] + anch__seine2[, 
                                                                                                                                      anch__area_idx, anch__age_idx]
            }
          }
        }
      }
    }
    {
      comment("Temporarily convert to being proportion of totalpredate")
      anch__ECO <- anch__ECO/avoid_zero_vec(anch__totalpredate)
    }
    {
      comment("Temporarily convert to being proportion of totalpredate")
      anch__PEL <- anch__PEL/avoid_zero_vec(anch__totalpredate)
    }
    {
      comment("Temporarily convert to being proportion of totalpredate")
      anch__seine1 <- anch__seine1/avoid_zero_vec(anch__totalpredate)
    }
    {
      comment("Temporarily convert to being proportion of totalpredate")
      anch__seine2 <- anch__seine2/avoid_zero_vec(anch__totalpredate)
    }
    {
      comment("Calculate anch overconsumption coefficient")
      anch__consratio <- anch__totalpredate/avoid_zero_vec(anch__num * 
                                                             anch__wgt)
      anch__consratio <- 0.96 - logspace_add_vec((0.96 - 
                                                    anch__consratio) * 100, 0.96)/100
      if (FALSE) 
        assert_msg(~all(anch__consratio <= 1), "g3a_predate_fleet: anch__consratio <= 1, can't consume more fish than currently exist")
      comment("Apply overconsumption to prey")
      anch__overconsumption <- sum(anch__totalpredate)
      anch__totalpredate <- (anch__num * anch__wgt) * 
        anch__consratio
      anch__overconsumption <- anch__overconsumption - 
        sum(anch__totalpredate)
      anch__num <- anch__num * (1 - anch__consratio)
    }
    {
      comment("Zero ECO catch before working out post-adjustment value")
      ECO__catch[] <- 0
    }
    {
      anch__area_idx <- (1)
      ECO__area_idx <- (1)
      {
        comment("Revert to being total biomass (applying overconsumption in process)")
        anch__ECO <- anch__ECO * anch__totalpredate
        comment("Update total catch")
        for (age in seq(anch__minage, anch__maxage, 
                        by = 1)) {
          anch__age_idx <- age - anch__minage + 1L
          area <- anch__area
          if (area == ECO__area) {
            fleet_area <- area
            ECO__catch[ECO__area_idx] <- ECO__catch[ECO__area_idx] + 
              sum(anch__ECO[, anch__area_idx, anch__age_idx])
          }
        }
      }
    }
    {
      comment("Zero PEL catch before working out post-adjustment value")
      PEL__catch[] <- 0
    }
    {
      anch__area_idx <- (1)
      PEL__area_idx <- (1)
      {
        comment("Revert to being total biomass (applying overconsumption in process)")
        anch__PEL <- anch__PEL * anch__totalpredate
        comment("Update total catch")
        for (age in seq(anch__minage, anch__maxage, 
                        by = 1)) {
          anch__age_idx <- age - anch__minage + 1L
          area <- anch__area
          if (area == PEL__area) {
            fleet_area <- area
            PEL__catch[PEL__area_idx] <- PEL__catch[PEL__area_idx] + 
              sum(anch__PEL[, anch__area_idx, anch__age_idx])
          }
        }
      }
    }
    {
      comment("Zero seine1 catch before working out post-adjustment value")
      seine1__catch[] <- 0
      seine1__catchnum[] <- 0
    }
    {
      anch__area_idx <- (1)
      seine1__area_idx <- (1)
      {
        comment("Revert to being total biomass (applying overconsumption in process)")
        anch__seine1 <- anch__seine1 * anch__totalpredate
        comment("Update total catch")
        for (age in seq(anch__minage, anch__maxage, 
                        by = 1)) {
          anch__age_idx <- age - anch__minage + 1L
          area <- anch__area
          if (area == seine1__area) {
            fleet_area <- area
            {
              seine1__catch[seine1__area_idx] <- seine1__catch[seine1__area_idx] + 
                sum(anch__seine1[, anch__area_idx, anch__age_idx])
              seine1__catchnum[seine1__area_idx] <- seine1__catchnum[seine1__area_idx] + 
                sum(anch__seine1[, anch__area_idx, anch__age_idx]/anch__wgt)
            }
          }
        }
      }
    }
    {
      comment("Zero seine2 catch before working out post-adjustment value")
      seine2__catch[] <- 0
      seine2__catchnum[] <- 0
    }
    {
      anch__area_idx <- (1)
      seine2__area_idx <- (1)
      {
        comment("Revert to being total biomass (applying overconsumption in process)")
        anch__seine2 <- anch__seine2 * anch__totalpredate
        comment("Update total catch")
        for (age in seq(anch__minage, anch__maxage, 
                        by = 1)) {
          anch__age_idx <- age - anch__minage + 1L
          area <- anch__area
          if (area == seine2__area) {
            fleet_area <- area
            {
              seine2__catch[seine2__area_idx] <- seine2__catch[seine2__area_idx] + 
                sum(anch__seine2[, anch__area_idx, anch__age_idx])
              seine2__catchnum[seine2__area_idx] <- seine2__catchnum[seine2__area_idx] + 
                sum(anch__seine2[, anch__area_idx, anch__age_idx]/anch__wgt)
            }
          }
        }
      }
    }
    {
      anch__area_idx <- (1)
      {
        comment("Natural mortality for anch")
        for (age in seq(anch__minage, anch__maxage, 
                        by = 1)) {
          anch__age_idx <- age - anch__minage + 1L
          area <- anch__area
          anch__num[, anch__area_idx, anch__age_idx] <- anch__num[, 
                                                                  anch__area_idx, anch__age_idx] * exp(-(nvl(param[[paste("M", 
                                                                                                                          age, sep = ".")]], stop("Out of range: ", 
                                                                                                                                                  "M"))) * cur_step_size)
        }
      }
    }
    {
      anch__area_idx <- (1)
      {
        comment("g3a_renewal_normalparam for anch")
        for (age in seq(anch__minage, anch__maxage, 
                        by = 1)) if ((cur_step == c(2, 3, 4) && age == 
                                      anch__minage && cur_year < 1989 && cur_time > 
                                      0)) {
                          anch__age_idx <- age - anch__minage + 1L
                          {
                            area <- anch__area
                            {
                              comment("Calculate exp(-(dnorm**2) * 0.5)")
                              anch__renewalnum[, anch__area_idx, anch__age_idx] <- exp(-(((anch__midlen - 
                                                                                             ((bounded(param[["anch.Linf"]], 14, 
                                                                                                       30) * (1 - exp(-1 * (0.001 * bounded(param[["anch.K"]], 
                                                                                                                                            50, 120)) * (age - (1 + log(1 - bounded(param[["anch.recl"]], 
                                                                                                                                                                                    3, 15)/bounded(param[["anch.Linf"]], 
                                                                                                                                                                                                   14, 30))/(0.001 * bounded(param[["anch.K"]], 
                                                                                                                                                                                                                             50, 120))))))))) * (1/(bounded(param[["anch.sdrecl"]], 
                                                                                                                                                                                                                                                            0.5, 4))))^2) * 0.5)
                              comment("scale results")
                              anch__renewalnum[, anch__area_idx, anch__age_idx] <- anch__renewalnum[, 
                                                                                                    anch__area_idx, anch__age_idx] * (10000/sum(anch__renewalnum[, 
                                                                                                                                                                 anch__area_idx, anch__age_idx]))
                              anch__renewalnum[, anch__area_idx, anch__age_idx] <- anch__renewalnum[, 
                                                                                                    anch__area_idx, anch__age_idx] * (bounded(param[["anch.scalar"]], 
                                                                                                                                              1, 100) * bounded(nvl(param[[paste("anch.renew", 
                                                                                                                                                                                 cur_year, cur_step, sep = ".")]], stop("Out of range: ", 
                                                                                                                                                                                                                        "anch.renew")), 0.001, 200))
                              comment("Generate corresponding mean weight")
                              anch__renewalwgt[, anch__area_idx, anch__age_idx] <- bounded(param[["anch.walpha"]], 
                                                                                           1e-07, 10) * anch__midlen^bounded(param[["anch.wbeta"]], 
                                                                                                                             1e-04, 10)
                              comment("Add result to anch")
                              anch__wgt[, anch__area_idx, anch__age_idx] <- ratio_add_vec(anch__wgt[, 
                                                                                                    anch__area_idx, anch__age_idx], anch__num[, 
                                                                                                                                              anch__area_idx, anch__age_idx], anch__renewalwgt[, 
                                                                                                                                                                                               anch__area_idx, anch__age_idx], anch__renewalnum[, 
                                                                                                                                                                                                                                                anch__area_idx, anch__age_idx])
                              anch__num[, anch__area_idx, anch__age_idx] <- anch__num[, 
                                                                                      anch__area_idx, anch__age_idx] + anch__renewalnum[, 
                                                                                                                                        anch__area_idx, anch__age_idx]
                            }
                          }
                        }
      }
    }
    {
      anch__area_idx <- (1)
      {
        comment("g3a_renewal_normalparam for anch")
        for (age in seq(anch__minage, anch__maxage, 
                        by = 1)) if ((cur_step == 1 && age == anch__minage && 
                                      cur_year > 1988)) {
                          anch__age_idx <- age - anch__minage + 1L
                          {
                            area <- anch__area
                            {
                              comment("Calculate exp(-(dnorm**2) * 0.5)")
                              anch__renewalnum[, anch__area_idx, anch__age_idx] <- exp(-(((anch__midlen - 
                                                                                             ((bounded(param[["anch.Linf"]], 14, 
                                                                                                       30) * (1 - exp(-1 * (0.001 * bounded(param[["anch.K"]], 
                                                                                                                                            50, 120)) * (age - (1 + log(1 - bounded(param[["anch.recl"]], 
                                                                                                                                                                                    3, 15)/bounded(param[["anch.Linf"]], 
                                                                                                                                                                                                   14, 30))/(0.001 * bounded(param[["anch.K"]], 
                                                                                                                                                                                                                             50, 120))))))))) * (1/(bounded(param[["anch.sdrecl"]], 
                                                                                                                                                                                                                                                            0.5, 4))))^2) * 0.5)
                              comment("scale results")
                              anch__renewalnum[, anch__area_idx, anch__age_idx] <- anch__renewalnum[, 
                                                                                                    anch__area_idx, anch__age_idx] * (10000/sum(anch__renewalnum[, 
                                                                                                                                                                 anch__area_idx, anch__age_idx]))
                              anch__renewalnum[, anch__area_idx, anch__age_idx] <- anch__renewalnum[, 
                                                                                                    anch__area_idx, anch__age_idx] * (bounded(param[["anch.scalar"]], 
                                                                                                                                              1, 100) * bounded(nvl(param[[paste("anch.renew", 
                                                                                                                                                                                 cur_year, cur_step, sep = ".")]], stop("Out of range: ", 
                                                                                                                                                                                                                        "anch.renew")), 0.001, 200))
                              comment("Generate corresponding mean weight")
                              anch__renewalwgt[, anch__area_idx, anch__age_idx] <- bounded(param[["anch.walpha"]], 
                                                                                           1e-07, 10) * anch__midlen^bounded(param[["anch.wbeta"]], 
                                                                                                                             1e-04, 10)
                              comment("Add result to anch")
                              anch__wgt[, anch__area_idx, anch__age_idx] <- ratio_add_vec(anch__wgt[, 
                                                                                                    anch__area_idx, anch__age_idx], anch__num[, 
                                                                                                                                              anch__area_idx, anch__age_idx], anch__renewalwgt[, 
                                                                                                                                                                                               anch__area_idx, anch__age_idx], anch__renewalnum[, 
                                                                                                                                                                                                                                                anch__area_idx, anch__age_idx])
                              anch__num[, anch__area_idx, anch__age_idx] <- anch__num[, 
                                                                                      anch__area_idx, anch__age_idx] + anch__renewalnum[, 
                                                                                                                                        anch__area_idx, anch__age_idx]
                            }
                          }
                        }
      }
    }
    {
      anch__area_idx <- (1)
      {
        comment("g3l_abundancedistribution_surveyindices_log: Collect abundance from anch for adist_surveyindices_log_ecocadiz_bioindex")
        for (age in seq(anch__minage, anch__maxage, 
                        by = 1)) {
          anch__age_idx <- age - anch__minage + 1L
          area <- anch__area
          adist_surveyindices_log_ecocadiz_bioindex_model__areagroup_idx <- intintlookup_getdefault(adist_surveyindices_log_ecocadiz_bioindex_model__lookup, 
                                                                                                    area, -1L)
          if (adist_surveyindices_log_ecocadiz_bioindex_model__areagroup_idx > 
              -1L) {
            adist_surveyindices_log_ecocadiz_bioindex_model__time_idx <- intintlookup_getdefault(times_adist_surveyindices_log_ecocadiz_bioindex_model__lookup, 
                                                                                                 (cur_year * 10L + cur_step), -1L)
            if (adist_surveyindices_log_ecocadiz_bioindex_model__time_idx >= 
                (1L)) {
              comment("Add anch individuals to our count")
              adist_surveyindices_log_ecocadiz_bioindex_model__num[, 
                                                                   adist_surveyindices_log_ecocadiz_bioindex_model__time_idx, 
                                                                   adist_surveyindices_log_ecocadiz_bioindex_model__areagroup_idx] <- adist_surveyindices_log_ecocadiz_bioindex_model__num[, 
                                                                                                                                                                                           adist_surveyindices_log_ecocadiz_bioindex_model__time_idx, 
                                                                                                                                                                                           adist_surveyindices_log_ecocadiz_bioindex_model__areagroup_idx] + 
                g3_matrix_vec(anch_adist_surveyindices_log_ecocadiz_bioindex_model_lgmatrix, 
                              anch__num[, anch__area_idx, anch__age_idx])
            }
          }
        }
      }
    }
    {
      adist_surveyindices_log_ecocadiz_bioindex_model__max_time_idx <- (13L)
      {
        comment("g3l_abundancedistribution_surveyindices_log: Compare adist_surveyindices_log_ecocadiz_bioindex_model to adist_surveyindices_log_ecocadiz_bioindex_obs")
        for (adist_surveyindices_log_ecocadiz_bioindex_model__areagroup_idx in seq_along(adist_surveyindices_log_ecocadiz_bioindex_model__minareas)) {
          area <- adist_surveyindices_log_ecocadiz_bioindex_model__minareas[[adist_surveyindices_log_ecocadiz_bioindex_model__areagroup_idx]]
          adist_surveyindices_log_ecocadiz_bioindex_model__time_idx <- intintlookup_getdefault(times_adist_surveyindices_log_ecocadiz_bioindex_model__lookup, 
                                                                                               (cur_year * 10L + cur_step), -1L)
          if (adist_surveyindices_log_ecocadiz_bioindex_model__time_idx >= 
              (1L)) {
            adist_surveyindices_log_ecocadiz_bioindex_obs__areagroup_idx <- intintlookup_getdefault(adist_surveyindices_log_ecocadiz_bioindex_obs__lookup, 
                                                                                                    area, -1L)
            if (adist_surveyindices_log_ecocadiz_bioindex_obs__areagroup_idx > 
                -1L) {
              adist_surveyindices_log_ecocadiz_bioindex_obs__time_idx <- intintlookup_getdefault(times_adist_surveyindices_log_ecocadiz_bioindex_obs__lookup, 
                                                                                                 (cur_year * 10L + cur_step), -1L)
              if (adist_surveyindices_log_ecocadiz_bioindex_obs__time_idx >= 
                  (1L)) {
                adist_surveyindices_log_ecocadiz_bioindex_model__params <- if (adist_surveyindices_log_ecocadiz_bioindex_model__time_idx != 
                                                                               adist_surveyindices_log_ecocadiz_bioindex_model__max_time_idx) 
                  adist_surveyindices_log_ecocadiz_bioindex_model__params
                else surveyindices_linreg(log(avoid_zero_vec(adist_surveyindices_log_ecocadiz_bioindex_model__num[, 
                                                                                                                  , adist_surveyindices_log_ecocadiz_bioindex_model__areagroup_idx])), 
                                          log(avoid_zero_vec(adist_surveyindices_log_ecocadiz_bioindex_obs__num[, 
                                                                                                                , adist_surveyindices_log_ecocadiz_bioindex_obs__areagroup_idx])), 
                                          param[["anch.eco_alpha1"]], 1)
                {
                  cur_cdist_nll <- if (adist_surveyindices_log_ecocadiz_bioindex_model__time_idx != 
                                       adist_surveyindices_log_ecocadiz_bioindex_model__max_time_idx) 
                    0
                  else sum((adist_surveyindices_log_ecocadiz_bioindex_model__params[[1]] + 
                              adist_surveyindices_log_ecocadiz_bioindex_model__params[[2]] * 
                              log(avoid_zero_vec(adist_surveyindices_log_ecocadiz_bioindex_model__num[, 
                                                                                                      , adist_surveyindices_log_ecocadiz_bioindex_model__areagroup_idx])) - 
                              log(avoid_zero_vec(adist_surveyindices_log_ecocadiz_bioindex_obs__num[, 
                                                                                                    , adist_surveyindices_log_ecocadiz_bioindex_obs__areagroup_idx])))^2)
                  {
                    nll <- nll + param[["adist_surveyindices_log_ecocadiz_bioindex_weight"]] * 
                      cur_cdist_nll
                    nll_adist_surveyindices_log_ecocadiz_bioindex__num[cur_time + 
                                                                         1L] <- nll_adist_surveyindices_log_ecocadiz_bioindex__num[cur_time + 
                                                                                                                                     1L] + cur_cdist_nll
                    nll_adist_surveyindices_log_ecocadiz_bioindex__weight[cur_time + 
                                                                            1L] <- param[["adist_surveyindices_log_ecocadiz_bioindex_weight"]]
                    attr(nll, "adist_surveyindices_log_ecocadiz_bioindex_obs__num") <- adist_surveyindices_log_ecocadiz_bioindex_obs__num
                  }
                }
              }
            }
          }
        }
      }
    }
    {
      anch__area_idx <- (1)
      {
        comment("g3l_abundancedistribution_surveyindices_log: Collect abundance from anch for adist_surveyindices_log_pelago_bioindex")
        for (age in seq(anch__minage, anch__maxage, 
                        by = 1)) {
          anch__age_idx <- age - anch__minage + 1L
          area <- anch__area
          adist_surveyindices_log_pelago_bioindex_model__areagroup_idx <- intintlookup_getdefault(adist_surveyindices_log_pelago_bioindex_model__lookup, 
                                                                                                  area, -1L)
          if (adist_surveyindices_log_pelago_bioindex_model__areagroup_idx > 
              -1L) {
            adist_surveyindices_log_pelago_bioindex_model__time_idx <- intintlookup_getdefault(times_adist_surveyindices_log_pelago_bioindex_model__lookup, 
                                                                                               (cur_year * 10L + cur_step), -1L)
            if (adist_surveyindices_log_pelago_bioindex_model__time_idx >= 
                (1L)) {
              comment("Add anch individuals to our count")
              adist_surveyindices_log_pelago_bioindex_model__num[, 
                                                                 adist_surveyindices_log_pelago_bioindex_model__time_idx, 
                                                                 adist_surveyindices_log_pelago_bioindex_model__areagroup_idx] <- adist_surveyindices_log_pelago_bioindex_model__num[, 
                                                                                                                                                                                     adist_surveyindices_log_pelago_bioindex_model__time_idx, 
                                                                                                                                                                                     adist_surveyindices_log_pelago_bioindex_model__areagroup_idx] + 
                g3_matrix_vec(anch_adist_surveyindices_log_pelago_bioindex_model_lgmatrix, 
                              anch__num[, anch__area_idx, anch__age_idx])
            }
          }
        }
      }
    }
    {
      adist_surveyindices_log_pelago_bioindex_model__max_time_idx <- (19L)
      {
        comment("g3l_abundancedistribution_surveyindices_log: Compare adist_surveyindices_log_pelago_bioindex_model to adist_surveyindices_log_pelago_bioindex_obs")
        for (adist_surveyindices_log_pelago_bioindex_model__areagroup_idx in seq_along(adist_surveyindices_log_pelago_bioindex_model__minareas)) {
          area <- adist_surveyindices_log_pelago_bioindex_model__minareas[[adist_surveyindices_log_pelago_bioindex_model__areagroup_idx]]
          adist_surveyindices_log_pelago_bioindex_model__time_idx <- intintlookup_getdefault(times_adist_surveyindices_log_pelago_bioindex_model__lookup, 
                                                                                             (cur_year * 10L + cur_step), -1L)
          if (adist_surveyindices_log_pelago_bioindex_model__time_idx >= 
              (1L)) {
            adist_surveyindices_log_pelago_bioindex_obs__areagroup_idx <- intintlookup_getdefault(adist_surveyindices_log_pelago_bioindex_obs__lookup, 
                                                                                                  area, -1L)
            if (adist_surveyindices_log_pelago_bioindex_obs__areagroup_idx > 
                -1L) {
              adist_surveyindices_log_pelago_bioindex_obs__time_idx <- intintlookup_getdefault(times_adist_surveyindices_log_pelago_bioindex_obs__lookup, 
                                                                                               (cur_year * 10L + cur_step), -1L)
              if (adist_surveyindices_log_pelago_bioindex_obs__time_idx >= 
                  (1L)) {
                adist_surveyindices_log_pelago_bioindex_model__params <- if (adist_surveyindices_log_pelago_bioindex_model__time_idx != 
                                                                             adist_surveyindices_log_pelago_bioindex_model__max_time_idx) 
                  adist_surveyindices_log_pelago_bioindex_model__params
                else surveyindices_linreg(log(avoid_zero_vec(adist_surveyindices_log_pelago_bioindex_model__num[, 
                                                                                                                , adist_surveyindices_log_pelago_bioindex_model__areagroup_idx])), 
                                          log(avoid_zero_vec(adist_surveyindices_log_pelago_bioindex_obs__num[, 
                                                                                                              , adist_surveyindices_log_pelago_bioindex_obs__areagroup_idx])), 
                                          param[["anch.pel_alpha2"]], 1)
                {
                  cur_cdist_nll <- if (adist_surveyindices_log_pelago_bioindex_model__time_idx != 
                                       adist_surveyindices_log_pelago_bioindex_model__max_time_idx) 
                    0
                  else sum((adist_surveyindices_log_pelago_bioindex_model__params[[1]] + 
                              adist_surveyindices_log_pelago_bioindex_model__params[[2]] * 
                              log(avoid_zero_vec(adist_surveyindices_log_pelago_bioindex_model__num[, 
                                                                                                    , adist_surveyindices_log_pelago_bioindex_model__areagroup_idx])) - 
                              log(avoid_zero_vec(adist_surveyindices_log_pelago_bioindex_obs__num[, 
                                                                                                  , adist_surveyindices_log_pelago_bioindex_obs__areagroup_idx])))^2)
                  {
                    nll <- nll + param[["adist_surveyindices_log_pelago_bioindex_weight"]] * 
                      cur_cdist_nll
                    nll_adist_surveyindices_log_pelago_bioindex__num[cur_time + 
                                                                       1L] <- nll_adist_surveyindices_log_pelago_bioindex__num[cur_time + 
                                                                                                                                 1L] + cur_cdist_nll
                    nll_adist_surveyindices_log_pelago_bioindex__weight[cur_time + 
                                                                          1L] <- param[["adist_surveyindices_log_pelago_bioindex_weight"]]
                    attr(nll, "adist_surveyindices_log_pelago_bioindex_obs__num") <- adist_surveyindices_log_pelago_bioindex_obs__num
                  }
                }
              }
            }
          }
        }
      }
    }
    {
      anch__area_idx <- (1)
      {
        comment("g3l_catchdistribution_sumofsquares: Collect catch from ECO/anch for cdist_sumofsquares_aldist_ecocadiz")
        for (age in seq(anch__minage, anch__maxage, 
                        by = 1)) {
          anch__age_idx <- age - anch__minage + 1L
          area <- anch__area
          cdist_sumofsquares_aldist_ecocadiz_model__areagroup_idx <- intintlookup_getdefault(cdist_sumofsquares_aldist_ecocadiz_model__lookup, 
                                                                                             area, -1L)
          if (cdist_sumofsquares_aldist_ecocadiz_model__areagroup_idx > 
              -1L) {
            cdist_sumofsquares_aldist_ecocadiz_model__time_idx <- intintlookup_getdefault(times_cdist_sumofsquares_aldist_ecocadiz_model__lookup, 
                                                                                          (cur_year * 10L + cur_step), -1L)
            if (cdist_sumofsquares_aldist_ecocadiz_model__time_idx >= 
                (1L)) {
              cdist_sumofsquares_aldist_ecocadiz_model__agegroup_idx <- intintlookup_getdefault(ages_cdist_sumofsquares_aldist_ecocadiz_model__lookup, 
                                                                                                age, -1L)
              if (cdist_sumofsquares_aldist_ecocadiz_model__agegroup_idx > 
                  -1L) {
                comment("Take prey_stock__fleet_stock weight, convert to individuals, add to our count")
                cdist_sumofsquares_aldist_ecocadiz_model__num[, 
                                                              cdist_sumofsquares_aldist_ecocadiz_model__agegroup_idx, 
                                                              cdist_sumofsquares_aldist_ecocadiz_model__time_idx, 
                                                              cdist_sumofsquares_aldist_ecocadiz_model__areagroup_idx] <- cdist_sumofsquares_aldist_ecocadiz_model__num[, 
                                                                                                                                                                        cdist_sumofsquares_aldist_ecocadiz_model__agegroup_idx, 
                                                                                                                                                                        cdist_sumofsquares_aldist_ecocadiz_model__time_idx, 
                                                                                                                                                                        cdist_sumofsquares_aldist_ecocadiz_model__areagroup_idx] + 
                  g3_matrix_vec(anch_cdist_sumofsquares_aldist_ecocadiz_model_lgmatrix, 
                                (anch__ECO[, anch__area_idx, anch__age_idx]/avoid_zero_vec(anch__wgt[, 
                                                                                                     anch__area_idx, anch__age_idx])))
              }
            }
          }
        }
      }
    }
    {
      comment("g3l_catchdistribution_sumofsquares: Compare cdist_sumofsquares_aldist_ecocadiz_model to cdist_sumofsquares_aldist_ecocadiz_obs")
      for (cdist_sumofsquares_aldist_ecocadiz_model__areagroup_idx in seq_along(cdist_sumofsquares_aldist_ecocadiz_model__minareas)) {
        area <- cdist_sumofsquares_aldist_ecocadiz_model__minareas[[cdist_sumofsquares_aldist_ecocadiz_model__areagroup_idx]]
        cdist_sumofsquares_aldist_ecocadiz_model__time_idx <- intintlookup_getdefault(times_cdist_sumofsquares_aldist_ecocadiz_model__lookup, 
                                                                                      (cur_year * 10L + cur_step), -1L)
        if (cdist_sumofsquares_aldist_ecocadiz_model__time_idx >= 
            (1L)) 
          for (cdist_sumofsquares_aldist_ecocadiz_model__agegroup_idx in seq_along(cdist_sumofsquares_aldist_ecocadiz_model__minages)) {
            age <- cdist_sumofsquares_aldist_ecocadiz_model__minages[[cdist_sumofsquares_aldist_ecocadiz_model__agegroup_idx]]
            cdist_sumofsquares_aldist_ecocadiz_obs__areagroup_idx <- intintlookup_getdefault(cdist_sumofsquares_aldist_ecocadiz_obs__lookup, 
                                                                                             area, -1L)
            if (cdist_sumofsquares_aldist_ecocadiz_obs__areagroup_idx > 
                -1L) {
              cdist_sumofsquares_aldist_ecocadiz_obs__time_idx <- intintlookup_getdefault(times_cdist_sumofsquares_aldist_ecocadiz_obs__lookup, 
                                                                                          (cur_year * 10L + cur_step), -1L)
              if (cdist_sumofsquares_aldist_ecocadiz_obs__time_idx >= 
                  (1L)) {
                cdist_sumofsquares_aldist_ecocadiz_obs__agegroup_idx <- intintlookup_getdefault(ages_cdist_sumofsquares_aldist_ecocadiz_model__lookup, 
                                                                                                age, -1L)
                if (cdist_sumofsquares_aldist_ecocadiz_obs__agegroup_idx > 
                    -1L) {
                  cur_cdist_nll <- sum((cdist_sumofsquares_aldist_ecocadiz_model__num[, 
                                                                                      cdist_sumofsquares_aldist_ecocadiz_model__agegroup_idx, 
                                                                                      cdist_sumofsquares_aldist_ecocadiz_model__time_idx, 
                                                                                      cdist_sumofsquares_aldist_ecocadiz_model__areagroup_idx]/avoid_zero(sum(cdist_sumofsquares_aldist_ecocadiz_model__num[, 
                                                                                                                                                                                                            , cdist_sumofsquares_aldist_ecocadiz_model__time_idx, 
                                                                                                                                                                                                            cdist_sumofsquares_aldist_ecocadiz_model__areagroup_idx])) - 
                                          cdist_sumofsquares_aldist_ecocadiz_obs__num[, 
                                                                                      cdist_sumofsquares_aldist_ecocadiz_obs__agegroup_idx, 
                                                                                      cdist_sumofsquares_aldist_ecocadiz_obs__time_idx, 
                                                                                      cdist_sumofsquares_aldist_ecocadiz_obs__areagroup_idx]/avoid_zero(sum(cdist_sumofsquares_aldist_ecocadiz_obs__num[, 
                                                                                                                                                                                                        , cdist_sumofsquares_aldist_ecocadiz_obs__time_idx, 
                                                                                                                                                                                                        cdist_sumofsquares_aldist_ecocadiz_obs__areagroup_idx])))^2)
                  {
                    nll <- nll + param[["cdist_sumofsquares_aldist_ecocadiz_weight"]] * 
                      cur_cdist_nll
                    nll_cdist_sumofsquares_aldist_ecocadiz__num[cur_time + 
                                                                  1L] <- nll_cdist_sumofsquares_aldist_ecocadiz__num[cur_time + 
                                                                                                                       1L] + cur_cdist_nll
                    nll_cdist_sumofsquares_aldist_ecocadiz__weight[cur_time + 
                                                                     1L] <- param[["cdist_sumofsquares_aldist_ecocadiz_weight"]]
                    attr(nll, "cdist_sumofsquares_aldist_ecocadiz_obs__num") <- cdist_sumofsquares_aldist_ecocadiz_obs__num
                  }
                }
              }
            }
          }
      }
    }
    {
      anch__area_idx <- (1)
      {
        comment("g3l_catchdistribution_sumofsquares: Collect catch from PEL/anch for cdist_sumofsquares_aldist_pelago")
        for (age in seq(anch__minage, anch__maxage, 
                        by = 1)) {
          anch__age_idx <- age - anch__minage + 1L
          area <- anch__area
          cdist_sumofsquares_aldist_pelago_model__areagroup_idx <- intintlookup_getdefault(cdist_sumofsquares_aldist_pelago_model__lookup, 
                                                                                           area, -1L)
          if (cdist_sumofsquares_aldist_pelago_model__areagroup_idx > 
              -1L) {
            cdist_sumofsquares_aldist_pelago_model__time_idx <- intintlookup_getdefault(times_cdist_sumofsquares_aldist_pelago_model__lookup, 
                                                                                        (cur_year * 10L + cur_step), -1L)
            if (cdist_sumofsquares_aldist_pelago_model__time_idx >= 
                (1L)) {
              cdist_sumofsquares_aldist_pelago_model__agegroup_idx <- intintlookup_getdefault(ages_cdist_sumofsquares_aldist_pelago_model__lookup, 
                                                                                              age, -1L)
              if (cdist_sumofsquares_aldist_pelago_model__agegroup_idx > 
                  -1L) {
                comment("Take prey_stock__fleet_stock weight, convert to individuals, add to our count")
                cdist_sumofsquares_aldist_pelago_model__num[, 
                                                            cdist_sumofsquares_aldist_pelago_model__agegroup_idx, 
                                                            cdist_sumofsquares_aldist_pelago_model__time_idx, 
                                                            cdist_sumofsquares_aldist_pelago_model__areagroup_idx] <- cdist_sumofsquares_aldist_pelago_model__num[, 
                                                                                                                                                                  cdist_sumofsquares_aldist_pelago_model__agegroup_idx, 
                                                                                                                                                                  cdist_sumofsquares_aldist_pelago_model__time_idx, 
                                                                                                                                                                  cdist_sumofsquares_aldist_pelago_model__areagroup_idx] + 
                  g3_matrix_vec(anch_cdist_sumofsquares_aldist_pelago_model_lgmatrix, 
                                (anch__PEL[, anch__area_idx, anch__age_idx]/avoid_zero_vec(anch__wgt[, 
                                                                                                     anch__area_idx, anch__age_idx])))
              }
            }
          }
        }
      }
    }
    {
      comment("g3l_catchdistribution_sumofsquares: Compare cdist_sumofsquares_aldist_pelago_model to cdist_sumofsquares_aldist_pelago_obs")
      for (cdist_sumofsquares_aldist_pelago_model__areagroup_idx in seq_along(cdist_sumofsquares_aldist_pelago_model__minareas)) {
        area <- cdist_sumofsquares_aldist_pelago_model__minareas[[cdist_sumofsquares_aldist_pelago_model__areagroup_idx]]
        cdist_sumofsquares_aldist_pelago_model__time_idx <- intintlookup_getdefault(times_cdist_sumofsquares_aldist_pelago_model__lookup, 
                                                                                    (cur_year * 10L + cur_step), -1L)
        if (cdist_sumofsquares_aldist_pelago_model__time_idx >= 
            (1L)) 
          for (cdist_sumofsquares_aldist_pelago_model__agegroup_idx in seq_along(cdist_sumofsquares_aldist_pelago_model__minages)) {
            age <- cdist_sumofsquares_aldist_pelago_model__minages[[cdist_sumofsquares_aldist_pelago_model__agegroup_idx]]
            cdist_sumofsquares_aldist_pelago_obs__areagroup_idx <- intintlookup_getdefault(cdist_sumofsquares_aldist_pelago_obs__lookup, 
                                                                                           area, -1L)
            if (cdist_sumofsquares_aldist_pelago_obs__areagroup_idx > 
                -1L) {
              cdist_sumofsquares_aldist_pelago_obs__time_idx <- intintlookup_getdefault(times_cdist_sumofsquares_aldist_pelago_obs__lookup, 
                                                                                        (cur_year * 10L + cur_step), -1L)
              if (cdist_sumofsquares_aldist_pelago_obs__time_idx >= 
                  (1L)) {
                cdist_sumofsquares_aldist_pelago_obs__agegroup_idx <- intintlookup_getdefault(ages_cdist_sumofsquares_aldist_pelago_model__lookup, 
                                                                                              age, -1L)
                if (cdist_sumofsquares_aldist_pelago_obs__agegroup_idx > 
                    -1L) {
                  cur_cdist_nll <- sum((cdist_sumofsquares_aldist_pelago_model__num[, 
                                                                                    cdist_sumofsquares_aldist_pelago_model__agegroup_idx, 
                                                                                    cdist_sumofsquares_aldist_pelago_model__time_idx, 
                                                                                    cdist_sumofsquares_aldist_pelago_model__areagroup_idx]/avoid_zero(sum(cdist_sumofsquares_aldist_pelago_model__num[, 
                                                                                                                                                                                                      , cdist_sumofsquares_aldist_pelago_model__time_idx, 
                                                                                                                                                                                                      cdist_sumofsquares_aldist_pelago_model__areagroup_idx])) - 
                                          cdist_sumofsquares_aldist_pelago_obs__num[, 
                                                                                    cdist_sumofsquares_aldist_pelago_obs__agegroup_idx, 
                                                                                    cdist_sumofsquares_aldist_pelago_obs__time_idx, 
                                                                                    cdist_sumofsquares_aldist_pelago_obs__areagroup_idx]/avoid_zero(sum(cdist_sumofsquares_aldist_pelago_obs__num[, 
                                                                                                                                                                                                  , cdist_sumofsquares_aldist_pelago_obs__time_idx, 
                                                                                                                                                                                                  cdist_sumofsquares_aldist_pelago_obs__areagroup_idx])))^2)
                  {
                    nll <- nll + param[["cdist_sumofsquares_aldist_pelago_weight"]] * 
                      cur_cdist_nll
                    nll_cdist_sumofsquares_aldist_pelago__num[cur_time + 
                                                                1L] <- nll_cdist_sumofsquares_aldist_pelago__num[cur_time + 
                                                                                                                   1L] + cur_cdist_nll
                    nll_cdist_sumofsquares_aldist_pelago__weight[cur_time + 
                                                                   1L] <- param[["cdist_sumofsquares_aldist_pelago_weight"]]
                    attr(nll, "cdist_sumofsquares_aldist_pelago_obs__num") <- cdist_sumofsquares_aldist_pelago_obs__num
                  }
                }
              }
            }
          }
      }
    }
    {
      anch__area_idx <- (1)
      {
        comment("g3l_catchdistribution_sumofsquares: Collect catch from seine1/anch for cdist_sumofsquares_aldist_seine")
        for (age in seq(anch__minage, anch__maxage, 
                        by = 1)) {
          anch__age_idx <- age - anch__minage + 1L
          area <- anch__area
          cdist_sumofsquares_aldist_seine_model__areagroup_idx <- intintlookup_getdefault(cdist_sumofsquares_aldist_seine_model__lookup, 
                                                                                          area, -1L)
          if (cdist_sumofsquares_aldist_seine_model__areagroup_idx > 
              -1L) {
            cdist_sumofsquares_aldist_seine_model__time_idx <- intintlookup_getdefault(times_cdist_sumofsquares_aldist_seine_model__lookup, 
                                                                                       (cur_year * 10L + cur_step), -1L)
            if (cdist_sumofsquares_aldist_seine_model__time_idx >= 
                (1L)) {
              cdist_sumofsquares_aldist_seine_model__agegroup_idx <- intintlookup_getdefault(ages_cdist_sumofsquares_aldist_seine_model__lookup, 
                                                                                             age, -1L)
              if (cdist_sumofsquares_aldist_seine_model__agegroup_idx > 
                  -1L) {
                comment("Take prey_stock__fleet_stock weight, convert to individuals, add to our count")
                cdist_sumofsquares_aldist_seine_model__num[, 
                                                           cdist_sumofsquares_aldist_seine_model__agegroup_idx, 
                                                           cdist_sumofsquares_aldist_seine_model__time_idx, 
                                                           cdist_sumofsquares_aldist_seine_model__areagroup_idx] <- cdist_sumofsquares_aldist_seine_model__num[, 
                                                                                                                                                               cdist_sumofsquares_aldist_seine_model__agegroup_idx, 
                                                                                                                                                               cdist_sumofsquares_aldist_seine_model__time_idx, 
                                                                                                                                                               cdist_sumofsquares_aldist_seine_model__areagroup_idx] + 
                  g3_matrix_vec(anch_cdist_sumofsquares_aldist_seine_model_lgmatrix, 
                                (anch__seine1[, anch__area_idx, 
                                              anch__age_idx]/avoid_zero_vec(anch__wgt[, 
                                                                                      anch__area_idx, anch__age_idx])))
              }
            }
          }
        }
      }
    }
    {
      anch__area_idx <- (1)
      {
        comment("g3l_catchdistribution_sumofsquares: Collect catch from seine2/anch for cdist_sumofsquares_aldist_seine")
        for (age in seq(anch__minage, anch__maxage, 
                        by = 1)) {
          anch__age_idx <- age - anch__minage + 1L
          area <- anch__area
          cdist_sumofsquares_aldist_seine_model__areagroup_idx <- intintlookup_getdefault(cdist_sumofsquares_aldist_seine_model__lookup, 
                                                                                          area, -1L)
          if (cdist_sumofsquares_aldist_seine_model__areagroup_idx > 
              -1L) {
            cdist_sumofsquares_aldist_seine_model__time_idx <- intintlookup_getdefault(times_cdist_sumofsquares_aldist_seine_model__lookup, 
                                                                                       (cur_year * 10L + cur_step), -1L)
            if (cdist_sumofsquares_aldist_seine_model__time_idx >= 
                (1L)) {
              cdist_sumofsquares_aldist_seine_model__agegroup_idx <- intintlookup_getdefault(ages_cdist_sumofsquares_aldist_seine_model__lookup, 
                                                                                             age, -1L)
              if (cdist_sumofsquares_aldist_seine_model__agegroup_idx > 
                  -1L) {
                comment("Take prey_stock__fleet_stock weight, convert to individuals, add to our count")
                cdist_sumofsquares_aldist_seine_model__num[, 
                                                           cdist_sumofsquares_aldist_seine_model__agegroup_idx, 
                                                           cdist_sumofsquares_aldist_seine_model__time_idx, 
                                                           cdist_sumofsquares_aldist_seine_model__areagroup_idx] <- cdist_sumofsquares_aldist_seine_model__num[, 
                                                                                                                                                               cdist_sumofsquares_aldist_seine_model__agegroup_idx, 
                                                                                                                                                               cdist_sumofsquares_aldist_seine_model__time_idx, 
                                                                                                                                                               cdist_sumofsquares_aldist_seine_model__areagroup_idx] + 
                  g3_matrix_vec(anch_cdist_sumofsquares_aldist_seine_model_lgmatrix, 
                                (anch__seine2[, anch__area_idx, 
                                              anch__age_idx]/avoid_zero_vec(anch__wgt[, 
                                                                                      anch__area_idx, anch__age_idx])))
              }
            }
          }
        }
      }
    }
    {
      comment("g3l_catchdistribution_sumofsquares: Compare cdist_sumofsquares_aldist_seine_model to cdist_sumofsquares_aldist_seine_obs")
      for (cdist_sumofsquares_aldist_seine_model__areagroup_idx in seq_along(cdist_sumofsquares_aldist_seine_model__minareas)) {
        area <- cdist_sumofsquares_aldist_seine_model__minareas[[cdist_sumofsquares_aldist_seine_model__areagroup_idx]]
        cdist_sumofsquares_aldist_seine_model__time_idx <- intintlookup_getdefault(times_cdist_sumofsquares_aldist_seine_model__lookup, 
                                                                                   (cur_year * 10L + cur_step), -1L)
        if (cdist_sumofsquares_aldist_seine_model__time_idx >= 
            (1L)) 
          for (cdist_sumofsquares_aldist_seine_model__agegroup_idx in seq_along(cdist_sumofsquares_aldist_seine_model__minages)) {
            age <- cdist_sumofsquares_aldist_seine_model__minages[[cdist_sumofsquares_aldist_seine_model__agegroup_idx]]
            cdist_sumofsquares_aldist_seine_obs__areagroup_idx <- intintlookup_getdefault(cdist_sumofsquares_aldist_seine_obs__lookup, 
                                                                                          area, -1L)
            if (cdist_sumofsquares_aldist_seine_obs__areagroup_idx > 
                -1L) {
              cdist_sumofsquares_aldist_seine_obs__time_idx <- intintlookup_getdefault(times_cdist_sumofsquares_aldist_seine_obs__lookup, 
                                                                                       (cur_year * 10L + cur_step), -1L)
              if (cdist_sumofsquares_aldist_seine_obs__time_idx >= 
                  (1L)) {
                cdist_sumofsquares_aldist_seine_obs__agegroup_idx <- intintlookup_getdefault(ages_cdist_sumofsquares_aldist_seine_model__lookup, 
                                                                                             age, -1L)
                if (cdist_sumofsquares_aldist_seine_obs__agegroup_idx > 
                    -1L) {
                  cur_cdist_nll <- sum((cdist_sumofsquares_aldist_seine_model__num[, 
                                                                                   cdist_sumofsquares_aldist_seine_model__agegroup_idx, 
                                                                                   cdist_sumofsquares_aldist_seine_model__time_idx, 
                                                                                   cdist_sumofsquares_aldist_seine_model__areagroup_idx]/avoid_zero(sum(cdist_sumofsquares_aldist_seine_model__num[, 
                                                                                                                                                                                                   , cdist_sumofsquares_aldist_seine_model__time_idx, 
                                                                                                                                                                                                   cdist_sumofsquares_aldist_seine_model__areagroup_idx])) - 
                                          cdist_sumofsquares_aldist_seine_obs__num[, 
                                                                                   cdist_sumofsquares_aldist_seine_obs__agegroup_idx, 
                                                                                   cdist_sumofsquares_aldist_seine_obs__time_idx, 
                                                                                   cdist_sumofsquares_aldist_seine_obs__areagroup_idx]/avoid_zero(sum(cdist_sumofsquares_aldist_seine_obs__num[, 
                                                                                                                                                                                               , cdist_sumofsquares_aldist_seine_obs__time_idx, 
                                                                                                                                                                                               cdist_sumofsquares_aldist_seine_obs__areagroup_idx])))^2)
                  {
                    nll <- nll + param[["cdist_sumofsquares_aldist_seine_weight"]] * 
                      cur_cdist_nll
                    nll_cdist_sumofsquares_aldist_seine__num[cur_time + 
                                                               1L] <- nll_cdist_sumofsquares_aldist_seine__num[cur_time + 
                                                                                                                 1L] + cur_cdist_nll
                    nll_cdist_sumofsquares_aldist_seine__weight[cur_time + 
                                                                  1L] <- param[["cdist_sumofsquares_aldist_seine_weight"]]
                    attr(nll, "cdist_sumofsquares_aldist_seine_obs__num") <- cdist_sumofsquares_aldist_seine_obs__num
                  }
                }
              }
            }
          }
      }
    }
    {
      anch__area_idx <- (1)
      {
        comment("g3l_catchdistribution_sumofsquares: Collect catch from ECO/anch for cdist_sumofsquares_ldist_ecocadiz")
        for (age in seq(anch__minage, anch__maxage, 
                        by = 1)) {
          anch__age_idx <- age - anch__minage + 1L
          area <- anch__area
          cdist_sumofsquares_ldist_ecocadiz_model__areagroup_idx <- intintlookup_getdefault(cdist_sumofsquares_ldist_ecocadiz_model__lookup, 
                                                                                            area, -1L)
          if (cdist_sumofsquares_ldist_ecocadiz_model__areagroup_idx > 
              -1L) {
            cdist_sumofsquares_ldist_ecocadiz_model__time_idx <- intintlookup_getdefault(times_cdist_sumofsquares_ldist_ecocadiz_model__lookup, 
                                                                                         (cur_year * 10L + cur_step), -1L)
            if (cdist_sumofsquares_ldist_ecocadiz_model__time_idx >= 
                (1L)) {
              cdist_sumofsquares_ldist_ecocadiz_model__agegroup_idx <- intintlookup_getdefault(ages_cdist_sumofsquares_ldist_ecocadiz_model__lookup, 
                                                                                               age, -1L)
              if (cdist_sumofsquares_ldist_ecocadiz_model__agegroup_idx > 
                  -1L) {
                comment("Take prey_stock__fleet_stock weight, convert to individuals, add to our count")
                cdist_sumofsquares_ldist_ecocadiz_model__num[, 
                                                             cdist_sumofsquares_ldist_ecocadiz_model__agegroup_idx, 
                                                             cdist_sumofsquares_ldist_ecocadiz_model__time_idx, 
                                                             cdist_sumofsquares_ldist_ecocadiz_model__areagroup_idx] <- cdist_sumofsquares_ldist_ecocadiz_model__num[, 
                                                                                                                                                                     cdist_sumofsquares_ldist_ecocadiz_model__agegroup_idx, 
                                                                                                                                                                     cdist_sumofsquares_ldist_ecocadiz_model__time_idx, 
                                                                                                                                                                     cdist_sumofsquares_ldist_ecocadiz_model__areagroup_idx] + 
                  g3_matrix_vec(anch_cdist_sumofsquares_ldist_ecocadiz_model_lgmatrix, 
                                (anch__ECO[, anch__area_idx, anch__age_idx]/avoid_zero_vec(anch__wgt[, 
                                                                                                     anch__area_idx, anch__age_idx])))
              }
            }
          }
        }
      }
    }
    {
      comment("g3l_catchdistribution_sumofsquares: Compare cdist_sumofsquares_ldist_ecocadiz_model to cdist_sumofsquares_ldist_ecocadiz_obs")
      for (cdist_sumofsquares_ldist_ecocadiz_model__areagroup_idx in seq_along(cdist_sumofsquares_ldist_ecocadiz_model__minareas)) {
        area <- cdist_sumofsquares_ldist_ecocadiz_model__minareas[[cdist_sumofsquares_ldist_ecocadiz_model__areagroup_idx]]
        cdist_sumofsquares_ldist_ecocadiz_model__time_idx <- intintlookup_getdefault(times_cdist_sumofsquares_ldist_ecocadiz_model__lookup, 
                                                                                     (cur_year * 10L + cur_step), -1L)
        if (cdist_sumofsquares_ldist_ecocadiz_model__time_idx >= 
            (1L)) 
          for (cdist_sumofsquares_ldist_ecocadiz_model__agegroup_idx in seq_along(cdist_sumofsquares_ldist_ecocadiz_model__minages)) {
            age <- cdist_sumofsquares_ldist_ecocadiz_model__minages[[cdist_sumofsquares_ldist_ecocadiz_model__agegroup_idx]]
            cdist_sumofsquares_ldist_ecocadiz_obs__areagroup_idx <- intintlookup_getdefault(cdist_sumofsquares_ldist_ecocadiz_obs__lookup, 
                                                                                            area, -1L)
            if (cdist_sumofsquares_ldist_ecocadiz_obs__areagroup_idx > 
                -1L) {
              cdist_sumofsquares_ldist_ecocadiz_obs__time_idx <- intintlookup_getdefault(times_cdist_sumofsquares_ldist_ecocadiz_obs__lookup, 
                                                                                         (cur_year * 10L + cur_step), -1L)
              if (cdist_sumofsquares_ldist_ecocadiz_obs__time_idx >= 
                  (1L)) {
                cdist_sumofsquares_ldist_ecocadiz_obs__agegroup_idx <- intintlookup_getdefault(ages_cdist_sumofsquares_ldist_ecocadiz_model__lookup, 
                                                                                               age, -1L)
                if (cdist_sumofsquares_ldist_ecocadiz_obs__agegroup_idx > 
                    -1L) {
                  cur_cdist_nll <- sum((cdist_sumofsquares_ldist_ecocadiz_model__num[, 
                                                                                     cdist_sumofsquares_ldist_ecocadiz_model__agegroup_idx, 
                                                                                     cdist_sumofsquares_ldist_ecocadiz_model__time_idx, 
                                                                                     cdist_sumofsquares_ldist_ecocadiz_model__areagroup_idx]/avoid_zero(sum(cdist_sumofsquares_ldist_ecocadiz_model__num[, 
                                                                                                                                                                                                         , cdist_sumofsquares_ldist_ecocadiz_model__time_idx, 
                                                                                                                                                                                                         cdist_sumofsquares_ldist_ecocadiz_model__areagroup_idx])) - 
                                          cdist_sumofsquares_ldist_ecocadiz_obs__num[, 
                                                                                     cdist_sumofsquares_ldist_ecocadiz_obs__agegroup_idx, 
                                                                                     cdist_sumofsquares_ldist_ecocadiz_obs__time_idx, 
                                                                                     cdist_sumofsquares_ldist_ecocadiz_obs__areagroup_idx]/avoid_zero(sum(cdist_sumofsquares_ldist_ecocadiz_obs__num[, 
                                                                                                                                                                                                     , cdist_sumofsquares_ldist_ecocadiz_obs__time_idx, 
                                                                                                                                                                                                     cdist_sumofsquares_ldist_ecocadiz_obs__areagroup_idx])))^2)
                  {
                    nll <- nll + param[["cdist_sumofsquares_ldist_ecocadiz_weight"]] * 
                      cur_cdist_nll
                    nll_cdist_sumofsquares_ldist_ecocadiz__num[cur_time + 
                                                                 1L] <- nll_cdist_sumofsquares_ldist_ecocadiz__num[cur_time + 
                                                                                                                     1L] + cur_cdist_nll
                    nll_cdist_sumofsquares_ldist_ecocadiz__weight[cur_time + 
                                                                    1L] <- param[["cdist_sumofsquares_ldist_ecocadiz_weight"]]
                    attr(nll, "cdist_sumofsquares_ldist_ecocadiz_obs__num") <- cdist_sumofsquares_ldist_ecocadiz_obs__num
                  }
                }
              }
            }
          }
      }
    }
    {
      anch__area_idx <- (1)
      {
        comment("g3l_catchdistribution_sumofsquares: Collect catch from PEL/anch for cdist_sumofsquares_ldist_pelago")
        for (age in seq(anch__minage, anch__maxage, 
                        by = 1)) {
          anch__age_idx <- age - anch__minage + 1L
          area <- anch__area
          cdist_sumofsquares_ldist_pelago_model__areagroup_idx <- intintlookup_getdefault(cdist_sumofsquares_ldist_pelago_model__lookup, 
                                                                                          area, -1L)
          if (cdist_sumofsquares_ldist_pelago_model__areagroup_idx > 
              -1L) {
            cdist_sumofsquares_ldist_pelago_model__time_idx <- intintlookup_getdefault(times_cdist_sumofsquares_ldist_pelago_model__lookup, 
                                                                                       (cur_year * 10L + cur_step), -1L)
            if (cdist_sumofsquares_ldist_pelago_model__time_idx >= 
                (1L)) {
              cdist_sumofsquares_ldist_pelago_model__agegroup_idx <- intintlookup_getdefault(ages_cdist_sumofsquares_ldist_pelago_model__lookup, 
                                                                                             age, -1L)
              if (cdist_sumofsquares_ldist_pelago_model__agegroup_idx > 
                  -1L) {
                comment("Take prey_stock__fleet_stock weight, convert to individuals, add to our count")
                cdist_sumofsquares_ldist_pelago_model__num[, 
                                                           cdist_sumofsquares_ldist_pelago_model__agegroup_idx, 
                                                           cdist_sumofsquares_ldist_pelago_model__time_idx, 
                                                           cdist_sumofsquares_ldist_pelago_model__areagroup_idx] <- cdist_sumofsquares_ldist_pelago_model__num[, 
                                                                                                                                                               cdist_sumofsquares_ldist_pelago_model__agegroup_idx, 
                                                                                                                                                               cdist_sumofsquares_ldist_pelago_model__time_idx, 
                                                                                                                                                               cdist_sumofsquares_ldist_pelago_model__areagroup_idx] + 
                  g3_matrix_vec(anch_cdist_sumofsquares_ldist_pelago_model_lgmatrix, 
                                (anch__PEL[, anch__area_idx, anch__age_idx]/avoid_zero_vec(anch__wgt[, 
                                                                                                     anch__area_idx, anch__age_idx])))
              }
            }
          }
        }
      }
    }
    {
      comment("g3l_catchdistribution_sumofsquares: Compare cdist_sumofsquares_ldist_pelago_model to cdist_sumofsquares_ldist_pelago_obs")
      for (cdist_sumofsquares_ldist_pelago_model__areagroup_idx in seq_along(cdist_sumofsquares_ldist_pelago_model__minareas)) {
        area <- cdist_sumofsquares_ldist_pelago_model__minareas[[cdist_sumofsquares_ldist_pelago_model__areagroup_idx]]
        cdist_sumofsquares_ldist_pelago_model__time_idx <- intintlookup_getdefault(times_cdist_sumofsquares_ldist_pelago_model__lookup, 
                                                                                   (cur_year * 10L + cur_step), -1L)
        if (cdist_sumofsquares_ldist_pelago_model__time_idx >= 
            (1L)) 
          for (cdist_sumofsquares_ldist_pelago_model__agegroup_idx in seq_along(cdist_sumofsquares_ldist_pelago_model__minages)) {
            age <- cdist_sumofsquares_ldist_pelago_model__minages[[cdist_sumofsquares_ldist_pelago_model__agegroup_idx]]
            cdist_sumofsquares_ldist_pelago_obs__areagroup_idx <- intintlookup_getdefault(cdist_sumofsquares_ldist_pelago_obs__lookup, 
                                                                                          area, -1L)
            if (cdist_sumofsquares_ldist_pelago_obs__areagroup_idx > 
                -1L) {
              cdist_sumofsquares_ldist_pelago_obs__time_idx <- intintlookup_getdefault(times_cdist_sumofsquares_ldist_pelago_obs__lookup, 
                                                                                       (cur_year * 10L + cur_step), -1L)
              if (cdist_sumofsquares_ldist_pelago_obs__time_idx >= 
                  (1L)) {
                cdist_sumofsquares_ldist_pelago_obs__agegroup_idx <- intintlookup_getdefault(ages_cdist_sumofsquares_ldist_pelago_model__lookup, 
                                                                                             age, -1L)
                if (cdist_sumofsquares_ldist_pelago_obs__agegroup_idx > 
                    -1L) {
                  cur_cdist_nll <- sum((cdist_sumofsquares_ldist_pelago_model__num[, 
                                                                                   cdist_sumofsquares_ldist_pelago_model__agegroup_idx, 
                                                                                   cdist_sumofsquares_ldist_pelago_model__time_idx, 
                                                                                   cdist_sumofsquares_ldist_pelago_model__areagroup_idx]/avoid_zero(sum(cdist_sumofsquares_ldist_pelago_model__num[, 
                                                                                                                                                                                                   , cdist_sumofsquares_ldist_pelago_model__time_idx, 
                                                                                                                                                                                                   cdist_sumofsquares_ldist_pelago_model__areagroup_idx])) - 
                                          cdist_sumofsquares_ldist_pelago_obs__num[, 
                                                                                   cdist_sumofsquares_ldist_pelago_obs__agegroup_idx, 
                                                                                   cdist_sumofsquares_ldist_pelago_obs__time_idx, 
                                                                                   cdist_sumofsquares_ldist_pelago_obs__areagroup_idx]/avoid_zero(sum(cdist_sumofsquares_ldist_pelago_obs__num[, 
                                                                                                                                                                                               , cdist_sumofsquares_ldist_pelago_obs__time_idx, 
                                                                                                                                                                                               cdist_sumofsquares_ldist_pelago_obs__areagroup_idx])))^2)
                  {
                    nll <- nll + param[["cdist_sumofsquares_ldist_pelago_weight"]] * 
                      cur_cdist_nll
                    nll_cdist_sumofsquares_ldist_pelago__num[cur_time + 
                                                               1L] <- nll_cdist_sumofsquares_ldist_pelago__num[cur_time + 
                                                                                                                 1L] + cur_cdist_nll
                    nll_cdist_sumofsquares_ldist_pelago__weight[cur_time + 
                                                                  1L] <- param[["cdist_sumofsquares_ldist_pelago_weight"]]
                    attr(nll, "cdist_sumofsquares_ldist_pelago_obs__num") <- cdist_sumofsquares_ldist_pelago_obs__num
                  }
                }
              }
            }
          }
      }
    }
    {
      anch__area_idx <- (1)
      {
        comment("g3l_catchdistribution_sumofsquares: Collect catch from seine1/anch for cdist_sumofsquares_ldist_seine")
        for (age in seq(anch__minage, anch__maxage, 
                        by = 1)) {
          anch__age_idx <- age - anch__minage + 1L
          area <- anch__area
          cdist_sumofsquares_ldist_seine_model__areagroup_idx <- intintlookup_getdefault(cdist_sumofsquares_ldist_seine_model__lookup, 
                                                                                         area, -1L)
          if (cdist_sumofsquares_ldist_seine_model__areagroup_idx > 
              -1L) {
            cdist_sumofsquares_ldist_seine_model__time_idx <- intintlookup_getdefault(times_cdist_sumofsquares_ldist_seine_model__lookup, 
                                                                                      (cur_year * 10L + cur_step), -1L)
            if (cdist_sumofsquares_ldist_seine_model__time_idx >= 
                (1L)) {
              cdist_sumofsquares_ldist_seine_model__agegroup_idx <- intintlookup_getdefault(ages_cdist_sumofsquares_ldist_seine_model__lookup, 
                                                                                            age, -1L)
              if (cdist_sumofsquares_ldist_seine_model__agegroup_idx > 
                  -1L) {
                comment("Take prey_stock__fleet_stock weight, convert to individuals, add to our count")
                cdist_sumofsquares_ldist_seine_model__num[, 
                                                          cdist_sumofsquares_ldist_seine_model__agegroup_idx, 
                                                          cdist_sumofsquares_ldist_seine_model__time_idx, 
                                                          cdist_sumofsquares_ldist_seine_model__areagroup_idx] <- cdist_sumofsquares_ldist_seine_model__num[, 
                                                                                                                                                            cdist_sumofsquares_ldist_seine_model__agegroup_idx, 
                                                                                                                                                            cdist_sumofsquares_ldist_seine_model__time_idx, 
                                                                                                                                                            cdist_sumofsquares_ldist_seine_model__areagroup_idx] + 
                  g3_matrix_vec(anch_cdist_sumofsquares_ldist_seine_model_lgmatrix, 
                                (anch__seine1[, anch__area_idx, 
                                              anch__age_idx]/avoid_zero_vec(anch__wgt[, 
                                                                                      anch__area_idx, anch__age_idx])))
              }
            }
          }
        }
      }
    }
    {
      anch__area_idx <- (1)
      {
        comment("g3l_catchdistribution_sumofsquares: Collect catch from seine2/anch for cdist_sumofsquares_ldist_seine")
        for (age in seq(anch__minage, anch__maxage, 
                        by = 1)) {
          anch__age_idx <- age - anch__minage + 1L
          area <- anch__area
          cdist_sumofsquares_ldist_seine_model__areagroup_idx <- intintlookup_getdefault(cdist_sumofsquares_ldist_seine_model__lookup, 
                                                                                         area, -1L)
          if (cdist_sumofsquares_ldist_seine_model__areagroup_idx > 
              -1L) {
            cdist_sumofsquares_ldist_seine_model__time_idx <- intintlookup_getdefault(times_cdist_sumofsquares_ldist_seine_model__lookup, 
                                                                                      (cur_year * 10L + cur_step), -1L)
            if (cdist_sumofsquares_ldist_seine_model__time_idx >= 
                (1L)) {
              #here is the error
              cdist_sumofsquares_ldist_seine_model__agegroup_idx <- intintlookup_getdefault(ages_cdist_sumofsquares_ldist_seine_model__lookup, 
                                                                                            anch__age_idx, -1L)
              if (cdist_sumofsquares_ldist_seine_model__agegroup_idx > 
                  -1L) {
                comment("Take prey_stock__fleet_stock weight, convert to individuals, add to our count")
                cdist_sumofsquares_ldist_seine_model__num[, 
                                                          cdist_sumofsquares_ldist_seine_model__agegroup_idx, 
                                                          cdist_sumofsquares_ldist_seine_model__time_idx, 
                                                          cdist_sumofsquares_ldist_seine_model__areagroup_idx] <- cdist_sumofsquares_ldist_seine_model__num[, 
                                                                                                                                                            cdist_sumofsquares_ldist_seine_model__agegroup_idx, 
                                                                                                                                                            cdist_sumofsquares_ldist_seine_model__time_idx, 
                                                                                                                                                            cdist_sumofsquares_ldist_seine_model__areagroup_idx] + 
                  g3_matrix_vec(anch_cdist_sumofsquares_ldist_seine_model_lgmatrix, 
                                (anch__seine2[, anch__area_idx, 
                                              anch__age_idx]/avoid_zero_vec(anch__wgt[, 
                                                                                      anch__area_idx, anch__age_idx])))
              }
            }
          }
        }
      }
    }
    {
      comment("g3l_catchdistribution_sumofsquares: Compare cdist_sumofsquares_ldist_seine_model to cdist_sumofsquares_ldist_seine_obs")
      for (cdist_sumofsquares_ldist_seine_model__areagroup_idx in seq_along(cdist_sumofsquares_ldist_seine_model__minareas)) {
        area <- cdist_sumofsquares_ldist_seine_model__minareas[[cdist_sumofsquares_ldist_seine_model__areagroup_idx]]
        cdist_sumofsquares_ldist_seine_model__time_idx <- intintlookup_getdefault(times_cdist_sumofsquares_ldist_seine_model__lookup, 
                                                                                  (cur_year * 10L + cur_step), -1L)
        if (cdist_sumofsquares_ldist_seine_model__time_idx >= 
            (1L)) 
          for (cdist_sumofsquares_ldist_seine_model__agegroup_idx in seq_along(cdist_sumofsquares_ldist_seine_model__minages)) {
            age <- cdist_sumofsquares_ldist_seine_model__minages[[cdist_sumofsquares_ldist_seine_model__agegroup_idx]]
            cdist_sumofsquares_ldist_seine_obs__areagroup_idx <- intintlookup_getdefault(cdist_sumofsquares_ldist_seine_obs__lookup, 
                                                                                         area, -1L)
            if (cdist_sumofsquares_ldist_seine_obs__areagroup_idx > 
                -1L) {
              cdist_sumofsquares_ldist_seine_obs__time_idx <- intintlookup_getdefault(times_cdist_sumofsquares_ldist_seine_obs__lookup, 
                                                                                      (cur_year * 10L + cur_step), -1L)
              if (cdist_sumofsquares_ldist_seine_obs__time_idx >= 
                  (1L)) {
                cdist_sumofsquares_ldist_seine_obs__agegroup_idx <- intintlookup_getdefault(ages_cdist_sumofsquares_ldist_seine_model__lookup, 
                                                                                            age, -1L)
                if (cdist_sumofsquares_ldist_seine_obs__agegroup_idx > 
                    -1L) {
                  cur_cdist_nll <- sum((cdist_sumofsquares_ldist_seine_model__num[, 
                                                                                  cdist_sumofsquares_ldist_seine_model__agegroup_idx, 
                                                                                  cdist_sumofsquares_ldist_seine_model__time_idx, 
                                                                                  cdist_sumofsquares_ldist_seine_model__areagroup_idx]/avoid_zero(sum(cdist_sumofsquares_ldist_seine_model__num[, 
                                                                                                                                                                                                , cdist_sumofsquares_ldist_seine_model__time_idx, 
                                                                                                                                                                                                cdist_sumofsquares_ldist_seine_model__areagroup_idx])) - 
                                          cdist_sumofsquares_ldist_seine_obs__num[, 
                                                                                  cdist_sumofsquares_ldist_seine_obs__agegroup_idx, 
                                                                                  cdist_sumofsquares_ldist_seine_obs__time_idx, 
                                                                                  cdist_sumofsquares_ldist_seine_obs__areagroup_idx]/avoid_zero(sum(cdist_sumofsquares_ldist_seine_obs__num[, 
                                                                                                                                                                                            , cdist_sumofsquares_ldist_seine_obs__time_idx, 
                                                                                                                                                                                            cdist_sumofsquares_ldist_seine_obs__areagroup_idx])))^2)
                  {
                    nll <- nll + param[["cdist_sumofsquares_ldist_seine_weight"]] * 
                      cur_cdist_nll
                    nll_cdist_sumofsquares_ldist_seine__num[cur_time + 
                                                              1L] <- nll_cdist_sumofsquares_ldist_seine__num[cur_time + 
                                                                                                               1L] + cur_cdist_nll
                    nll_cdist_sumofsquares_ldist_seine__weight[cur_time + 
                                                                 1L] <- param[["cdist_sumofsquares_ldist_seine_weight"]]
                    attr(nll, "cdist_sumofsquares_ldist_seine_obs__num") <- cdist_sumofsquares_ldist_seine_obs__num
                  }
                }
              }
            }
          }
      }
    }
    {
      comment("Reset understocking total")
      g3l_understocking_total <- 0
    }
    {
      comment("g3l_understocking for anch")
      comment("Add understocking from anch as biomass to nll")
      g3l_understocking_total <- g3l_understocking_total + 
        anch__overconsumption
    }
    {
      comment("g3l_understocking: Combine and add to nll")
      g3l_understocking_total <- g3l_understocking_total^2
      nll <- nll + 1e+06 * g3l_understocking_total
      nll_understocking__wgt[cur_time + 1L] <- nll_understocking__wgt[cur_time + 
                                                                        1L] + g3l_understocking_total
      nll_understocking__weight[cur_time + 1L] <- 1e+06
    }
    {
      anch__area_idx <- (1)
      anch_report__area_idx <- (1)
      {
        comment("g3a_report_stock for anch_report from anch")
        if (cur_time == 0L) 
          anch_report__ECO[] <- 0
        for (age in seq(anch__minage, anch__maxage, 
                        by = 1)) {
          anch__age_idx <- age - anch__minage + 1L
          area <- anch__area
          anch_report__time_idx <- intintlookup_getdefault(times_anch_report__lookup, 
                                                           (cur_year * 10L + cur_step), -1L)
          if (anch_report__time_idx >= (1L)) 
            if (age >= anch_report__minage && age <= 
                anch_report__maxage) 
              if (area == anch_report__area) {
                anch_report__age_idx <- age - anch_report__minage + 
                  1L
                anch_report__ECO[, anch_report__area_idx, 
                                 anch_report__age_idx, anch_report__time_idx] <- anch_report__ECO[, 
                                                                                                  anch_report__area_idx, anch_report__age_idx, 
                                                                                                  anch_report__time_idx] + anch__ECO[, 
                                                                                                                                     anch__area_idx, anch__age_idx]
              }
        }
      }
    }
    {
      anch__area_idx <- (1)
      anch_report__area_idx <- (1)
      {
        comment("g3a_report_stock for anch_report from anch")
        if (cur_time == 0L) 
          anch_report__num[] <- 0
        for (age in seq(anch__minage, anch__maxage, 
                        by = 1)) {
          anch__age_idx <- age - anch__minage + 1L
          area <- anch__area
          anch_report__time_idx <- intintlookup_getdefault(times_anch_report__lookup, 
                                                           (cur_year * 10L + cur_step), -1L)
          if (anch_report__time_idx >= (1L)) 
            if (age >= anch_report__minage && age <= 
                anch_report__maxage) 
              if (area == anch_report__area) {
                anch_report__age_idx <- age - anch_report__minage + 
                  1L
                anch_report__num[, anch_report__area_idx, 
                                 anch_report__age_idx, anch_report__time_idx] <- anch_report__num[, 
                                                                                                  anch_report__area_idx, anch_report__age_idx, 
                                                                                                  anch_report__time_idx] + anch__num[, 
                                                                                                                                     anch__area_idx, anch__age_idx]
              }
        }
      }
    }
    {
      anch__area_idx <- (1)
      anch_report__area_idx <- (1)
      {
        comment("g3a_report_stock for anch_report from anch")
        if (cur_time == 0L) 
          anch_report__PEL[] <- 0
        for (age in seq(anch__minage, anch__maxage, 
                        by = 1)) {
          anch__age_idx <- age - anch__minage + 1L
          area <- anch__area
          anch_report__time_idx <- intintlookup_getdefault(times_anch_report__lookup, 
                                                           (cur_year * 10L + cur_step), -1L)
          if (anch_report__time_idx >= (1L)) 
            if (age >= anch_report__minage && age <= 
                anch_report__maxage) 
              if (area == anch_report__area) {
                anch_report__age_idx <- age - anch_report__minage + 
                  1L
                anch_report__PEL[, anch_report__area_idx, 
                                 anch_report__age_idx, anch_report__time_idx] <- anch_report__PEL[, 
                                                                                                  anch_report__area_idx, anch_report__age_idx, 
                                                                                                  anch_report__time_idx] + anch__PEL[, 
                                                                                                                                     anch__area_idx, anch__age_idx]
              }
        }
      }
    }
    {
      anch__area_idx <- (1)
      anch_report__area_idx <- (1)
      {
        comment("g3a_report_stock for anch_report from anch")
        if (cur_time == 0L) 
          anch_report__renewalnum[] <- 0
        for (age in seq(anch__minage, anch__maxage, 
                        by = 1)) {
          anch__age_idx <- age - anch__minage + 1L
          area <- anch__area
          anch_report__time_idx <- intintlookup_getdefault(times_anch_report__lookup, 
                                                           (cur_year * 10L + cur_step), -1L)
          if (anch_report__time_idx >= (1L)) 
            if (age >= anch_report__minage && age <= 
                anch_report__maxage) 
              if (area == anch_report__area) {
                anch_report__age_idx <- age - anch_report__minage + 
                  1L
                anch_report__renewalnum[, anch_report__area_idx, 
                                        anch_report__age_idx, anch_report__time_idx] <- anch_report__renewalnum[, 
                                                                                                                anch_report__area_idx, anch_report__age_idx, 
                                                                                                                anch_report__time_idx] + anch__renewalnum[, 
                                                                                                                                                          anch__area_idx, anch__age_idx]
              }
        }
      }
    }
    {
      anch__area_idx <- (1)
      anch_report__area_idx <- (1)
      {
        comment("g3a_report_stock for anch_report from anch")
        if (cur_time == 0L) 
          anch_report__renewalwgt[] <- 0
        for (age in seq(anch__minage, anch__maxage, 
                        by = 1)) {
          anch__age_idx <- age - anch__minage + 1L
          area <- anch__area
          anch_report__time_idx <- intintlookup_getdefault(times_anch_report__lookup, 
                                                           (cur_year * 10L + cur_step), -1L)
          if (anch_report__time_idx >= (1L)) 
            if (age >= anch_report__minage && age <= 
                anch_report__maxage) 
              if (area == anch_report__area) {
                anch_report__age_idx <- age - anch_report__minage + 
                  1L
                anch_report__renewalwgt[, anch_report__area_idx, 
                                        anch_report__age_idx, anch_report__time_idx] <- anch_report__renewalwgt[, 
                                                                                                                anch_report__area_idx, anch_report__age_idx, 
                                                                                                                anch_report__time_idx] + anch__renewalwgt[, 
                                                                                                                                                          anch__area_idx, anch__age_idx]
              }
        }
      }
    }
    {
      anch__area_idx <- (1)
      anch_report__area_idx <- (1)
      {
        comment("g3a_report_stock for anch_report from anch")
        if (cur_time == 0L) 
          anch_report__seine1[] <- 0
        for (age in seq(anch__minage, anch__maxage, 
                        by = 1)) {
          anch__age_idx <- age - anch__minage + 1L
          area <- anch__area
          anch_report__time_idx <- intintlookup_getdefault(times_anch_report__lookup, 
                                                           (cur_year * 10L + cur_step), -1L)
          if (anch_report__time_idx >= (1L)) 
            if (age >= anch_report__minage && age <= 
                anch_report__maxage) 
              if (area == anch_report__area) {
                anch_report__age_idx <- age - anch_report__minage + 
                  1L
                anch_report__seine1[, anch_report__area_idx, 
                                    anch_report__age_idx, anch_report__time_idx] <- anch_report__seine1[, 
                                                                                                        anch_report__area_idx, anch_report__age_idx, 
                                                                                                        anch_report__time_idx] + anch__seine1[, 
                                                                                                                                              anch__area_idx, anch__age_idx]
              }
        }
      }
    }
    {
      anch__area_idx <- (1)
      anch_report__area_idx <- (1)
      {
        comment("g3a_report_stock for anch_report from anch")
        if (cur_time == 0L) 
          anch_report__seine2[] <- 0
        for (age in seq(anch__minage, anch__maxage, 
                        by = 1)) {
          anch__age_idx <- age - anch__minage + 1L
          area <- anch__area
          anch_report__time_idx <- intintlookup_getdefault(times_anch_report__lookup, 
                                                           (cur_year * 10L + cur_step), -1L)
          if (anch_report__time_idx >= (1L)) 
            if (age >= anch_report__minage && age <= 
                anch_report__maxage) 
              if (area == anch_report__area) {
                anch_report__age_idx <- age - anch_report__minage + 
                  1L
                anch_report__seine2[, anch_report__area_idx, 
                                    anch_report__age_idx, anch_report__time_idx] <- anch_report__seine2[, 
                                                                                                        anch_report__area_idx, anch_report__age_idx, 
                                                                                                        anch_report__time_idx] + anch__seine2[, 
                                                                                                                                              anch__area_idx, anch__age_idx]
              }
        }
      }
    }
    {
      anch__area_idx <- (1)
      anch_report__area_idx <- (1)
      {
        comment("g3a_report_stock for anch_report from anch")
        if (cur_time == 0L) 
          anch_report__suit_ECO[] <- 0
        for (age in seq(anch__minage, anch__maxage, 
                        by = 1)) {
          anch__age_idx <- age - anch__minage + 1L
          area <- anch__area
          anch_report__time_idx <- intintlookup_getdefault(times_anch_report__lookup, 
                                                           (cur_year * 10L + cur_step), -1L)
          if (anch_report__time_idx >= (1L)) 
            if (age >= anch_report__minage && age <= 
                anch_report__maxage) 
              if (area == anch_report__area) {
                anch_report__age_idx <- age - anch_report__minage + 
                  1L
                anch_report__suit_ECO[, anch_report__area_idx, 
                                      anch_report__age_idx, anch_report__time_idx] <- anch_report__suit_ECO[, 
                                                                                                            anch_report__area_idx, anch_report__age_idx, 
                                                                                                            anch_report__time_idx] + anch__suit_ECO[, 
                                                                                                                                                    anch__area_idx, anch__age_idx]
              }
        }
      }
    }
    {
      anch__area_idx <- (1)
      anch_report__area_idx <- (1)
      {
        comment("g3a_report_stock for anch_report from anch")
        if (cur_time == 0L) 
          anch_report__suit_PEL[] <- 0
        for (age in seq(anch__minage, anch__maxage, 
                        by = 1)) {
          anch__age_idx <- age - anch__minage + 1L
          area <- anch__area
          anch_report__time_idx <- intintlookup_getdefault(times_anch_report__lookup, 
                                                           (cur_year * 10L + cur_step), -1L)
          if (anch_report__time_idx >= (1L)) 
            if (age >= anch_report__minage && age <= 
                anch_report__maxage) 
              if (area == anch_report__area) {
                anch_report__age_idx <- age - anch_report__minage + 
                  1L
                anch_report__suit_PEL[, anch_report__area_idx, 
                                      anch_report__age_idx, anch_report__time_idx] <- anch_report__suit_PEL[, 
                                                                                                            anch_report__area_idx, anch_report__age_idx, 
                                                                                                            anch_report__time_idx] + anch__suit_PEL[, 
                                                                                                                                                    anch__area_idx, anch__age_idx]
              }
        }
      }
    }
  }
  stop("Should have return()ed somewhere in the loop")
}
