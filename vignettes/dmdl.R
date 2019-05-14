## ----echo=TRUE, results= 'asis'------------------------------------------
library(dmdl)
data(Assets)
data(Liabilities)

## ----echo = FALSE, results= 'asis'---------------------------------------
library(knitr)

kable(Assets[1:3,1:4], caption = "Assets")

## ----echo = FALSE, results= 'asis'---------------------------------------
library(knitr)

kable(Liabilities[1:3,1:4], caption = "Liabilities")

## ----echo=TRUE, results= 'asis'------------------------------------------
duration <- function(x,y){

  u <- length(x)

  p <- x[1:u]/sum(x[1:u])

  return(sum(p[1:u]*y[1:u]))
}

## ----echo=TRUE, results= 'asis'------------------------------------------
duration(Assets$Asset, Assets$Duration)

## ----echo=TRUE, results= 'asis'------------------------------------------
duration(Liabilities$Liability, Liabilities$Duration)

## ----echo=TRUE, results= 'asis'------------------------------------------
change <- function(x, y, z, r){
    u <- length(x)
    
    r_shock <- r/(1 + z[1:u])
    
    individualDelta <- -y[1:u] * x[1:u] * r_shock
    
    return(sum(individualDelta))
}

## ----echo=TRUE, results= 'asis'------------------------------------------
change(Assets$Asset, Assets$Duration, Assets$Yield, 0.0015)

## ----echo=TRUE, results= 'asis'------------------------------------------
change(Liabilities$Liability, Liabilities$Duration, Liabilities$Yield, 0.0025)

## ----echo=TRUE, results= 'asis'------------------------------------------
differenceE <- function(x, y, z, r1, h, i, j, r2){

  u <- length(x)

  r1_shock <- r1/(1 + z[1:u])

  Delta_A <- sum(-y[1:u] * x[1:u] * r1_shock)

  n <- length(h)

  r2_shock <- r2/(1 + j[1:n])

  Delta_L <- sum(-i[1:n] * h[1:n] * r2_shock)

  return(Delta_A - Delta_L)
  }

## ----echo=TRUE, results= 'asis'------------------------------------------
differenceE(Assets$Asset, Assets$Duration, Assets$Yield, 0.0015, Liabilities$Liability, Liabilities$Duration, Liabilities$Yield, 0.0025)

## ----echo=TRUE, results= 'asis'------------------------------------------
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

## ----echo=TRUE, results= 'asis'------------------------------------------
ladg(Assets$Asset, Assets$Duration, Liabilities$Liability, Liabilities$Duration)

## ----echo=TRUE, results= 'asis'------------------------------------------
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

## ----echo=TRUE, results= 'asis'------------------------------------------
deltaE(Assets$Asset, Assets$Duration, Liabilities$Liability, Liabilities$Duration, -0.0030)

