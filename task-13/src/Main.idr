module Main

import Task13Solver
import Numbers


data FPSolution
  = TailRecursion
  | Recursion
  | Folding
  | Mapping
  | Loops
  | InfiniteList


task13 : (1 solution : FPSolution) -> Integer
task13 TailRecursion = tailRecursiveSolution givenNumbers
task13 Recursion = recursiveSolution givenNumbers
task13 Folding = foldingSolution givenNumbers
-- I need to merge data not only map it so I can imagine the way to use map but
-- it will be recursive
task13 Mapping = ?mappingSolution givenNumbers
task13 Loops = ?loopSolution givenNumbers
-- I have finite list with 100 elems << oo
task13 InfiniteList = ?infiniteListSolution givenNumbers


main : IO ()
main = do
  let solution = Folding
      result = task13 solution
      strRes = substr 0 10 (show result)
      strAns = show first10DigitsOfSum

  putStr strRes
  putStr (if strRes == strAns then " = " else " /= ")
  putStrLn strAns


