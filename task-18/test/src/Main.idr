module Main

import Data.List
import Data.String
import Data.Vect
import Hedgehog
import Task18Solution
import Triangle


%default total


genInput : Gen (Triangle)
genInput = element [givenTriangleMatrix]

validRes : Integer -> Bool
validRes x = let
  res = x
  ans = maxPath
  in res == ans


propRecursion : Property
propRecursion = property $ do
  x <- forAll genInput
  assert $ validRes $ recursiveSolution x

propFolding : Property
propFolding = property $ do
  x <- forAll genInput
  assert $ validRes $ foldingSolution x


main : IO ()
main = test
  [ "task-13 solutions smoke tests" `MkGroup`
    [ ("Recursion Prop", propRecursion)
    -- , ("Folding Prop",   propFolding)
    ]
  ]
