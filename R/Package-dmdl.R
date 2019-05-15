#' Duration model
#'
#' This package is a tool for economists to measure and observe the interest rate risk on the net worth of a financial intermediary.
#' The dmdl package provides five functions to compute the most important components in the duration model:
#' change in assets and/or liabilities position, overall change in equity position,
#' duration of assets and/or liabilities, and the leverage adjusted duration gap
#'
#' @section Data:
#' * Assets:
#' Data set containg three numerical columns, value, duration, and yield of consolidated balance sheet assets.
#' The data set is  used in the examples provided in the vignette.
#'
#' * Liabilities:
#' A data set containg three numerical columns from the consolidated balance sheet liabilities values,
#' liabilities durations, and liabilities yields.
#'
#' @section Functions:
#' * change:
#' Computes the aggregate change in assets or liabilities, due to a respective predicted change in interest rate level
#'
#' usage:
#' change(x, y, z, r)
#'
#' parameters:
#' x = Vector containing asset or liabilities positions in asset or liability portfolio
#'
#' y = Vector containing duration of asset or liabilities in asset or liability portfolio
#'
#' z = Vector containing the yield of the asset or liabilities in asset or liability portfolio
#'
#' r = The predicted change in ineterst rate level
#'
#' * deltaE:
#' Computes the change in equity when ineterest rate spread > 0
#'
#' usage:
#' deltaE(x, y, z, w, r)
#'
#' parameters:
#' x = Vector containing asset positions in asset portfolio
#'
#' y = Vector containing durations of assets from the asset portfolio
#'
#' z = Vector containing liability positions from the liabilities portfolio
#'
#' w = Vector containing duration of liabilities from the liabilities portfolio
#'
#' r = The predicted change in interest rate level across both assets and liabilities
#'
#' * differenceE:
#' Computes the change in equity, subtracting aggr. change of liabilities from aggr. change of assets
#'
#' usage:
#' differenceE(x, y, z, r1, h, i, j, r2)
#'
#' parameters:
#' x = Vector containing asset positions from asset portfolio
#'
#' y = Vector containing duration of assets from the asset portfolio
#'
#' z = Vector containing asset yields from the asset portfolio
#'
#' r1 = The predicted change in interest rate level for assets
#'
#' h = Vector containing values of liabilities from the liabilities portfolio
#'
#' i = Vector containing duration of liabilities from the liabilities portfolio
#'
#' j = Vector containing the yields of liabilities from the liabilities portfolio
#'
#' r2 = The predicted change in interest rate level for liabilities
#'
#' * duration:
#' Computes the duration of assets or liabilities
#'
#' usage:
#' duration(x, y)
#'
#' parameters:
#' x = Vector containing asset or liabilities positions in liability or asset portfolio
#'
#' y = Vector containing duration of asset or liabilities in liability or asset portfolio
#'
#' * ladg:
#' Computes the leverage adjusted duration gap
#'
#'  usage:
#'  ladg(x, y, z, w)
#'
#' parameters:
#' x = Vector containing asset positions from the asset portfolio
#'
#' y = Vector containing duration of assets from the asset portfolio
#'
#' z = Vector containing liability positions from the liabilities portfolio
#'
#' w = Vector containing duration of liabilities from the liabilities portfolio
#'
#' @section Vignettes
#' URL: http://rpubs.com/phoebe_staenz/dmdl_vignette
#'
#' @examples
#' change(c(150,350,600), c(0.25, 2.5, 0.75), c(0.01, 0.035, 0.65), 0.0015)
#'
#' deltaE(c(150,350,600), c(0.25, 2.5, 0.75), c(200, 375, 120), c(0.1, 2, 0.75), -0.003)
#'
#' differenceE(c(150,350,600), c(0.25,2.5,0.75), c(3,0.45,0.6),0.0015, c(200,375,120), c(0.1,2,0.75),c(2,1.2,0.35),0.0025)
#'
#' duration(c(150,350,600), c(0.25, 2.5, 0.75))
#'
#' ladg(c(150,350,600), c(0.25, 2.5, 0.75), c(200, 375, 120), c(0.1, 2, 0.75))
#'
#' @docType Package
#' @name Package-dmdl
NULL
