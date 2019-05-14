#' @name duration
#' @aliases duration
#' @title Computes the duration of assets or liabilities
#' @description Takes the positions of assets or liabilities, computes their porportions relative to the total liability portfolio or asset portfolio,
#'     and returns the aggregate duration.
#' @param x Vector containing asset or liabilities positions in liability or asset portfolio
#' @param y Vector containing duration of asset or liabilities in liability or asset portfolio
#' @return aggregate duration of assets or liabilities
#' @examples duration(c(150,350,600), c(0.25, 2.5, 0.75))
#' @export

duration <- function(x,y){

  u <- length(x)

  propor <- x[1:u]/sum(x[1:u])

  return(sum(propor[1:u]*y[1:u]))
}
