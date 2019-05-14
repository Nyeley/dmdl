#' @name deltaE
#' @aliases deltaE
#' @title Computes the change in equity
#' @description Takes the duration of assets and the duration of liabilities,
#'     applies them to the leverage adjusted duration gap computation, ultimately applies
#'     the multiplication of negative ladg and total assets and the predicted change in interest rate level
#' @param x Vector containing asset positions in asset portfolio
#' @param y Vector containing durations of assets from the asset portfolio
#' @param z Vector containing liability positions from the liabilities portfolio
#' @param w Vector containing duration of liabilities from the liabilities portfolio
#' @param r The predicted change in interest rate level across both assets and liabilities
#'
#' @return leverage adjusted duration gap
#' @examples deltaE(c(150,350,600), c(0.25, 2.5, 0.75), c(200, 375, 120), c(0.1, 2, 0.75), -0.003)
#' @export

deltaE <- function(x,y,z,w,r){

  u <- length(x)

  proporAssets <- x[1:u]/sum(x[1:u])

  durationAssets <- (sum(proporAssets[1:u]*y[1:u]))

  n <- length(z)

  proporLiabilities <- z[1:n]/sum(z[1:n])

  durationLiabilities <- sum(proporLiabilities[1:n]*w[1:n])

  k <- sum(z)/sum(x)

  ladg <- durationAssets - (durationLiabilities*k)

  A <- sum(x)

  return(-ladg * A * r)
}
