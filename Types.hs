

data SABR_ParameterSet =
  SABR_ParameterSet { volatility :: Double
                    , Skew :: Double
                    , ConvexityPut :: Double
                    , ConvexityCall :: Double
                    } deriving (Show)
