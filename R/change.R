#' @name change
#' @aliases change
#' @title Computes the aggregate change in assets or liabilities, due to a respective predicted change in interest rate level
#' @description Takes the positions of assets or liabilities together with the respective durations and yields
#'     and computes the expected overall change in the value of assets or liabilities resulting from the predicted change in interest rate level
#' @param x Vector containing asset or liabilities positions in asset or liability portfolio
#' @param y Vector containing duration of asset or liabilities in asset or liability portfolio
#' @param z Vector containing the yield of the asset or liabilities in asset or liability portfolio
#' @param r The predicted change in ineterst rate level
#'
#' @return aggregate change in assets or liabilities
#' @examples change(c(150,350,600), c(0.25, 2.5, 0.75), c(0.01, 0.035, 0.65), 0.0015)
#' @export

change <- function(x, y, z, r){

  u <- length(x)

  r_shock <- r/(1 + z[1:u])

  individualDelta <- -y[1:u] * x[1:u] * r_shock

  return(sum(individualDelta))
}
