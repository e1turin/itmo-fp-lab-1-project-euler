module Main

import Numbers
import Data.List.Lazy

%default total

data FPSolution
  = TailRecursion
  | Recursion
  | Folding
  | Mapping
  | Loops
  | InfiniteList


tailRecursiveSolution : Numbers -> Integer
tailRecursiveSolution (GivenNumbers nums) = go nums 0
  where
    go : LazyList Integer -> Integer -> Integer
    go [] acc = acc
    go (x :: xs) acc = go xs (acc + x)

recutsiveSolution : Numbers -> Integer
recutsiveSolution (GivenNumbers []) = 0
recutsiveSolution (GivenNumbers (x :: xs)) = assert_total $ -- TODO: remove assertion somehow
  recutsiveSolution (GivenNumbers xs) + x

foldingSolution : Numbers -> Integer
foldingSolution (GivenNumbers nums) = foldl (+) 0 nums

task13 : (1 solution : FPSolution) -> Integer
task13 TailRecursion = tailRecursiveSolution givenNumbers
task13 Recursion = recutsiveSolution givenNumbers
task13 Folding = foldingSolution givenNumbers
-- I need to merge data not only map it so I can imagine the way to use map but
-- it will be recursive
task13 Mapping = ?mappingSolution givenNumbers
task13 Loops = ?loopSolution givenNumbers
-- I have finite list with 100 elems << oo
task13 InfiniteList = ?infiniteListSolution givenNumbers


main : IO ()
main = let
  solution = Folding
  result = task13 solution
  strRes = substr 0 10 (show result)
  strAns = show first10DigitsOfSum
  in do
    putStr strRes
    if strRes == strAns
      then putStr " = "
      else putStr " /= "
    putStrLn strAns


