module Main

import Numbers
import Data.List.Lazy

%default total

data FPSolution
  = TailRecursion
  | Recursion
  | Folding
  | Mapping
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
task13 solution = case solution of
  TailRecursion => tailRecursiveSolution givenNumbers
  Recursion => recutsiveSolution givenNumbers
  Folding => foldingSolution givenNumbers
  Mapping => ?mappingSolution givenNumbers -- I need to merge data not only map it
                                           -- so I can imagine the way to use map
                                           -- but it will be recursive
  InfiniteList => ?infiniteListSolution givenNumbers -- I have finite list with 100 elems := o(oo)


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
    

