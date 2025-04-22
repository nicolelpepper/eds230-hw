#' Create function that computes almond profit. 
#' Based on Lobell et al., 2006 
#'
#' @param cost_acres Numeric - 
#' @param baseline_proft (0.9)
#' @param yield_anomaly
#' @param avg_yield Numeric - list of numeric vectors representing the average yield (tons/acre)

#' @return mean_profit Numeric - profit ($)
#'
#' @export
#' 
almond_profit <- function(Temp_Feb, Precip_Jan,
                                T_Coef1 = -0.015, T_Coef2 = -0.0046, P_Coef1 = -0.07, P_Coef2 = 0.0043, I = 0.28,
                                price_per_ton = 1000, cost_per_acre = 500) {
  
  # ---- Calculate yield ----
  # Import almond yield model
  source(here("HW3","R","almond_yield.R"))
  
  # Define baseline yield based on Lobell
  baseline_yield <- 0.9 
  # Apply almond yield function to calculate yield anomaly
  yield_anomaly <- almond_yield(Temp_Feb, Precip_Jan, T_Coef1, T_Coef2, P_Coef1, P_Coef2, I)
  # Calculate total yield using baseline from Lobell
  total_yield = yield_anomaly + baseline_yield
  
  # ---- Calculate profit----
  profit <- round( total_yield * price_per_ton - cost_per_acre, 2)

  return(profit)
 
}
