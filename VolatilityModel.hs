
module VolatilityModel where

import Types

-- | SABR Volatility of an option  based on a given set of SABR parameters
SABR_Volatility :: Double -> Double -> Double -> SABR_ParameterSet -> Double
SABR_Volatility forward strike timeToExpiry paramSet =
    paramSet.volatility * z / Xfunction(z, rho)
  where
    convex = SABR_Convexity forward paramSet.convexityPut paramSet.convexityCall
    nu = sqrt(skew * skew + convex * convex)
    rho = paramSet.skew / nu
    nuPrime = nu / sqrt(timeToExpiry)
    outTheMoney = log(forward/strike)
    z = nuPrime * outTheMoney

-- | Xfunction is an intermediary function to compute SABR Volatility
Xfunction :: Double -> Double -> Double
Xfunction z rho = log(inter + z - rho) / (1 - rho)
  where inter = sqrt(1 -2 * rho * z + z ^2)

-- | Convexity to use for pricing
SABR_Convexity :: Double -> Double
SABR_Convexity forward strike convexityPut convexityCall =
  | forward > strike = convexityCall
  | otherwise convexityPut
