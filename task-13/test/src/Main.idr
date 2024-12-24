module Main

import Data.List
import Data.SOP
import Data.String
import Data.Vect
import Hedgehog
import Task13Solution
import Numbers

%default total

genInput : Gen (Numbers)
genInput = element [givenNumbers]

validRes : Integer -> Bool
validRes x = let 
  res = x
  resStr = substr 0 10 (show res)
  ansStr = show first10DigitsOfSum
  in resStr == ansStr


propTailRecursion : Property
propTailRecursion = property $ do
  x <- forAll genInput
  assert $ validRes $ tailRecursiveSolution x

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
    [ ("Tail Recursion Prop", propTailRecursion)
    , ("Recursion Prop",      propRecursion)
    , ("Folding Prop",        propFolding)
    ]
  ]
