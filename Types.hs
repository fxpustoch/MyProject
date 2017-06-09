module Types where

data SABR_ParameterSet =
  SABR_ParameterSet { volatility :: Double
                    , skew :: Double
                    , convexityPut :: Double
                    , convexityCall :: Double
                    } deriving (Show)

data OSE_Market =
  OSE_Market  { strikeMin :: Double
               , strikeMax :: Double
               , strikeStep :: Double
               } deriving (Show)
