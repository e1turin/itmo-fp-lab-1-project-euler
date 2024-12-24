module Main

import Data.List
import Data.SOP
import Data.String
import Data.Vect
import Hedgehog

%default total

charGen : Gen (List Char)
charGen = list (linear 0 30) alphaNum

propReverse : Property
propReverse = property $ do
  xs <- forAll charGen
  xs === reverse (reverse xs)

checkReverse : IO Bool
checkReverse = check propReverse

main : IO ()
main = test . pure $
  MkGroup
    "test"
    [ ("kek", propReverse)
    ]
