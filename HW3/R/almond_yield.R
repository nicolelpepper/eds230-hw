
#' Create function that computes almond yield anomaly response to climate. 
#' Based on Lobell et al., 2006 
#'
#' @param Temp_Feb Numeric - Average min daily temperature for February (C)
#' @param Precip_Jan Numeric - Total monthly precipitation for January (mm)
#' @param T_Coef1 Numeric - Regression coefficient on February minimum temperature (Celcius).
#' @param T_Coef2 Numeric - Regression coefficient on February maximum temperature squared (Celcius).
#' @param P_Coef1 Numeric - Regression coefficient on January total precipitation (mm).
#' @param P_Coef2 Numeric-  Regression coefficient on January total precipitation squared (mm).
#' @param intercept Numeric - Regression intercept term.

#' @return almond_yield Numeric - almond yield anomaly response to climate (tons/acre)
#'
#' @export
#' 
almond_yield <- function(Temp_Feb, Precip_Jan, T_Coef1, T_Coef2, P_Coef1, P_Coef2, I) {

yield_anomaly <- T_Coef1 * Temp_Feb + T_Coef2 * Temp_Feb^2  + P_Coef1 * Precip_Jan + P_Coef2 * Precip_Jan^2 + I
  return(yield_anomaly)

}
