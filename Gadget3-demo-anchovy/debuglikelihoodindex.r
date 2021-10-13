# function (nll_name, obs_data, fleets = list(), stocks, function_f, 
#     missing_val = 0, area_group = NULL, report = FALSE, nll_breakdown = FALSE, 
#     weight = substitute(g3_param(n, optimise = FALSE, value = 1), 
#         list(n = paste0(nll_name, "_weight"))), run_at = 10) 
# 
# nll_name='pelago_bioindex', obs_data=(pelago.bioindex[[1]]), fleets = list(), stocks=list(anch), function_f=g3l_distribution_surveyindices_log(alpha = g3_stock_param(anch, "pel_alpha2", id = 'species'),
#                                        beta = 1), 
#     missing_val = 0, area_group = NULL, report = lik_report, nll_breakdown = nll_breakdown, 
#     weight = substitute(g3_param(n, optimise = FALSE, value = 1), 
#         list(n = paste0(nll_name, "_weight"))), run_at = 10

        
        
 # 'pelago_bioindex',
 #    (pelago.bioindex[[1]]),
 #    fleets = list(),
 #    stocks = list(anch),
 #    g3l_distribution_surveyindices_log(alpha = g3_stock_param(anch, "pel_alpha2", id = 'species'),
 #                                       beta = 1),
 #    nll_breakdown = nll_breakdown,     report = lik_report        
        
        
nll_name='pelago_bioindex'; obs_data=(pelago.bioindex[[1]]); fleets = list(); stocks=list(anch); function_f=g3l_distribution_surveyindices_log(alpha = g3_stock_param(anch, "pel_alpha2", id = 'species'),
                                       beta = 1); 
    missing_val = 0; area_group = NULL; report = lik_report; nll_breakdown = nll_breakdown; 
    weight = substitute(g3_param(n, optimise = FALSE, value = 1), 
        list(n = paste0(nll_name, "_weight"))); run_at = 10        
        
{
    stopifnot(is.character(nll_name) && length(nll_name) == 1)
    stopifnot(is.data.frame(obs_data))
    stopifnot(is.list(fleets) && all(sapply(fleets, g3_is_stock)))
    stopifnot(is.list(stocks) && all(sapply(stocks, g3_is_stock)))
    stopifnot(rlang::is_formula(function_f))
    generic_var_replace <- function(f, repl_postfix) {
        replace_vars <- all.vars(f)
        replace_vars <- replace_vars[endsWith(replace_vars, "__x")]
        names(replace_vars) <- replace_vars
        replace_vars <- gsub("__x$", paste0("__", repl_postfix), 
            replace_vars)
        out_f <- f_substitute(f, lapply(replace_vars, as.symbol))
        for (real_name in replace_vars) {
            if (grepl("^nll_.dist_", real_name)) {
                var_name <- gsub("^.*__", "nllstock__", real_name)
            }
            else if (grepl("^.dist_.*_model__", real_name)) {
                var_name <- gsub("^.*__", "modelstock__", real_name)
            }
            else if (grepl("^.dist_.*_obs__", real_name)) {
                var_name <- gsub("^.*__", "obsstock__", real_name)
            }
            else {
                next
            }
            assign(real_name, get(var_name), envir = environment(out_f))
        }
        return(out_f)
    }
    out <- new.env(parent = emptyenv())
    this_name <- as.character(sys.call()[[1]])
    if (this_name == "g3l_catchdistribution" && length(fleets) == 
        0) 
        stop("Fleets must be supplied for g3l_catchdistribution")
    if (this_name == "g3l_abundancedistribution" && length(fleets) > 
        0) 
        stop("Fleets must not be supplied for g3l_abundancedistribution")
    function_f_name <- if (is.call(substitute(function_f))) 
        as.character(substitute(function_f)[[1]])
    else "custom"
    function_f_name <- gsub("^g3l_distribution_", "", function_f_name)
    prefix <- paste0(this_name, "_", function_f_name, ": ")
    nll_name <- paste(if (length(fleets) > 0) 
        "cdist"
    else "adist", function_f_name, nll_name, sep = "_")
    ld <- gadget3:::g3l_likelihood_data(nll_name, obs_data, missing_val = missing_val, 
        area_group = area_group, model_history = report)
    modelstock <- ld$modelstock
    obsstock <- ld$obsstock
    if (!is.null(ld$number)) {
        modelstock__num <- gadget3:::stock_instance(modelstock, 0)
        obsstock__num <- gadget3:::stock_instance(obsstock, ld$number)
    }
    if (!is.null(ld$weight)) {
        modelstock__wgt <- gadget3:::stock_instance(modelstock, 0)
        obsstock__wgt <- gadget3:::stock_instance(obsstock, ld$weight)
    }
    if (length(fleets) == 0) 
        for (stock in stocks) {
            if (!is.null(ld$stock_map)) {
                if (is.null(ld$stock_map[[stock$name]])) 
                  next
                stockidx_f <- f_substitute(~g3_idx(x), list(x = ld$stock_map[[stock$name]]))
            }
            else {
                stockidx_f <- ~-1
            }
            out[[step_id(run_at, "g3l_distribution", nll_name, 
                1, stock)]] <- f_substitute(~{
                debug_label(prefix, "Collect abundance from ", 
                  stock, " for ", nll_name)
                stock_iterate(stock, stock_intersect(modelstock, 
                  {
                    if (compare_num) {
                      debug_trace("Add ", stock, " individuals to our count")
                      stock_ss(modelstock__num) <- stock_ss(modelstock__num) + 
                        stock_reshape(modelstock, stock_ss(stock__num))
                    }
                    if (compare_wgt) {
                      debug_trace("Take ", stock, " total biomass to our count")
                      stock_ss(modelstock__wgt) <- stock_ss(modelstock__wgt) + 
                        stock_reshape(modelstock, stock_ss(stock__num) * 
                          stock_ss(stock__wgt))
                    }
                  }))
            }, list(compare_num = !is.null(ld$number), compare_wgt = !is.null(ld$weight)))
            out[[step_id(run_at, "g3l_distribution", nll_name, 
                1, stock)]] <- g3_step(f_substitute(out[[step_id(run_at, 
                "g3l_distribution", nll_name, 1, stock)]], list(stockidx_f = stockidx_f)))
        }
    for (fleet_stock in fleets) for (prey_stock in stocks) {
        if (!is.null(ld$stock_map)) {
            if (is.null(ld$stock_map[[prey_stock$name]])) 
                next
            stockidx_f <- f_substitute(~g3_idx(x), list(x = ld$stock_map[[prey_stock$name]]))
        }
        else {
            stockidx_f <- ~-1
        }
        out[[step_id(run_at, "g3l_distribution", nll_name, 1, 
            fleet_stock, prey_stock)]] <- g3_step(f_substitute(~{
            debug_label(prefix, "Collect catch from ", fleet_stock, 
                "/", prey_stock, " for ", nll_name)
            stock_iterate(prey_stock, stock_intersect(modelstock, 
                {
                  if (compare_num) {
                    debug_trace("Take prey_stock__fleet_stock weight, convert to individuals, add to our count")
                    stock_ss(modelstock__num) <- stock_ss(modelstock__num) + 
                      stock_reshape(modelstock, stock_ss(prey_stock__fleet_stock)/avoid_zero_vec(stock_ss(prey_stock__wgt)))
                  }
                  if (compare_wgt) {
                    debug_trace("Take prey_stock__fleet_stock weight, add to our count")
                    stock_ss(modelstock__wgt) <- stock_ss(modelstock__wgt) + 
                      stock_reshape(modelstock, stock_ss(prey_stock__fleet_stock))
                  }
                }))
        }, list(compare_num = !is.null(ld$number), compare_wgt = !is.null(ld$weight), 
            prey_stock__fleet_stock = as.symbol(paste0("prey_stock__", 
                fleet_stock$name)))), recursing = TRUE)
        out[[step_id(run_at, "g3l_distribution", nll_name, 1, 
            fleet_stock, prey_stock)]] <- f_substitute(out[[step_id(run_at, 
            "g3l_distribution", nll_name, 1, fleet_stock, prey_stock)]], 
            list(stockidx_f = stockidx_f))
        out[[step_id(run_at, "g3l_distribution", nll_name, 1, 
            fleet_stock, prey_stock)]] <- g3_step(out[[step_id(run_at, 
            "g3l_distribution", nll_name, 1, fleet_stock, prey_stock)]])
    }
    nllstock <- g3_storage(paste("nll", nll_name, sep = "_"))
    if (nll_breakdown) 
        nllstock <- g3s_modeltime(nllstock)
    nllstock__num <- stock_instance(nllstock, 0)
    nllstock__wgt <- stock_instance(nllstock, 0)
    nllstock__weight <- stock_instance(nllstock, 0)
    compare_f <- g3_step(f_substitute(~{
        debug_label(prefix, "Compare ", modelstock, " to ", obsstock)
        if (done_aggregating_f) {
            stock_iterate(modelstock, stock_intersect(obsstock, 
                stock_intersect(nllstock, if (function_comare_f) 
                  g3_with(`:=`(cur_cdist_nll, function_f), {
                    nll <- nll + (weight) * cur_cdist_nll
                    stock_ss(nllstock__x) <- stock_ss(nllstock__x) + 
                      cur_cdist_nll
                    stock_ss(nllstock__weight) <- weight
                    if (report) 
                      g3_report(obsstock__x)
                  }))))
            if (!report) {
                debug_trace("Zero counters for next reporting period")
                stock_with(modelstock, modelstock__x[] <- 0)
            }
        }
    }, list(done_aggregating_f = ld$done_aggregating_f, function_comare_f = if (is.null(attr(function_f, 
        "do_compare_f"))) TRUE else attr(function_f, "do_compare_f"), 
        function_f = function_f, report = report, weight = weight)))
    compare_f <- f_substitute(compare_f, list(stockidx_f = as.symbol(paste0(modelstock$name, 
        "__stock_idx"))))
    if (!is.null(ld$number)) {
        out[[step_id(run_at, "g3l_distribution", nll_name, 2, 
            "num")]] <- generic_var_replace(compare_f, "num")
    }
    if (!is.null(ld$weight)) {
        out[[step_id(run_at, "g3l_distribution", nll_name, 2, 
            "wgt")]] <- generic_var_replace(compare_f, "wgt")
    }
    return(as.list(out))
}
