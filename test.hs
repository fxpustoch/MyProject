
import Types as ParamBlock
import VolatilityModel

import System.IO

paramSet :: SABR_ParameterSet
paramSet = SABR_ParameterSet
                          0.16 -- volatility
                          -0.08 -- skew
                          0.85 -- Put convexity
                          0.70 -- Call convexity

forward :: Double
forward = Double 30500

strike :: Double
strike = Double 30500

expiry :: Double
expiry = Double 0.015

main :: IO()
main = do
  print SABR_Volatility forward strike expiry paramSet
