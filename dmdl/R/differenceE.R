#' @name differenceE
#' @aliases differenceE
#' @title Computes the change in equity
#' @description Takes the aggregare changes in assets and liabilities, subtracting liabilities from assets, returning the change in equity.
#'     Note: used when the predicted change in interest level for assets and liabilities asre different. (spread > 0)
#' @param x Vector containing asset positions from asset portfolio
#' @param y Vector containing duration of assets from the asset portfolio
#' @param z Vector containing asset yields from the asset portfolio
#' @param r1 The predicted change in interest rate level for assets
#' @param h Vector containing values of liabilities from the liabilities portfolio
#' @param i Vector containing duration of liabilities from the liabilities portfolio
#' @param j Vector containing the yields of liabilities from the liabilities portfolio
#' @param r2 The predicted change in interest rate level for liabilities
#'
#' @return The change in equity
#' @examples differenceE(c(150,350,600), c(0.25,2.5,0.75), c(3,0.45,0.6),0.0015, c(200,375,120), c(0.1,2,0.75),c(2,1.2,0.35),0.0025)
#' @export

differenceE <- function(x, y, z, r1, h, i, j, r2){

  u <- length(x)

  r1_shock <- r1/(1 + z[1:u])

  Delta_A <- sum(-y[1:u] * x[1:u] * r1_shock)

  n <- length(h)

  r2_shock <- r2/(1 + j[1:n])

  Delta_L <- sum(-i[1:n] * h[1:n] * r2_shock)

  return(Delta_A - Delta_L)
}
