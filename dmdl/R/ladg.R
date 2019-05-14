#' @name ladg
#' @aliases ladg
#' @title Computes the leverage adjusted duration gap
#' @description Takes the duration of assets and the scaled duration of liabilities,
#'     subtracting the scaled duration of liabilities from the duration of assets
#' @param x Vector containing asset positions from the asset portfolio
#' @param y Vector containing duration of assets from the asset portfolio
#' @param z Vector containing liability positions from the liabilities portfolio
#' @param w Vector containing duration of liabilities from the liabilities portfolio
#'
#' @return leverage adjusted duration gap
#' @examples change(c(150,350,600), c(0.25, 2.5, 0.75), c(200, 375, 120), c(0.1, 2, 0.75))
#' @export

ladg <- function(x, y, z, w){

  u <- length(x)

  proporAssets <- x[1:u]/sum(x[1:u])

  durationAssets <- (sum(proporAssets[1:u]*y[1:u]))

  n <- length(z)

  proporLiabilities <- z[1:n]/sum(z[1:n])

  durationLiabilities <- sum(proporLiabilities[1:n]*w[1:n])

  k <- sum(z)/sum(x)

  return(durationAssets - (durationLiabilities*k))
}
