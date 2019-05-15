#' A package that aids in the measurement and observation of interest rate risk on the net worth of a financial intermediary
#'
#' The dmdl package provides five functions to compute the most important components in the duration model:
#' change in assets and/or liabilities position, overall change in equity position,
#' duration of assets and/or liabilities, and the leverage adjusted duration gap
#'
#' @section Data:
#' * Assets: Data set containg three numerical columns, value, duration, and yield of consolidated balance sheet assets.
#' The data set is  used in the examples provided in the vignette.
#'
#' * Liabilities: A data set containg three numerical columns from the consolidated balance sheet liabilities values,
#' liabilities durations, and liabilities yields.
#'
#' @section Functions:
#' * change: Computes the aggregate change in assets or liabilities, due to a respective predicted change in interest rate level.
#'
#' * deltaE: Computes the change in equity
#'
#' * differenceE: Computes the change in equity
#'
#' * duration: Computes the duration of assets or liabilities
#'
#' * ladg: Computes the leverage adjusted duration gap
#'
#'
#'
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
